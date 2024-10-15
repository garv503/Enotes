package com.Db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    
    private static Connection conn; // Static variable to hold the database connection

    // Method to get the database connection
    public static Connection getconn() {
        try {
            // Check if the connection is null (i.e., not yet established)
            if (conn == null) {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                // Establish the connection using the DriverManager
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "1234");
            }
            return conn; // Return the established connection
        } catch (Exception e) {
            e.printStackTrace(); // Print any exceptions that occur
        }
        return null; // Return null if the connection could not be established
    }
}
