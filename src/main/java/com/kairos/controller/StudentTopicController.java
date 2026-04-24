package com.kairos.controller;

import com.kairos.dao.StudentTopicDAO;
import com.kairos.model.*;

import java.util.ArrayList;

public class StudentTopicController {

    private StudentTopicDAO studentTopicDAO;

    public StudentTopicController() {
        studentTopicDAO = new StudentTopicDAO();
    }

    public void insertStudentTopic(StudentTopic studentTopic) {

        if (studentTopic.getStudent() == null || studentTopic.getTopic() == null) {
            System.out.println("O aluno e/ou tópico não pode ser nulo");
            return;
        }

        if (studentTopicDAO.searchStudentTopicById(
                studentTopic.getStudent().getId(),
                studentTopic.getTopic().getId()) != null) {

            System.out.println("Esse tópico de estudante já existe dentro do banco de dados");
            return;
        }

        studentTopicDAO.insertStudentTopic(studentTopic);
    }

    public StudentTopic searchStudentTopic(int studentId, int topicId) {

        return studentTopicDAO.searchStudentTopicById(studentId, topicId);
    }

    public ArrayList<StudentTopic> listStudentTopics() {

        return studentTopicDAO.listStudentTopic();
    }

    public ArrayList<StudentTopic> listByStudent(int studentId) {

        return studentTopicDAO.listStudentTopicByStudent(studentId);
    }

    public void updateStudentTopic(StudentTopic studentTopic) {

        if (searchStudentTopic(
                studentTopic.getStudent().getId(),
                studentTopic.getTopic().getId()) == null) {

            System.out.println("Tópico de estudante não encontrado");
            return;
        }

        studentTopicDAO.updateStudentTopic(studentTopic);
    }

    public void registerAnswer(int studentId, int topicId, boolean correct) {

        if (studentId <= 0 || topicId <= 0) {
            System.out.println("IDs incorretos");
            return;
        }

        StudentTopic studentTopic = studentTopicDAO.searchStudentTopicById(studentId, topicId);

        if (studentTopic == null) {
            Student student = new Student(studentId, null, null, null, null);
            Topic topic = new Topic(topicId, null, null);

            studentTopic = new StudentTopic(student, topic, 0, 0);
        }

        studentTopic.setQtySolvedQuestions(studentTopic.getQtySolvedQuestions() + 1);

        if (!correct) {
            studentTopic.setQtyWrongQuestions(studentTopic.getQtyWrongQuestions() + 1);
        }

        if (studentTopic.getQtyWrongQuestions() > studentTopic.getQtySolvedQuestions()) {
            System.out.println("O número de questões erradas não pode ultrapassar o número de questões feitas");
            return;
        }

        if (studentTopicDAO.searchStudentTopicById(studentId, topicId) == null) {
            studentTopicDAO.insertStudentTopic(studentTopic);

        } else {
            studentTopicDAO.updateStudentTopic(studentTopic);
        }
    }
}