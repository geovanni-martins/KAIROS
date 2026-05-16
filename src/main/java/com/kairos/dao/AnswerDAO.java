package com.kairos.dao;

import com.kairos.model.Answer;
import com.kairos.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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

	public Map<String, int[]> getWeeklyProgress(int studentId) {
		Map<String, int[]> tempData = new LinkedHashMap<>();
		java.time.LocalDate today = java.time.LocalDate.now();

		for (int i = 6; i >= 0; i--) {
			String dateStr = today.minusDays(i).toString();
			tempData.put(dateStr, new int[]{0, 0});
		}

		String sql = "SELECT DATE(answer_date) as date, " +
				"SUM(CASE WHEN got_right = 1 THEN 1 ELSE 0 END) as hits, " +
				"SUM(CASE WHEN got_right = 0 THEN 1 ELSE 0 END) as misses " +
				"FROM answer " +
				"WHERE student_id = ? AND answer_date >= DATE_SUB(CURDATE(), INTERVAL 6 DAY) " +
				"GROUP BY DATE(answer_date) " +
				"ORDER BY date ASC";

		try (Connection conn = DBConnection.connect();
		     PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, studentId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String date = rs.getString("date");
				if (tempData.containsKey(date)) {
					tempData.put(date, new int[]{rs.getInt("hits"), rs.getInt("misses")});
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		Map<String, int[]> finalData = new LinkedHashMap<>();
		String[] nomesDias = {"Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"};

		for (Map.Entry<String, int[]> entry : tempData.entrySet()) {
			java.time.LocalDate date = java.time.LocalDate.parse(entry.getKey());
			int index = date.getDayOfWeek().getValue() - 1;
			finalData.put(nomesDias[index], entry.getValue());
		}

		return finalData;
	}
}