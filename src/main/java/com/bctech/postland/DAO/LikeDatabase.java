package com.bctech.postland.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LikeDatabase {
    String queryToLike = "INSERT INTO likes (post_id, user_id) VALUES (?, ?)";
    String queryToUnlike = "DELETE FROM likes WHERE post_id = ? AND user_id = ?";

    Connection dbConnection;


    public LikeDatabase(Connection dbConnection) {
        this.dbConnection = dbConnection;
    }

    public boolean likeOrUnlikePost(int userId, int postId, boolean likeAction) throws SQLException {
        boolean success = false;
        PreparedStatement preparedStatement;

            if(likeAction){
                preparedStatement = this.dbConnection.prepareStatement(queryToLike);
                preparedStatement.setInt(1, postId);
                preparedStatement.setInt(2, userId);
                preparedStatement.executeUpdate();
                success = true;
            }else{
                preparedStatement = this.dbConnection.prepareStatement(queryToUnlike);
                int result = preparedStatement.executeUpdate();

                if(result > 0) {success = true;
                }
            }

        return success;
    }

}
