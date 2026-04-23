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
		String sql = "INSERT INTO answers (user_id, question_id, is_correct, created_at) VALUES (?, ?, ?, ?)";
		
		try (Connection conn = DBConnection.connect();
				PreparedStatement ps = conn.prepareStatement(sql)){
			
			ps.setInt(1, answer.getUserId());
			ps.setInt(2, answer.getQuestionId());
			ps.setBoolean(3, answer.isCorrect());
			
			ps.setTimestamp(4, Timestamp.from(answer.getCreatedAt()));
			
			ps.executeUpdate();
			System.out.println("Answer saved successfully!!");
		} catch (SQLException e) {
			System.err.println("Error saving answer: " + e.getMessage());
			e.printStackTrace();
		}
	}
	
	public List<Answer>getByUser(int userId) {
		List<Answer> answer = new ArrayList<>();
		String sql = "SELECT * FROM answer WHERE user_id = ?";
		
		try(Connection conn = DBConnection.connect();
				PreparedStatement ps = conn.prepareStatement(sql)){
			
			ps.setInt(1, userId);
			
			try(ResultSet rs = ps.executeQuery()){
				while (rs.next()) {
					Answer ans = new Answer(
						rs.getInt("id"),
						rs.getInt("user_id"),
						rs.getInt("question_id"),
						rs.getBoolean("is_correct"),
						rs.getTimestamp("created_at").toInstant()
					);
					answer.add(ans);
				}
			}
	} catch (SQLException e) {
        System.err.println("Error fetching answers by user: " + e.getMessage());
        e.printStackTrace();
	}
	return answer;
	}
	
	public List<Answer> getByQuestion(int questionId){
		List<Answer> answer = new ArrayList<>();
		
		String sql = "SELECT * FROM answers WHERE question_id = ?";
		
		try(Connection conn = DBConnection.connect();
				PreparedStatement ps = conn.prepareStatement(sql)){
			
			ps.setInt(1, questionId);
			
			try(ResultSet rs = ps.executeQuery()){
					while(rs.next()) {
							Answer ans = new Answer(
									rs.getInt("id"),
									rs.getInt("user_id"),
									rs.getInt("question_id"),
									rs.getBoolean("is_correct"),
									rs.getTimestamp("created_at").toInstant()
									);
									answer.add(ans);
					}
			}
		} catch(SQLException e) {
			System.err.println("Erro fetching answers by question: " + e.getMessage());
			e.printStackTrace();
		}
		return answer;
	}
}
	

