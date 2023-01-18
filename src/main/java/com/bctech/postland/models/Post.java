package com.bctech.postland.models;

import java.sql.Timestamp;

public class Post{
        private int postId;
        private String title;
        private String content;
        private int userId;
        private int noLikes;

        private Timestamp date;
        private int noComments;
        private boolean likedPost;


public Post(String title, String content) {
            this.title = title;
            this.content = content;
        }

    public Post() {

    }


    public int getPostId() {
            return postId;
        }

        public String getTitle() {
            return title;
        }

        public String getContent() {
            return content;
        }

        public int getUserId() {
            return userId;
        }

        public int getNoLikes() {
            return noLikes;
        }

        public int getNoComments() {
            return noComments;
        }

        public boolean isLikedPost() {
            return likedPost;
        }


    public void setId(int id) {
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }



    public void setNoLikes(int noLikes) {
        this.noLikes = noLikes;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public void setNoComments(int noComments) {
        this.noComments = noComments;
    }

    public void setLikedPost(boolean likedPost) {
        this.likedPost = likedPost;
    }

    public int getId() {
        return postId;
    }
}
