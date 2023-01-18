package com.bctech.postland.models;

import java.sql.Timestamp;

public class Comment {

    private int commentId;
    private String content;
    private int postId;
    private int userId;

    private Timestamp date;


    public Comment( String content, int postId, int userId, int commentId) {
        this.content = content;
        this.postId = postId;
        this.userId = userId;
        this.date = date;
        this.commentId = commentId;

    }

    public Comment() {

    }


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public void setTime(Timestamp time) {
    }
}
