<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.DAO.PostDAO" %> <!-- Importing PostDAO class for database operations -->
<%@ page import="com.Db.DBConnect" %> <!-- Importing DBConnect class for database connection -->
<%@ page import="com.User.Post" %> <!-- Importing Post class for note data representation -->
<%
    // Retrieve user details from the session
    UserDetails user1 = (UserDetails) session.getAttribute("userD");
    
    // Check if the user is logged in; if not, redirect to the login page
    if (user1 == null) {
        response.sendRedirect("login.jsp"); // Redirect to login page
        session.setAttribute("Login-error", "Please Login.."); // Set error message in session
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Memo Magic</title>
    
    <%-- Including external CSS files for styling --%>
    <%@ include file = "all_component/allcss.jsp" %>
</head>
<body>

    <%
        // Retrieve note ID from the request parameter
        Integer noteid = Integer.parseInt(request.getParameter("note_id"));
        // Create an instance of PostDAO with a database connection
        PostDAO post = new PostDAO(DBConnect.getconn());
        // Get the note data by its ID
        Post p = post.getDataById(noteid);
    %>

    <div class="container-fluid">
        <%-- Including the navigation bar --%>
        <%@ include file = "all_component/navbar.jsp" %>
        <h3 class="text-center">Edit Your Note</h3> <!-- Page heading -->
        
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <form action="NoteEditServlet" method="post"> <!-- Form submission to NoteEditServlet -->
                        <input type="hidden" value="<%= noteid %>" name="noteid"> <!-- Hidden input for note ID -->
                        
                        <div class="form-group">
                            <label for="exampleInputEmail1">Enter Title</label> 
                            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="title" 
                            required="required" value="<%= p.getTitle() %>"> <!-- Input for note title, pre-filled with current title -->
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleInputEmail1">Content</label> 
                            <textarea rows="9" cols="" class="form-control" name="content" 
                            required="required"><%= p.getContent() %></textarea> <!-- Textarea for note content, pre-filled with current content -->
                        </div>
                        
                        <div class="container text-center">
                            <button type="submit" class="btn btn-primary">Add Notes</button> <!-- Submit button for editing notes -->
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <%-- Including the footer --%>
    <%@ include file = "all_component/footer.jsp" %>
</body>
</html>
