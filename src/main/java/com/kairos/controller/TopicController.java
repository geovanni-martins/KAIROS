package com.kairos.controller;

import com.kairos.dao.TopicDAO;
import com.kairos.model.Topic;
import com.kairos.model.User;

import java.util.List;

public class TopicController {

    private TopicDAO topicDAO;

    public TopicController(){
        topicDAO = new TopicDAO();
    }

    public void insertTopic(Topic topic, User user){

        if (!user.getRole().equals("moderator") && !user.getRole().equals("admin")) {

            System.out.println("Sem permissão para criar tópicos");
            return;
        }

        if (topic == null){
            System.out.println("Tópico não pode ser nulo");
            return;
        }

        if (topic.getName() == null){
            System.out.println("Nome do tópico não pode ser nulo");
            return;
        }

        if (topic.getSubject() == null){
            System.out.println("Matéria do tópico não pode ser nula");
            return;
        }

        topicDAO.insert(topic);
    }

    public List<Topic> listTopics() {

        return topicDAO.getAll();
    }

    public Topic searchTopicById(int topic_id) {

        return topicDAO.getById(topic_id);
    }

    public void updateTopic(Topic topic, User user) {

        if (!user.getRole().equals("moderator") && !user.getRole().equals("admin")) {
            System.out.println("Sem permissão para atualizar o tópico");
            return;
        }

        if (searchTopicById(topic.getId()) == null){
            System.out.println("Tópico inexistente");
            return;
        }

        topicDAO.update(topic);
    }

    public void deleteTopic(int id, User user) {

        if (!user.getRole().equals("moderator") && !user.getRole().equals("admin")) {
            System.out.println("Sem permissão para atualizar o tópico");
            return;
        }

        if (searchTopicById(id) == null){
            System.out.println("Tópico inexistente");
            return;
        }

        topicDAO.delete(id);
    }
}