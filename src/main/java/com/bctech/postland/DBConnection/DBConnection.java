package com.bctech.postland.DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection connection;
    private static final String url = "jdbc:mysql://localhost:3306/postland?autoReconnect=true&useSSL=false";
    private static final String username = "root";
    private static final String password = "Blecksn9!";

    public static Connection getConnection(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url,username,password);

            if(connection != null){
                System.out.println("Connected successfully");
            } else{
                System.out.println("Connection failed");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return connection;
    }


}
