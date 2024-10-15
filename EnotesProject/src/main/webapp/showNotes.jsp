<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DAO.PostDAO" %>
<%@ page import="com.User.Post" %>
<%@ page import="com.Db.DBConnect" %>
<%@ page import="com.User.UserDetails" %>

<%
    UserDetails user3 = (UserDetails)session.getAttribute("userD"); // Retrieve user details from the session
    
    // Redirect to login page if user is not logged in
    if (user3 == null) {
        response.sendRedirect("login.jsp");
        session.setAttribute("Login-error", "Please Login..");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Memo Magic</title>
    <%-- Including external CSS for styling --%>
    <%@ include file = "all_component/allcss.jsp" %>
</head>
<body>
    <%-- Including the navigation bar --%>
    <%@ include file = "all_component/navbar.jsp" %>

    <%-- Display success message if available --%>
    <%
        String updateMsg = (String)session.getAttribute("updateMsg"); 
        if(updateMsg != null) {
    %>
        <div class="alert alert-success" role="alert">
            <%= updateMsg %>
        </div>
    <%
        session.removeAttribute("updateMsg"); // Clear message after displaying
        }
    %>
    
    <%-- Display error message if available --%>
    <%
        String wrongMsg = (String)session.getAttribute("wrongMsg"); 
        if(wrongMsg != null) {
    %>
        <div class="alert alert-danger" role="alert">
            <%= wrongMsg %>
        </div>
    <%
        session.removeAttribute("wrongMsg"); // Clear message after displaying
        }
    %>

    <div class="container">
        <h2 class="text-center">All Notes</h2>
        
        <div class="row">
            <div class="col-md-12">
                <%-- Check if user is logged in and retrieve notes --%>
                <%
                    if (user3 != null) {
                        PostDAO postDAO = new PostDAO(DBConnect.getconn()); // Create PostDAO instance
                        List<Post> postList = postDAO.getData(user3.getId()); // Retrieve posts for the logged-in user
                        for (Post po : postList) { // Loop through each post
                %>
                            <div class="card mt-3">
                                <img alt="" src="img/paper.webp" class="card-img-top mt-2 mx-auto" style="max-width:100px;"> <!-- Note image -->
                                
                                <div class="card-body p-4">
                                    <h5 class="card-title"><%= po.getTitle() %></h5> <!-- Display post title -->
                                    <p><%= po.getContent() %></p> <!-- Display post content -->
                                    
                                    <p>
                                        <b class="text-success">Publisher Name: <%= user3.getName() %></b><br> <!-- Display publisher's name -->
                                    </p>
                                    
                                    <p>
                                        <b class="text-success">Published Date: <%= po.getPdate() %></b><br> <!-- Display published date -->
                                    </p>
                                    
                                    <div class="container text-center mt-2">
                                        <a href="deleteServlet?note_id=<%= po.getId() %>" class="btn btn-danger">Delete</a> <!-- Delete button -->
                                        <a href="edit.jsp?note_id=<%= po.getId() %>" class="btn btn-primary">Edit</a> <!-- Edit button -->
                                    </div>
                                </div>
                            </div>
                <%
                        } // End of post loop
                    } // End of user check
                %>
            </div>
        </div>
    </div>
</body>
</html>
