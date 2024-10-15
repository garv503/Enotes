package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Db.DBConnect;
import com.User.Post;

public class PostDAO {
    private Connection conn;

    // Constructor to initialize the database connection
    public PostDAO(Connection conn) {
        this.conn = conn;
    }

    // Method to add a note to the database
    public boolean AddNotes(String title, String content, int uid) {
        boolean result = false; // Flag to indicate success
        PreparedStatement stmt = null;

        try {
            // Log the parameters being inserted for debugging
            System.out.println("Inserting note with title: " + title + ", content: " + content + ", user ID: " + uid);

            // SQL query to insert the note
            String query = "INSERT INTO post (title, content, uid) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, title);
            stmt.setString(2, content);
            stmt.setInt(3, uid);

            // Execute the insert query
            int rowsAffected = stmt.executeUpdate();

            // Check if insertion was successful
            if (rowsAffected > 0) {
                result = true; // Data inserted successfully
            } else {
                System.out.println("No rows affected. Data not inserted.");
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Print any SQL errors
        } finally {
            // Close the PreparedStatement to prevent memory leaks
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return result; // Return the result of the operation
    }

    // Method to retrieve a list of notes for a given user ID
    public List<Post> getData(int id) {
        List<Post> list = new ArrayList<>(); // List to hold notes

        try {
            // SQL query to fetch posts for the given user ID
            String query = "SELECT * FROM post WHERE uid = ? ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            // Loop through each result and create a new Post object
            while (rs.next()) {
                Post po = new Post(); // Create a new Post object
                po.setId(rs.getInt("id")); // Assuming the first column is 'id'
                po.setTitle(rs.getString("title"));
                po.setContent(rs.getString("content"));
                po.setPdate(rs.getTimestamp("date")); // Assuming column name is 'date'

                // Add the post to the list
                list.add(po);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log any exceptions
        }

        return list; // Return the list of posts
    }
    
    // Method to retrieve a single post by its ID
    public Post getDataById(int noteId) {
        Post p = null; // Initialize Post object to null
        
        try {
            // SQL query to fetch a post by its ID
            String qu = "SELECT * FROM post WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(qu);
            ps.setInt(1, noteId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Post(); // Create a new Post object
                p.setId(rs.getInt(1)); // Set the ID
                p.setTitle(rs.getString(2)); // Set the title
                p.setContent(rs.getString(3)); // Set the content
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log any exceptions
        }
        return p; // Return the Post object
    }
    
    // Method to update an existing post
    public boolean PostUpdate(int nid, String ti, String co) {
        boolean f = false; // Flag to indicate success
        try {
            // SQL query to update a post
            String qu = "UPDATE post SET title = ?, content = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(qu);
            ps.setString(1, ti);
            ps.setString(2, co);
            ps.setInt(3, nid);
            int i = ps.executeUpdate(); // Execute update query

            if (i == 1) {
                f = true; // Post updated successfully
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log any exceptions
        }
        return f; // Return the result of the operation
    }
    
    // Method to delete a post by its ID
    public boolean DeleteNotes(int nid) {
        boolean f = false; // Flag to indicate success

        try {
            // SQL query to delete a post
            String qu = "DELETE FROM post WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(qu);
            ps.setInt(1, nid);
            int x = ps.executeUpdate(); // Execute delete query
            if (x == 1) {
                f = true; // Post deleted successfully
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log any exceptions
        }
        
        return f; // Return the result of the operation
    }
}