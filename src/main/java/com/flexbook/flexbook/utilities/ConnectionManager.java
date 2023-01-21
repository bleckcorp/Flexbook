package com.flexbook.flexbook.utilities;

import java.sql.*;

public class ConnectionManager {
    private static Connection connection;
    private static final String url = "jdbc:mysql://localhost:3306/flexbook?autoReconnect=true&useSSL=false";
    private static final String username = "root";
    private static final String password = "Blecksn9!";


    public static Connection getConnection()
    {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url,username,password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

}
