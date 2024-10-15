<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
    // Retrieve the user details from the session
    UserDetails user1 = (UserDetails) session.getAttribute("userD");
    
    // Check if the user is logged in; if not, redirect to login page
    if (user1 == null) {
        response.sendRedirect("login.jsp"); // Redirect to login page
        session.setAttribute("Login-error", "Please Login.."); // Set login error message in session
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
    <div class="container-fluid">
        <%-- Including the navigation bar --%>
        <%@ include file = "all_component/navbar.jsp" %>
        
        <h3 class="text-center">Add Your Notes Here</h3> <!-- Page heading -->
        
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <form action="AddNotesServlet" method="post"> <!-- Form submission to AddNotesServlet -->
                    
                        <div class="form-group">
                            <% 
                            // Retrieve user details again to get the user ID for the hidden field
                            UserDetails us = (UserDetails) session.getAttribute("userD");
                            if (us != null) {
                            %>
                            <input type="hidden" value="<%= us.getId() %>" name="uid"> <!-- Hidden input for user ID -->
                            <% } %>
                            
                            <label for="exampleInputEmail1">Enter Title</label> 
                            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="title" required="required"> <!-- Input for note title -->
                        </div>
                        
                        <div class="form-group">
                            <label for="exampleInputEmail1">Add Content</label> 
                            <textarea rows="9" cols="" class="form-control" name="content" required="required"></textarea> <!-- Textarea for note content -->
                        </div>
                        
                        <div class="container text-center">
                            <button type="submit" class="btn btn-primary">Add Notes</button> <!-- Submit button for adding notes -->
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
