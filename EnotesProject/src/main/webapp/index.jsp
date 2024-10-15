<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Memo Magic</title>
    
    <%-- Including external CSS files for styling --%>
    <%@ include file = "all_component/allcss.jsp" %>

    <style>
        /* Background image styling */
        .back-img {
            background: url("img/background-1.jpg"); /* Background image */
            width: 100%; /* Full width */
            height: 80vh; /* 80% of the viewport height */
            background-repeat: no-repeat; /* Prevent repeating of the background image */
            background-size: cover; /* Cover the entire area */
        }
    </style>
</head>
<body>

    <%-- Including navigation bar --%>
    <%@ include file = "all_component/navbar.jsp" %>

    <div class="container-fluid back-img"> <!-- Container for background image -->
        <h3 class="text-center text-white"> <!-- Centered white text -->
            <i class="fa fa-book" aria-hidden="true"></i> <!-- Book icon from Font Awesome -->
            E-Notes - Save Your Notes Here <!-- Heading text -->
        </h3>
    </div>
    
    <%-- Including footer --%>
    <%@ include file = "all_component/footer.jsp" %>
</body>
</html>
