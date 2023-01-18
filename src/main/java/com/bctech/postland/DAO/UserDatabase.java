package com.bctech.postland.DAO;
import com.bctech.postland.Utilities.PasswordEncryption;
import com.bctech.postland.models.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDatabase {

    String queryToInsert = "INSERT INTO users( firstName,lastName, password, email, date_of_birth, gender) values (?,?,?,?,?,?)";
    String queryToSelectUserByEmail = "SELECT * FROM users WHERE email = ?";
    String queryToDeleteUser = "DELETE FROM users WHERE email = ?";


    private Connection dbConnection;

    public UserDatabase(Connection dbConnection) {
        this.dbConnection = dbConnection;
    }

    public boolean registerUser(User user) throws SQLException {
        boolean status = false;

        //check if already registered
         User checkUser = getUserByEmail(user.getEmail());
        if (checkUser != null) {System.out.println("User already registered"); return false;}
            PreparedStatement preparedStatement = dbConnection.prepareStatement(queryToInsert);
            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getDate_of_birth());
            preparedStatement.setString(6, user.getGender());

            preparedStatement.executeUpdate();
            status = true;

        return status;
    }


    public User loginUser(String email, String password) throws SQLException {
        User user = null;
        String query;

            query = "select * from users where email=?";

            PreparedStatement preparedStatement = this.dbConnection.prepareStatement(query);

            preparedStatement.setString(1, email);

            ResultSet result = preparedStatement.executeQuery();

            if(result.next()){
                user = new User();
                String decryptPass = PasswordEncryption.decryptPassword(result.getString("password"));
                if(!decryptPass.equals(password)){
                    System.out.println("Problem here");
                    return null;

                }
                user.setFirstName(result.getString("firstname"));
                user.setLastName(result.getString("lastname"));
                user.setEmail(result.getString("email"));
                user.setPassword(result.getString("password"));
                user.setId(Integer.parseInt(result.getString("userId")));

            }
        return user;
    }


    public User getUserByEmail(String email) throws SQLException {
        User user = null;

            PreparedStatement preparedStatement = this.dbConnection.prepareStatement(queryToSelectUserByEmail);

            preparedStatement.setString(1, email);

            ResultSet result = preparedStatement.executeQuery();

            if(result.next()){
                user = new User();
                user.setFirstName(result.getString("firstname"));
                user.setLastName(result.getString("lastname"));
                user.setEmail(result.getString("email"));
                user.setPassword(result.getString("password"));
                user.setId(result.getInt("user_id"));

            }
        return user;
    }

    public boolean deleteUser(String email) throws SQLException {
        boolean success =  false;
            PreparedStatement prepared = this.dbConnection.prepareStatement(queryToDeleteUser);
            prepared.setString(1, email);
            int result = prepared.executeUpdate();
            if(result > 0) {
                success = true;
            }

        return success;
    }
}
