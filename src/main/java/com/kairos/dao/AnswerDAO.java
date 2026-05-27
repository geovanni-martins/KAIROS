package com.kairos.dao;

import com.kairos.model.Answer;
import com.kairos.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AnswerDAO {

	public void insert(Answer answer) {
		String sql = "INSERT INTO answer (student_id, question_id, got_right, answer_date) VALUES (?, ?, ?, ?)";

		try (Connection conn = DBConnection.connect();
		     PreparedStatement stmt = conn.prepareStatement(sql)
		) {
			stmt.setInt(1, answer.getStudentId());
			stmt.setInt(2, answer.getQuestionId());
			stmt.setBoolean(3, answer.isGotRight());
			stmt.setTimestamp(4, Timestamp.from(answer.getCreatedAt()));
			stmt.executeUpdate();
			System.out.println("Resposta cadastrada");

		} catch (SQLException e) {
			System.out.println("Erro ao inserir resposta: " + e.getMessage());
		}
	}

	public List<Answer> getAllByStudent(int studentId) {
		List<Answer> list = new ArrayList<>();
		String sql = "SELECT * FROM answer WHERE student_id = ?";

		try (Connection conn = DBConnection.connect();
		     PreparedStatement stmt = conn.prepareStatement(sql)
		) {
			stmt.setInt(1, studentId);

			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					list.add(new Answer(
							rs.getInt("id_answer"),
							rs.getInt("student_id"),
							rs.getInt("question_id"),
							rs.getBoolean("got_right"),
							rs.getTimestamp("answer_date").toInstant()
					));
				}
			}

		} catch (SQLException e) {
			System.out.println("Erro ao buscar respostas do estudante: " + e.getMessage());
		}

		return list;
	}

	public List<Answer> getAllByQuestion(int questionId) {
		List<Answer> list = new ArrayList<>();
		String sql = "SELECT * FROM answer WHERE question_id = ?";

		try (Connection conn = DBConnection.connect();
		     PreparedStatement stmt = conn.prepareStatement(sql)
		) {
			stmt.setInt(1, questionId);

			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					list.add(new Answer(
							rs.getInt("id_answer"),
							rs.getInt("student_id"),
							rs.getInt("question_id"),
							rs.getBoolean("got_right"),
							rs.getTimestamp("answer_date").toInstant()
					));
				}
			}

		} catch (SQLException e) {
			System.out.println("Erro ao buscar respostas da questão: " + e.getMessage());
		}

		return list;
	}
	
	//Essa query alimenta os gráficos de desempenho da Dashboard. 
	//Ela traz as respostas apenas dos últimos 7 dias, usando uma função nativa do banco, a INTERVAL 6 DAY
	public List<Answer> getAnswersLast7Days(int studentId) {
		List<Answer> list = new ArrayList<>();
		String sql = "SELECT got_right, answer_date FROM answer " +
				"WHERE student_id = ? AND answer_date >= DATE_SUB(CURDATE(), INTERVAL 6 DAY)";

		try (Connection conn = DBConnection.connect();
		     PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setInt(1, studentId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new Answer(
						0,
						studentId,
						0,
						rs.getBoolean("got_right"),
						rs.getTimestamp("answer_date").toInstant()
				));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}