package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.User.UserDetails;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    // Override doPost method to handle POST requests
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters from the request
        String name = request.getParameter("fname"); // Full name
        String email = request.getParameter("uemail"); // Email address
        String password = request.getParameter("upassword"); // Password

        // Create a new UserDetails object and set its properties
        UserDetails us = new UserDetails();
        us.setName(name); // Set full name
        us.setEmail(email); // Set email
        us.setPassword(password); // Set password

        // Create a UserDAO instance for database operations
        UserDAO dao = new UserDAO(DBConnect.getconn());
        boolean f = dao.addUser(us); // Attempt to add the user to the database
        HttpSession session; // Declare session variable

        // Check if the user registration was successful
        if (f) {
            session = request.getSession(); // Create a new session
            session.setAttribute("reg-success", "Registration Successful.."); // Set success message
            response.sendRedirect("login.jsp"); // Redirect to login page
        } else {
            session = request.getSession(); // Create a new session
            session.setAttribute("failed-msg", "Something Went Wrong"); // Set error message
            response.sendRedirect("register.jsp"); // Redirect back to registration page
        }
    }
}
