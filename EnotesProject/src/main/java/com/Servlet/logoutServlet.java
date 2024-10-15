package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logoutServlet")
public class logoutServlet extends HttpServlet {
    
    // Override doGet method to handle GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve the current session
            HttpSession session = request.getSession();
            // Remove the "userD" attribute to log out the user
            session.removeAttribute("userD");
            
            // Set a logout message in the session
            session.setAttribute("logoutMsg", "Logout Successfully");
            // Redirect the user to the login page
            response.sendRedirect("login.jsp");
            
        } catch(Exception e) {
            e.printStackTrace(); // Print the stack trace for any exceptions
        }
    }
}
