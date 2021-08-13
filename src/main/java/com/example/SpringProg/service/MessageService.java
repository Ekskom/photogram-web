package com.example.SpringProg.service;

import com.example.SpringProg.domain.User;
import com.example.SpringProg.domain.dto.MessageDto;
import com.example.SpringProg.repo.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;


@Service
public class MessageService {
    @Autowired
    private MessageRepo messageRepo;


    public List<MessageDto> messageSet(String filter, User user){
        if (filter != null && !filter.isEmpty()) {
            return messageRepo.findByTag(filter, user);
        } else {
            return messageRepo.findAll(user);
        }
    }

    public List<MessageDto> messageListForUser(
            User currentUser,
            User author
    ) {
        return messageRepo.findByUser(author, currentUser);
    }






}
