package com.flexbook.flexbook.controller;

import com.flexbook.flexbook.DAO.PostDatabase;
import com.flexbook.flexbook.model.Post;
import com.flexbook.flexbook.model.User;
import com.flexbook.flexbook.utilities.ConnectionManager;

import java.util.List;

public class Main
{
    public static void main(String[] args)
    {
        User user = new User ("John", "Doe", "djdjdj", "ss", "djdjd", "sjsjsj");

        PostDatabase postData = new PostDatabase(ConnectionManager.getConnection());


        List<Post> posts = postData.getPosts(user);

        for (Post post : posts) {
            System.out.println(post.getTitle() + " " + post.getBody());
        }

    }

}
