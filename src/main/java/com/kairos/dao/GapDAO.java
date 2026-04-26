package com.kairos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.kairos.model.Gap;

public class GapDAO {

	public void create(Gap gap) {
		
		String sql = "INSERT INTO gap(student_id, topic_id, qty_solved_questions, correct_answers, identified_date, stats) VALUES (?, ?, ?, ?, ?, ?)";
		
		try(Connection conn = DBConnection.connect();
				PreparedStatement ps = conn.prepareStatement(sql)){
					
					ps.setInt(1, gap.getStudentId());
					ps.setInt(2, gap.getTopicId());
					ps.setInt(3, 0);
					ps.setInt(4, 0);
					ps.setTimestamp(5, Timestamp.from(gap.getCreatedAt()));
					ps.setString(6, "NOT_SOLVED");
					
					ps.executeUpdate();
					System.out.println("Gap saved sucessfully!");
					
				} catch(SQLException e) {
					System.err.println("Error saving gap:  " + e.getMessage());
					e.printStackTrace();
				}
	}
	
	public int countErrorByTopic(int studentId, int topicId) {
		int errorCount = 0;
		
		String sql = "SELECT COUNT(*) AS total_erros"
					+" FROM answer a"
					+" INNER JOIN question q ON a.question_id = q.id_question"
					+" WHERE a.student_id = ? AND q.topic_id = ? AND a.got_right = false";
				
		try(Connection conn = DBConnection.connect();
				PreparedStatement ps = conn.prepareStatement(sql)){
			
				ps.setInt(1, studentId);
				ps.setInt(2, topicId);
				
				try(ResultSet rs = ps.executeQuery()){
					if(rs.next()) {
						errorCount = rs.getInt("total_erros");
					}
					
				}
			
		} catch(SQLException e) {
			System.out.println("Error counting errors by topic: " + e.getMessage());
			e.printStackTrace();
		}
			
		return errorCount;
	}
	
	public void updatePerformance(int studentId, int topicId, boolean gotRight ) {
		
		String sql = "UPDATE gap SET qty_solved_questions = qty_solved_questions + 1, "
				+ "correct_answers = correct_answers + ? "
				+ "WHERE student_id = ? "
				+ "AND topic_id = ? "
				+ "AND stats = 'NOT_SOLVED'";
		
		try(Connection conn = DBConnection.connect();
				PreparedStatement ps = conn.prepareStatement(sql)){
			
			ps.setInt(1, gotRight ? 1 : 0); // operador ternario
			ps.setInt(2, studentId);
			ps.setInt(3, topicId);
			
			ps.executeUpdate();
			System.out.println("Gap performance updated for student " + studentId);
		} catch(SQLException e) {
			System.err.println("Error updating gap performance: " +e.getMessage());
			e.printStackTrace();
		}
	}
	
	public void checkAndSolveGap(int studentId, int topicId) {
		
		String sql = "SELECT qty_solved_questions, correct_answers "
					+"FROM gap WHERE student_id = ? "
					+"AND topic_id = ? AND stats = 'NOT_SOLVED'";
		
		try(Connection conn = DBConnection.connect();
				PreparedStatement ps = conn.prepareStatement(sql)){
			
			ps.setInt(1, studentId);
			ps.setInt(2, topicId);
			
			try (ResultSet rs = ps.executeQuery()){
				if(rs.next()) {
					int total = rs.getInt("qty_solved_questions");
					int corrects = rs.getInt("correct_answers");
					
					double performance = (total > 0) ? (double) corrects / total : 0;
					
					if(total >= 30 && performance >= 0.70) {
						solveGap(studentId, topicId);
					}
					
				}
			}
			
		} catch (SQLException e) {
			System.err.println("Error checking gap resolution: " + e.getMessage());
			e.printStackTrace();
		}
	}
	
	private void solveGap(int studentId, int topicId) { // metodo auxiliar
		
		String sql = "UPDATE gap SET stats = 'SOLVED' "
				+ "WHERE student_id = ? AND topic_id = ?";
		
		try(Connection conn = DBConnection.connect();
				PreparedStatement ps = conn.prepareStatement(sql)){
			
			ps.setInt(1, studentId);
			ps.setInt(2, topicId);
			
			ps.executeUpdate();
			System.out.println("Congratulations! Gap for student " + studentId + " on topic " + topicId + " is now SOLVED.");
			
		} catch (SQLException e) {
			System.err.println("Error solving gap: " + e.getMessage());
			e.printStackTrace();
		}
	}
	
	public List<Gap> getByStudent(int studentId) {
		List<Gap> gapList = new ArrayList<>();
		
		String sql = "SELECT * FROM gap WHERE student_id = ?";
	
		try(Connection conn = DBConnection.connect();
				PreparedStatement ps = conn.prepareStatement(sql)){
			
			ps.setInt(1, studentId);
			
			try(ResultSet rs = ps.executeQuery()){
				
				while(rs.next()) {
					Gap gap = new Gap(
						rs.getInt("id_gap"),
						rs.getInt("student_id"),
						rs.getInt("topic_id"),
						rs.getInt("qty_solved_questions"),
						rs.getInt("correct_answers"),
						rs.getTimestamp("identified_date").toInstant(),
						rs.getString("stats")
					);
					gapList.add(gap);
				}
			}
			
		} catch(SQLException e) {
			System.err.println("Error fetching gaps by student: " + e.getMessage());
			e.printStackTrace();
		}
		
		return gapList;
	}
}