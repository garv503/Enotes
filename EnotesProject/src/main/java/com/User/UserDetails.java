package com.User;

public class UserDetails {
    private int id; // User ID
    private String full_name; // User's full name
    private String email; // User's email address
    private String password; // User's password

    // Default constructor
    public UserDetails() {
        super();
        // No-argument constructor for creating empty UserDetails objects
    }

    // Parameterized constructor to initialize UserDetails
    public UserDetails(int id, String full_name, String email, String password) {
        super();
        this.id = id; // Set user ID
        this.full_name = full_name; // Set user's full name
        this.email = email; // Set user's email address
        this.password = password; // Set user's password
    }

    // Getter method for ID
    public int getId() {
        return id; // Return user ID
    }

    // Setter method for ID
    public void setId(int id) {
        this.id = id; // Set user ID
    }

    // Getter method for full name
    public String getName() {
        return full_name; // Return user's full name
    }

    // Setter method for full name
    public void setName(String name) {
        this.full_name = name; // Set user's full name
    }

    // Getter method for email
    public String getEmail() {
        return email; // Return user's email address
    }

    // Setter method for email
    public void setEmail(String email) {
        this.email = email; // Set user's email address
    }

    // Getter method for password
    public String getPassword() {
        return password; // Return user's password
    }

    // Setter method for password
    public void setPassword(String password) {
        this.password = password; // Set user's password
    }
}
