package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PostDAO;
import com.Db.DBConnect;

@WebServlet("/NoteEditServlet")
public class NoteEditServlet extends HttpServlet {
    
    // Override doPost method to handle POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            // Retrieve the note ID, title, and content from the request parameters
            Integer noteid = Integer.parseInt(request.getParameter("noteid")); // Convert note ID to Integer
            String Title = request.getParameter("title"); // Get title parameter
            String Content = request.getParameter("content"); // Get content parameter
            
            // Create an instance of PostDAO to handle note-related database operations
            PostDAO dao = new PostDAO(DBConnect.getconn());
            // Call PostUpdate method to update the note in the database
            boolean f = dao.PostUpdate(noteid, Title, Content);
            if(f) {
                System.out.print("Data Updated Successfully"); // Log success message
                HttpSession session = request.getSession(); // Create or retrieve the current session
                session.setAttribute("updateMsg","Notes Updated Successfully"); // Set success message in session
                response.sendRedirect("showNotes.jsp"); // Redirect to the notes display page
            } else {
                System.out.print("Data not updated"); // Log failure message
            }
        } catch(Exception e) {
            e.printStackTrace(); // Print stack trace for any exceptions
        }
    }
}
