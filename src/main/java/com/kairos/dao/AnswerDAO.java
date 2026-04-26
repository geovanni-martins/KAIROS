package com.kairos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.kairos.model.Answer;

public class AnswerDAO {
	
	public void create(Answer answer) {

		String sql = "INSERT INTO answer (student_id, question_id, got_right, answer_date, type, base_answer) VALUES (?, ?, ?, ?, ?, ?)";
		
		try (Connection conn = DBConnection.connect();
				PreparedStatement ps = conn.prepareStatement(sql)){
			
			ps.setInt(1, answer.getStudentId());
			ps.setInt(2, answer.getQuestionId());
			ps.setBoolean(3, answer.isGotRight());
			ps.setTimestamp(4, Timestamp.from(answer.getCreatedAt()));
			ps.setString(5, answer.getType());
			ps.setString(6, answer.getBaseAnswer());
			
			ps.executeUpdate();
			System.out.println("Answer saved successfully!!");
			
		} catch (SQLException e) {
			System.err.println("Error saving answer: " + e.getMessage());
			e.printStackTrace();
		}
	}
	

	public List<Answer> getByStudent(int studentId) {
		List<Answer> answerList = new ArrayList<>();
		String sql = "SELECT * FROM answer WHERE student_id = ?";
		
		try(Connection conn = DBConnection.connect();
				PreparedStatement ps = conn.prepareStatement(sql)){
			
			ps.setInt(1, studentId);
			
			try(ResultSet rs = ps.executeQuery()){
				while (rs.next()) {

					Answer ans = new Answer(
						rs.getInt("id_answer"),
						rs.getInt("student_id"),
						rs.getInt("question_id"),
						rs.getBoolean("got_right"),
						rs.getTimestamp("answer_date").toInstant(),
						rs.getString("type"),
						rs.getString("base_answer")
					);
					answerList.add(ans);
				}
			}
		} catch (SQLException e) {
			System.err.println("Error fetching answers by student: " + e.getMessage());
			e.printStackTrace();
		}
		return answerList;
	}
	
	public List<Answer> getByQuestion(int questionId){
		List<Answer> answerList = new ArrayList<>();
		String sql = "SELECT * FROM answer WHERE question_id = ?";
		
		try(Connection conn = DBConnection.connect();
				PreparedStatement ps = conn.prepareStatement(sql)){
			
			ps.setInt(1, questionId);
			
			try(ResultSet rs = ps.executeQuery()){
				while(rs.next()) {

					Answer ans = new Answer(
						rs.getInt("id_answer"),
						rs.getInt("student_id"),
						rs.getInt("question_id"),
						rs.getBoolean("got_right"),
						rs.getTimestamp("answer_date").toInstant(),
						rs.getString("type"),
						rs.getString("base_answer")
					);
					answerList.add(ans);
				}
			}
		} catch(SQLException e) {
			System.err.println("Error fetching answers by question: " + e.getMessage());
			e.printStackTrace();
		}
		return answerList;
	}
}