package com.User;

import java.sql.Timestamp;

public class Post {
    private int id; // Unique identifier for the post
    private String title; // Title of the post
    private String content; // Content of the post
    private Timestamp pdate; // Timestamp for when the post was published
    private String user; // User associated with the post

    // Getter method for post ID
    public int getId() {
        return id; // Return the unique identifier of the post
    }

    // Setter method for post ID
    public void setId(int id) {
        this.id = id; // Set the unique identifier of the post
    }

    // Getter method for post title
    public String getTitle() {
        return title; // Return the title of the post
    }

    // Setter method for post title
    public void setTitle(String title) {
        this.title = title; // Set the title of the post
    }

    // Getter method for post content
    public String getContent() {
        return content; // Return the content of the post
    }

    // Setter method for post content
    public void setContent(String content) {
        this.content = content; // Set the content of the post
    }

    // Getter method for post published date
    public Timestamp getPdate() {
        return pdate; // Return the published date of the post
    }

    // Setter method for post published date
    public void setPdate(Timestamp pdate) {
        this.pdate = pdate; // Set the published date of the post
    }

    // Getter method for user associated with the post
    public String getUser() {
        return user; // Return the user associated with the post
    }

    // Setter method for user associated with the post
    public void setUser(String user) {
        this.user = user; // Set the user associated with the post
    }
}
