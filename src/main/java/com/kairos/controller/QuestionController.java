package com.kairos.controller;

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

        if (user.getRole().equals("moderator")){

            question.setStats("verified");
        }
        questionDAO.insertQuestion(question);
    }

    public List<Question> listQuestions() {

        return questionDAO.listQuestions();
    }

    public Question searchQuestionById(int id) {

        return questionDAO.searchQuestionById(id);
    }

    public void updateQuestion(Question question, User user) {

        if (!user.getRole().equals("moderator") && !user.getRole().equals("admin")) {
            System.out.println("Sem permissão para atualizar a questão");
            return;
        }

        if (searchQuestionById(question.getId()) == null){
            System.out.println("Questão inexistente");
            return;
        }

        questionDAO.updateQuestion(question);
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

        questionDAO.deleteQuestion(id);
    }
}