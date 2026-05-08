package com.kairos.dao;

import com.kairos.model.Gap;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GapDAO {

	public void insert(Gap gap) {
		String sql = "INSERT INTO gap (student_id, topic_id, qty_solved_questions, correct_answers, identified_date, stats) VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection conn = DBConnection.connect();
		     PreparedStatement stmt = conn.prepareStatement(sql)
		) {
			stmt.setInt(1, gap.getStudentId());
			stmt.setInt(2, gap.getTopicId());
			stmt.setInt(3, 0);
			stmt.setInt(4, 0);
			stmt.setTimestamp(5, Timestamp.from(gap.getCreatedAt()));
			stmt.setString(6, "NOT_SOLVED");
			stmt.executeUpdate();
			System.out.println("Gap cadastrado");

		} catch (SQLException e) {
			System.out.println("Erro ao inserir gap: " + e.getMessage());
		}
	}

	public List<Gap> getAllByStudent(int studentId) {
		List<Gap> list = new ArrayList<>();
		
		String sql = "SELECT g.*, t.name AS topic_name, t.subject "
				+ "FROM gap g "
				+ "INNER JOIN topic t ON g.topic_id = t.id_topic "
				+ "WHERE g.student_id = ?";

		try (Connection conn = DBConnection.connect();
		     PreparedStatement stmt = conn.prepareStatement(sql)
		) {
			stmt.setInt(1, studentId);

			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					Gap gap = new Gap(
							rs.getInt("id_gap"),
							rs.getInt("student_id"),
							rs.getInt("topic_id"),
							rs.getInt("qty_solved_questions"),
							rs.getInt("correct_answers"),
							rs.getTimestamp("identified_date").toInstant(),
							rs.getString("stats")
					);
					
					gap.setTopicName(rs.getString("topic_name"));
					gap.setSubject(rs.getString("subject"));
					
					list.add(gap);
				}
			}

		} catch (SQLException e) {
			System.out.println("Erro ao buscar gaps do estudante: " + e.getMessage());
		}

		return list;
	}

	public int countErrorsByTopic(int studentId, int topicId) {
		int errorCount = 0;
		String sql =
				"SELECT COUNT(*) AS total_erros " +
						"FROM answer a " +
						"INNER JOIN question q ON a.question_id = q.id_question " +
						"WHERE a.student_id = ? AND q.topic_id = ? AND a.got_right = false";

		try (Connection conn = DBConnection.connect();
		     PreparedStatement stmt = conn.prepareStatement(sql)
		) {
			stmt.setInt(1, studentId);
			stmt.setInt(2, topicId);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					errorCount = rs.getInt("total_erros");
				}
			}

		} catch (SQLException e) {
			System.out.println("Erro ao contar erros por tópico: " + e.getMessage());
		}

		return errorCount;
	}

	public void updatePerformance(int studentId, int topicId, boolean gotRight) {
		String sql =
				"UPDATE gap SET qty_solved_questions = qty_solved_questions + 1, " +
						"correct_answers = correct_answers + ? " +
						"WHERE student_id = ? AND topic_id = ? AND stats = 'NOT_SOLVED'";

		try (Connection conn = DBConnection.connect();
		     PreparedStatement stmt = conn.prepareStatement(sql)
		) {
			stmt.setInt(1, gotRight ? 1 : 0);
			stmt.setInt(2, studentId);
			stmt.setInt(3, topicId);
			stmt.executeUpdate();
			System.out.println("Performance do gap atualizada");

		} catch (SQLException e) {
			System.out.println("Erro ao atualizar performance do gap: " + e.getMessage());
		}
	}

	public void checkAndSolveGap(int studentId, int topicId) {
		String sql =
				"SELECT qty_solved_questions, correct_answers " +
						"FROM gap WHERE student_id = ? AND topic_id = ? AND stats = 'NOT_SOLVED'";

		try (Connection conn = DBConnection.connect();
		     PreparedStatement stmt = conn.prepareStatement(sql)
		) {
			stmt.setInt(1, studentId);
			stmt.setInt(2, topicId);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					int total = rs.getInt("qty_solved_questions");
					int corrects = rs.getInt("correct_answers");
					double performance = (total > 0) ? (double) corrects / total : 0;

					if (total >= 30 && performance >= 0.70) {
						solveGap(studentId, topicId);
					}
				}
			}

		} catch (SQLException e) {
			System.out.println("Erro ao verificar resolução do gap: " + e.getMessage());
		}
	}

	private void solveGap(int studentId, int topicId) {
		String sql = "UPDATE gap SET stats = 'SOLVED' WHERE student_id = ? AND topic_id = ?";

		try (Connection conn = DBConnection.connect();
		     PreparedStatement stmt = conn.prepareStatement(sql)
		) {
			stmt.setInt(1, studentId);
			stmt.setInt(2, topicId);
			stmt.executeUpdate();
			System.out.println("Gap resolvido para estudante " + studentId + " no tópico " + topicId);

		} catch (SQLException e) {
			System.out.println("Erro ao resolver gap: " + e.getMessage());
		}
	}
}