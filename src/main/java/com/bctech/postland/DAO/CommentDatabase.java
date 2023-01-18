package com.bctech.postland.DAO;

import com.bctech.postland.models.Comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDatabase {

    //TODO CANNOT ADD MORE THAN ONE COMMENT TO A POST CURRENTLY.. SETUP COMMENT ID
    String queryToInsertComment = "INSERT INTO comments(post_id,user_id,comment) values (?,?,?)";

    static String queryToGetAllCommentsByPostId = "SELECT * FROM comments \n" +
            "WHERE comments.post_id = ? \n" +
            "GROUP BY post_id \n" +
            "AND comments.time DESC;";

    String queryToDeleteComment = "DELETE FROM comments where post_id = ? and user_id = ?";
    String queryToUpdateComment = "update comments set comment=? where post_id = ? and user_id = ?";


    private Connection dbConnection;

    public CommentDatabase(Connection dbConnection) {
        this.dbConnection = dbConnection;
    }

    public boolean createComment(int userId, Comment comment) throws SQLException {
        boolean result = false;
        PreparedStatement preparedStatement = this.dbConnection.prepareStatement(queryToInsertComment);
        preparedStatement.setInt(1, comment.getPostId());
        preparedStatement.setString(2, String.valueOf(userId));
        preparedStatement.setString(3, comment.getContent());
        preparedStatement.executeUpdate();
        result = true;
        return result;
    }


    public static List<Comment> getAllCommentsForPostById(int postId,Connection dbConnection) throws SQLException {
        List<Comment> commentList = new ArrayList<>();
        PreparedStatement preparedStatement = dbConnection.prepareStatement(queryToGetAllCommentsByPostId);
        preparedStatement.setInt(1, postId);;
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            Comment comment = new Comment();
            comment.setPostId(resultSet.getInt("post_id"));
            comment.setUserId(resultSet.getInt("user_id"));
            comment.setContent(resultSet.getString("comment"));
            comment.setTime(resultSet.getTimestamp("time"));
            commentList.add(comment);
        }
        return commentList;
        }

    public boolean updateComment(int userId, Comment newComment) throws SQLException {
        boolean success = false;
        PreparedStatement prepared = this.dbConnection.prepareStatement(queryToUpdateComment);
        prepared.setString(1, newComment.getContent());
        prepared.setInt(2, newComment.getPostId());
        prepared.setInt(3, userId);
        int result = prepared.executeUpdate();
        if(result > 0) {
            success = true;
        }
        return success;
    }
    public boolean deleteComment(int userId, int postId) throws SQLException {
        boolean success =  false;
        PreparedStatement prepared = this.dbConnection.prepareStatement(queryToDeleteComment);
        prepared.setInt(1, postId);
        prepared.setInt(2, userId);
        int result = prepared.executeUpdate();
        if(result > 0) {
            success = true;
        }
        return success;
    }
}

