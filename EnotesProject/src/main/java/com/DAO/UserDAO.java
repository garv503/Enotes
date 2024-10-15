package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.User.UserDetails;

public class UserDAO {
    private Connection conn; // Database connection

    // Constructor to initialize the database connection
    public UserDAO(Connection conn) {
        this.conn = conn;
    }

    // Method to add a new user to the database
    public boolean addUser(UserDetails us) {
        boolean f = false; // Flag to indicate success
        try {
            // Specify column names in the INSERT query
            String query = "INSERT INTO user (full_name, email, password) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, us.getName()); // Set full name
            ps.setString(2, us.getEmail()); // Set email
            ps.setString(3, us.getPassword()); // Set password

            int i = ps.executeUpdate(); // Execute the insert query
            if (i == 1) { // Check if one row was inserted
                f = true; // User added successfully
            }

        } catch (Exception e) {
            e.printStackTrace(); // Print any exceptions
        }
        return f; // Return the result of the operation
    }
    
    // Method to authenticate a user during login
    public UserDetails loginUser(UserDetails us) {
        UserDetails user = null; // Initialize UserDetails object to null
        try {
            // SQL query to check for a matching email and password
            String query = "SELECT * FROM user WHERE email = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, us.getEmail()); // Set email
            ps.setString(2, us.getPassword()); // Set password
            ResultSet rs = ps.executeQuery(); // Execute the query
            
            // If a matching user is found, populate the UserDetails object
            if (rs.next()) {
                user = new UserDetails();
                user.setId(rs.getInt("id")); // Get user ID
                user.setName(rs.getString("full_name")); // Get full name
                user.setEmail(rs.getString("email")); // Get email
                user.setPassword(rs.getString("password")); // Get password
            }
            
        } catch (Exception e) {
            e.printStackTrace(); // Print any exceptions
        }
        
        return user; // Return the UserDetails object (or null if not found)
    }
}
