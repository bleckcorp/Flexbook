package com.bctech.postland.DAO;

import com.bctech.postland.models.Comment;
import com.bctech.postland.models.Post;
import com.bctech.postland.models.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PostDatabase {
    String queryToInsertPost = "INSERT INTO posts(postId,userId, title,content) values (?,?,?,?)";
    String queryToSelectPostByPostId = "SELECT posts.postId, posts.userId, posts.content, posts.date " +
            "FROM posts \n" +
            "WHERE posts.userId = ? \n" +
            "GROUP BY postId \n" +
            "AND posts.date DESC;";

    String queryToGetAllPostsByUserId = "SELECT posts.postId, posts.userId, posts.content, posts.date, " +
            "COUNT(likes.post_id) as countLikes \n" +
            "FROM posts \n" +
            "LEFT JOIN likes ON \n" +
            "posts.postId = likes.user_id " +
            "WHERE posts.userId = ? \n" +
            "GROUP BY postId \n" +
            "AND posts.date DESC;";

    String queryToDeletePost = "DELETE FROM posts where postId = ? and userId = ?";
    String queryToUpdatePost = "update posts set title=?, content=? where postId = ? and userId = ?";


    private Connection dbConnection;


    public PostDatabase(Connection connection) {
        this.dbConnection = connection;
    }


    public boolean createPost(int userId, Post post) throws SQLException {
        boolean result = false;
            PreparedStatement preparedStatement = this.dbConnection.prepareStatement(queryToInsertPost);
            preparedStatement.setInt(1, post.getId());
            preparedStatement.setString(2, String.valueOf(userId));
            preparedStatement.setString(3, post.getTitle());
            preparedStatement.setString(4, post.getContent());
            preparedStatement.executeUpdate();
            result = true;
        return result;
    }


    public Post getPostById(int postId) throws SQLException {
        Post post = null;
            PreparedStatement postStatement = this.dbConnection.prepareStatement(queryToSelectPostByPostId);
        postStatement.setInt(1,postId);
            ResultSet result = postStatement.executeQuery();

            if(result.next()){
                post = new Post();
                post.setPostId(result.getInt("postId"));
                post.setTitle(result.getString("title"));
                post.setContent(result.getString("content"));



                return post;
            }


        return post;
    }

    public HashMap<Post, List<Comment>> getAllPostsForUser(int userId) throws SQLException {
        Post post = null;
        HashMap<Post, List<Comment>> totalPostsOfUser = new HashMap<>();

       PreparedStatement preparedStatement = this.dbConnection.prepareStatement(queryToGetAllPostsByUserId);
            ResultSet result = preparedStatement.executeQuery();
        preparedStatement.setInt(1, userId);
        ResultSet resultSet = preparedStatement.executeQuery();

        while(resultSet.next()){
            post = new Post();
            post.setId(resultSet.getInt("postId"));
            post.setContent(resultSet.getString("content"));
            post.setNoLikes(resultSet.getInt("countLikes"));
            post.setDate(resultSet.getTimestamp("date"));
            List<Comment> postComments = CommentDatabase.getAllCommentsForPostById(post.getId(), this.dbConnection);
            totalPostsOfUser.put(post, postComments);
        }
        return totalPostsOfUser;
    }


    public boolean updatePost(int userId, int postId, Post newPost) throws SQLException {
        boolean success = false;
            PreparedStatement prepared = this.dbConnection.prepareStatement(queryToUpdatePost);
            prepared.setString(1, newPost.getTitle());
            prepared.setString(2, newPost.getContent());
            prepared.setInt(3, postId);
            prepared.setInt(4, userId);
            int result = prepared.executeUpdate();
            if(result > 0) {
                success = true;
            }
        return success;
    }
    public boolean deletePost(int userId, int postId) throws SQLException {
        boolean success =  false;
            PreparedStatement prepared = this.dbConnection.prepareStatement(queryToDeletePost);
            prepared.setInt(1, postId);
            prepared.setInt(2, userId);
            int result = prepared.executeUpdate();
            if(result > 0) {
                success = true;
            }
        return success;
    }
}

