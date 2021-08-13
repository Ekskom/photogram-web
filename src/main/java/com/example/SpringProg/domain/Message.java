package com.example.SpringProg.domain;


import com.example.SpringProg.domain.util.MessageHelper;
import org.hibernate.validator.constraints.Length;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Message{
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Not empty")
    @Length(max = 255, message = "Tag too long")
    private String tag;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    @ManyToMany
    @JoinTable(
            name = "message_likes",
            joinColumns = { @JoinColumn(name = "message_id")},
            inverseJoinColumns = { @JoinColumn(name = "user_id")}
    )
    private Set<User> likes = new HashSet<>();


    private String filename;

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) { this.author = author; }

    public Long getId() {
        return id;
    }

    public Message() { }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Message(String text, String tag, User user) {
        this.author = user;
        this.tag = tag;
    }

    public String getAuthorName(){
        return MessageHelper.getAuthorName(author);
    }

    public void setId(Long id) {this.id = id; }

    public Set<User> getLikes() {
        return likes;
    }

    public void setLikes(Set<User> likes) {
        this.likes = likes;
    }

    public String getTag() {

        return tag;
    }

    public void setTag(String tag)
    {
        this.tag = tag;
    }

}
