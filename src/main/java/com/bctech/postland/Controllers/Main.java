package com.bctech.postland.Controllers;

import com.bctech.postland.DAO.UserDatabase;
import com.bctech.postland.DBConnection.DBConnection;
import com.bctech.postland.models.User;

import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {

        UserDatabase userDatabase = new UserDatabase(DBConnection.getConnection());

        String email = "1@1.B";
        String password = "123";

        try {
            User user = userDatabase.loginUser(email, password);

            if (user != null) {
                System.out.println("User found");
            } else {
                System.out.println("User not found");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
}

