package com.example.SpringProg.domain.dto;

import com.example.SpringProg.domain.Message;
import com.example.SpringProg.domain.User;
import com.example.SpringProg.domain.util.MessageHelper;

public class MessageDto {
    private Long id;
    private String tag;
    private User author;
    private String filename;
    private Long likes;

    public Long getId() {
        return id;
    }

    public MessageDto(Message message,Long likes, Boolean meLike) {
        this.id = message.getId();
        this.tag = message.getTag();
        this.author = message.getAuthor();
        this.filename = message.getFilename();
        this.likes = likes;
        this.meLike = meLike;
    }

    public String getTag() {
        return tag;
    }

    public User getAuthor() {
        return author;
    }

    public String getFilename() {
        return filename;
    }

    public Long getLikes() {
        return likes;
    }

    public Boolean getMeLike() {
        return meLike;
    }

    private Boolean meLike;

    public String getAuthorName(){
        return MessageHelper.getAuthorName(author);
    }

    @Override
    public String toString() {
        return "MessageDto{" +
                "id=" + id +
                ", author=" + author +
                ", likes=" + likes +
                ", meLike=" + meLike +
                '}';
    }
}
