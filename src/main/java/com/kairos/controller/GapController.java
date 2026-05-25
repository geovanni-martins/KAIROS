package com.kairos.controller;

import com.kairos.dao.GapDAO;
import com.kairos.model.Gap;

import java.util.List;

public class GapController {

	private static final int MIN_QUESTIONS_TO_SOLVE = 30;
	private static final double MIN_PERFORMANCE_TO_SOLVE = 0.70;

	private GapDAO gapDAO;

	public GapController() {
		gapDAO = new GapDAO();
	}

	public void processGapUpdate(int studentId, int topicId, boolean gotRight) {

			gapDAO.updatePerformance(studentId, topicId, gotRight);
			checkAndSolveGap(studentId, topicId);
	}

	public List<Gap> getGapsByStudent(int studentId) {
			return gapDAO.getAllByStudent(studentId);
	}

	public int getErrorCountByTopic(int studentId, int topicId) {
			return gapDAO.countErrorsByTopic(studentId, topicId);
	}

	private void checkAndSolveGap(int studentId, int topicId) {
		
			Gap gap = gapDAO.getByStudentAndTopic(studentId, topicId);

			if (gap == null) return;
			
			int total = gap.getQtySolvedQuestions();
			int corrects = gap.getCorrectAnswers();
			double performance = (total > 0) ? (double) corrects / total : 0;

			if (total >= MIN_QUESTIONS_TO_SOLVE && performance >= MIN_PERFORMANCE_TO_SOLVE) {
					gapDAO.markAsSolved(studentId, topicId);
			}
	}
	public void evaluateNewGap(int studentId, int topicId) {

			int totalAnswers = gapDAO.countTotalAnswersByTopic(studentId, topicId);
			if (totalAnswers >= 10) {
					int totalErrors = gapDAO.countErrorsByTopic(studentId, topicId);
					double errorRate = (double) totalErrors / totalAnswers;
					
					if(errorRate >= 0.50) {
							Gap existingGap = gapDAO.getByStudentAndTopic(studentId, topicId);
							
							if(existingGap == null) {
									Gap newGap = new Gap();
									newGap.setStudentId(studentId);
									newGap.setTopicId(topicId);
									newGap.setCreatedAt(java.time.Instant.now());
									
									gapDAO.insert(newGap);
									System.out.println("CRÍTICO: Aluno " + studentId + " atingiu 50% de erro. Nova lacuna criada no tópico " + topicId);
							}
					}
			}
	}
}
