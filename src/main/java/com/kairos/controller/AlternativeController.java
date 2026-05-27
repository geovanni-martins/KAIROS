package com.kairos.controller;

import com.kairos.dao.AlternativeDAO;
import com.kairos.model.Alternative;

import java.util.ArrayList;
import java.util.List;

public class AlternativeController {

    private final AlternativeDAO alternativeDAO = new AlternativeDAO();

    public void insertAlternative(Alternative alternative) {

        if (alternative == null) {
            System.out.println("Alternativa inválida");
            return;
        }

        if (alternative.getText() == null || alternative.getText().isBlank()) {
            System.out.println("O texto da alternativa não pode ser vazio");
            return;
        }

        if (alternative.getQuestion() == null) {
            System.out.println("A alternativa precisa obrigatoriamente pertencer a uma questão");
            return;
        }

        alternativeDAO.insert(alternative);
    }

    public void insertAlternatives(List<Alternative> alternatives, int questionId) {

        if (alternatives == null || alternatives.isEmpty()) {
            System.out.println("A lista de alternativas não pode estar vazia");
            return;
        }

        if (questionId <= 0) {
            System.out.println("ID de questão incorreto");
            return;
        }

        if (alternatives.size() < 5) {
            System.out.println("A questão deve ter 5 alternativas");
            return;
        }

        for (Alternative alt : alternatives) {

            if (alt.getText() == null || alt.getText().isBlank()) {
                System.out.println("Alguma das alternativas está vazia");
                return;
            }
        }

        int corrects = 0;
        for (Alternative alternative : alternatives) {
            if (alternative.getCorrect()) {
                corrects++;
            }
        }

        if (corrects != 1) {
            System.out.println("A questão só deve ter uma alternativa correta");
            return;
        }

        alternativeDAO.insertAll(alternatives, questionId);
    }

    public List<Alternative> alternativesByQuestionId(int questionId) {

        if (questionId <= 0) {
            System.out.println("ID de questão inválido");
            return new ArrayList<>();
        }

        return alternativeDAO.getAllByQuestion(questionId);
    }

    public void updateAlternative(Alternative alternative) {

        if (alternative == null) {
            System.out.println("Alternativa inválida");
            return;
        }

        if (alternative.getId() <= 0) {
            System.out.println("ID da alternativa inválido");
            return;
        }

        if (alternative.getText() == null || alternative.getText().isBlank()) {
            System.out.println("O texto da alternativa não pode estar vazio");
            return;
        }

        alternativeDAO.update(alternative);
    }

    public void deleteById(int id) {

        if (id <= 0) {
            System.out.println("ID inválido");
            return;
        }

        alternativeDAO.delete(id);
    }
}