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

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {

    // Override doGet method to handle GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the note ID from the request parameter
        Integer noteid = Integer.parseInt(request.getParameter("note_id")); // Note ID to be deleted

        // Create an instance of PostDAO to interact with the database
        PostDAO dao = new PostDAO(DBConnect.getconn());
        // Attempt to delete the note with the specified ID
        boolean f = dao.DeleteNotes(noteid);
        HttpSession session = null; // Declare session variable

        // Check if the deletion was successful
        if (f) {
            session = request.getSession(); // Create or retrieve the current session
            session.setAttribute("updateMsg", "Notes Deleted Successfully..."); // Set success message
            response.sendRedirect("showNotes.jsp"); // Redirect to the notes display page
        } else {
            session = request.getSession(); // Create or retrieve the current session
            session.setAttribute("wrongMsg", "Something Went Wrong"); // Set error message
            response.sendRedirect("showNotes.jsp"); // Redirect to the notes display page
        }
    }
}
