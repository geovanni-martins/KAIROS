package com.kairos.controller;

import com.kairos.dao.StudentDAO;
import com.kairos.dao.StudentTopicDAO;
import com.kairos.model.*;

import java.util.ArrayList;
import java.util.List;

public class StudentTopicController {

    private StudentTopicDAO studentTopicDAO;
    private StudentDAO studentDAO;

    public StudentTopicController() {
        studentTopicDAO = new StudentTopicDAO();
        studentDAO = new StudentDAO();
    }

    public void insertStudentTopic(StudentTopic studentTopic) {

        if (studentTopic.getStudent() == null || studentTopic.getTopic() == null) {
            System.out.println("O aluno e/ou tópico não pode ser nulo");
            return;
        }

        if (studentTopicDAO.getById(
                studentTopic.getStudent().getId(),
                studentTopic.getTopic().getId()) != null) {

            System.out.println("Esse tópico de estudante já existe dentro do banco de dados");
            return;
        }

        studentTopicDAO.insert(studentTopic);
    }

    public StudentTopic searchStudentTopic(int studentId, int topicId) {

        return studentTopicDAO.getById(studentId, topicId);
    }

    public List<StudentTopic> listStudentTopics() {

        return studentTopicDAO.getAll();
    }

    public List<StudentTopic> listByStudent(int studentId) {

        return studentTopicDAO.getAllByStudent(studentId);
    }

    public void updateStudentTopic(StudentTopic studentTopic) {

        if (searchStudentTopic(
                studentTopic.getStudent().getId(),
                studentTopic.getTopic().getId()) == null) {

            System.out.println("Tópico de estudante não encontrado");
            return;
        }

        studentTopicDAO.update(studentTopic);
    }

    public void registerAnswer(int studentId, int topicId, boolean correct) {

        if (studentId <= 0 || topicId <= 0) {
            System.out.println("IDs incorretos");
            return;
        }

        StudentTopic studentTopic = studentTopicDAO.getById(studentId, topicId);

        if (studentTopic == null) {
            Student student = studentDAO.getById(studentId);
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

        if (studentTopicDAO.getById(studentId, topicId) == null) {
            studentTopicDAO.insert(studentTopic);

        } else {
            studentTopicDAO.update(studentTopic);
        }
    }
}