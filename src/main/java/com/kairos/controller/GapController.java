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

	//O aluno precisa provar estatisticamente que superou a deficiencia naquele topico. Apos fazer 30 questões mínimas, se o rendimento for de 70% de acertos, lacuna resolvida
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
	//A partir da 10ª questão respondida em um topico, ele passa a calcular a taxa de erro. Se essa taxa bater 50% ou mais, o sistema gera um registro de Lacuna pro aluno
	public void evaluateNewGap(int studentId, int topicId) {

			int totalRespostas = gapDAO.countTotalAnswersByTopic(studentId, topicId);
			if (totalRespostas >= 10) {
					int totalErros = gapDAO.countErrorsByTopic(studentId, topicId);
					double taxaErro = (double) totalErros / totalRespostas;
					
					if(taxaErro >= 0.50) {
							Gap lacunaExistente = gapDAO.getByStudentAndTopic(studentId, topicId);
							
							if(lacunaExistente == null) {
									Gap novaLacuna = new Gap();
									novaLacuna.setStudentId(studentId);
									novaLacuna.setTopicId(topicId);
									novaLacuna.setCreatedAt(java.time.Instant.now());
									
									gapDAO.insert(novaLacuna);
									System.out.println("CRÍTICO: Aluno " + studentId + " atingiu 50% de erro. Nova lacuna criada no tópico " + topicId);
							}
					}
			}
	}
}