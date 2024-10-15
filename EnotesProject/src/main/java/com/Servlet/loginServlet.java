package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DBConnect;
import com.User.UserDetails;
import com.DAO.UserDAO;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

    // Override doPost method to handle POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve email and password parameters from the request
        String email = request.getParameter("uemail");
        String password = request.getParameter("upassword");
        
        // Create a UserDetails object to store the user's credentials
        UserDetails us = new UserDetails();
        us.setEmail(email); // Set the email
        us.setPassword(password); // Set the password
        
        // Create an instance of UserDAO to handle user-related database operations
        UserDAO dao = new UserDAO(DBConnect.getconn());
        // Attempt to log in the user using the provided credentials
        UserDetails user = dao.loginUser(us);
        
        // Check if the user object is not null (i.e., login successful)
        if(user != null) {
            HttpSession session = request.getSession(); // Create or retrieve the current session
            session.setAttribute("userD", user); // Store the user details in the session
            response.sendRedirect("home.jsp"); // Redirect to the home page upon successful login
        } else {
            HttpSession session = request.getSession(); // Create or retrieve the current session
            session.setAttribute("login-failed", "Invalid Username and Password"); // Set error message
            response.sendRedirect("login.jsp"); // Redirect back to the login page
        }
    }
}
