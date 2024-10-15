package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.User.Post;
import com.DAO.PostDAO;
import com.Db.DBConnect;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {

    // Override doPost method to handle POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Initialize flags for data validity and an error message
        boolean dataValid = true;
        String errorMessage = null;
        int uid = 0; // User ID initialization

        // Validate and parse 'uid' parameter from the request
        String uidStr = request.getParameter("uid");
        if (uidStr != null && !uidStr.isEmpty()) {
            try {
                // Attempt to parse the UID as an integer
                uid = Integer.parseInt(uidStr);
            } catch (NumberFormatException e) {
                dataValid = false; // Set flag to false if parsing fails
                errorMessage = "Invalid user ID format."; // Set error message
                e.printStackTrace(); // Log the error for debugging
            }
        } else {
            dataValid = false; // Set flag to false if UID is missing
            errorMessage = "User ID is required."; // Set error message
        }

        // Retrieve 'title' and 'content' parameters from the request
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        // Validate title
        if (title == null || title.trim().isEmpty()) {
            dataValid = false; // Set flag to false if title is empty
            errorMessage = "Title cannot be empty."; // Set error message
        }

        // Validate content
        if (content == null || content.trim().isEmpty()) {
            dataValid = false; // Set flag to false if content is empty
            errorMessage = "Content cannot be empty."; // Set error message
        }

        // If validation passed, proceed with database insertion
        if (dataValid) {
            // Get a connection from the database
            PostDAO dao = new PostDAO(DBConnect.getconn());
            boolean f = dao.AddNotes(title, content, uid); // Attempt to add notes

            // Check if data insertion was successful
            if (f) {
                System.out.println("Data inserted successfully"); // Log success
                response.sendRedirect("showNotes.jsp"); // Redirect to notes page
            } else {
                System.out.println("Data not inserted"); // Log failure
                // Optionally handle insertion failure here
            }
        } else {
            // Handle invalid data and send error response
            request.setAttribute("errorMessage", errorMessage); // Set error message for the request
            request.getRequestDispatcher("errorPage.jsp").forward(request, response); // Forward to error page
        }
    }
}
