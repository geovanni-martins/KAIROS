package com.kairos.controller;

import com.kairos.model.Alternative;
import com.kairos.model.MultipleChoiceQuestion;
import com.kairos.model.Question;
import com.kairos.dao.QuestionDAO;
import com.kairos.model.User;

import java.util.List;

public class QuestionController {

    private QuestionDAO questionDAO;

    public QuestionController() {
        questionDAO = new QuestionDAO();
    }

    public void insertQuestion(MultipleChoiceQuestion question, User user) {

        if (!user.getRole().equals("moderator") && !user.getRole().equals("admin")) {

            System.out.println("Sem permissão para criar questões");
            return;
        }

        if (question.getStatement().isBlank()){

            System.out.println("Texto da questão não pode estar vazio");
            return;
        }

        if (question.getTopic() == null){

            System.out.println("Tópico não pode estar nulo");
            return;
        }

        if (question.getDifficulty() == null){

            System.out.println("Dificuldade da questão não pode estar nula");
            return;
        }

        if (question.getAlternatives() == null || question.getAlternatives().size() != 5) {
            System.out.println("A questão deve ter 5 alternativas");
            return;
        }

        int corrects = 0;
        for (Alternative alternative : question.getAlternatives()) {
            if (alternative.getCorrect())
                corrects++;
        }

        if (corrects != 1) {
            System.out.println("A questão deve ter exatamente uma alternativa correta");
            return;
        }

        if (user.getRole().equals("moderator")){

            question.setStats("verified");
        }

        questionDAO.insert(question);
    }

    public List<Question> listQuestions() {

        return questionDAO.getAll();
    }

    public List<Question> listQuestionsPerTopic(int topicId) {

        return questionDAO.getAllByTopic(topicId);
    }

    public Question searchQuestionById(int id) {

        return questionDAO.getById(id);
    }

    public void updateQuestion(MultipleChoiceQuestion question, User user) {

        if (!user.getRole().equals("moderator") && !user.getRole().equals("admin")) {
            System.out.println("Sem permissão para atualizar a questão");
            return;
        }

        if (searchQuestionById(question.getId()) == null){
            System.out.println("Questão inexistente");
            return;
        }

        questionDAO.update(question);
    }

    public void deleteQuestion(int id, User user) {

        if (!user.getRole().equals("moderator") && !user.getRole().equals("admin")) {
            System.out.println("Sem permissão para atualizar a questão");
            return;
        }

        if (searchQuestionById(id) == null){
            System.out.println("Questão inexistente");
            return;
        }

        questionDAO.delete(id);
    }
}