package com.kairos.controller;

import java.util.List;

import com.kairos.dao.GapDAO;
import com.kairos.model.Gap;

public class GapController {

	public void processGapUpdate(int studentId, int topicId, boolean gotRight) {
		GapDAO dao = new GapDAO();
		
		dao.updatePerformance(studentId, topicId, gotRight);
		dao.checkAndSolveGap(studentId, topicId);
	}
	
	public List<Gap> getGapsByStudent(int studentId) {
		GapDAO dao = new GapDAO();
		return dao.getAllByStudent(studentId);
	}
}