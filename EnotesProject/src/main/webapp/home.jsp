<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%
    // Retrieve user details from the session
    UserDetails user2 = (UserDetails) session.getAttribute("userD");
    
    // Check if the user is logged in; if not, redirect to the login page
    if (user2 == null) {
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
    
    <div class="container-fluid p-0"> <!-- Full-width container with no padding -->
        <%-- Including the navigation bar --%>
        <%@ include file = "all_component/navbar.jsp" %>
        
        <div class="card py-5"> <!-- Card component for content display -->
            <div class="card-body text-center"> <!-- Centered content within the card -->
                <img alt="" src="img/paper.webp" class="img-fluid mx-auto" style="max-width: 300px;"> <!-- Image displayed at the center -->
                <h1>Start Taking Your Notes</h1> <!-- Main heading -->
                <a href="addNotes.jsp" class="btn btn-outline-primary">Start Here</a> <!-- Button linking to the add notes page -->
            </div>
        </div>
    </div>
    
    <%-- Including the footer --%>
    <%@ include file = "all_component/footer.jsp" %>
</body>
</html>
