<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Memo Magic</title>
    
    <%-- Including external CSS files for styling --%>
    <%@ include file = "all_component/allcss.jsp" %>
</head>
<body>

    <%-- Including the navigation bar --%>
    <%@ include file = "all_component/navbar.jsp" %>

    <div class="container-fluid div-clor"> <!-- Full-width container for the registration card -->
        <div class="row">
            <div class="col-md-4 offset-md-4"> <!-- Centering the card in the middle of the page -->
                <div class="card mt-4"> <!-- Card component for the registration form -->

                    <div class="card-header text-center bg-custom text-white"> <!-- Header section with styling -->
                        <i class="fa fa-user-plus fa-3x" aria-hidden="true"></i> <!-- User plus icon for registration -->
                        <h3>Registration</h3> <!-- Heading for the registration form -->
                    </div>
                    
                    <%-- Displaying registration failure message if any --%>
                    <%
                    if(session.getAttribute("failed-msg") != null) {
                    %>
                        <div class="alert alert-danger" role="alert"><%= session.getAttribute("failed-msg") %></div> <!-- Alert for registration failure -->
                    <%
                    session.removeAttribute("failed-msg"); // Remove the message after displaying
                    }
                    %>

                    <div class="card-body"> <!-- Body of the card containing the form -->
                        <form action="UserServlet" method="post"> <!-- Form submission to UserServlet -->

                            <div class="form-group">
                                <label>Enter Full Name</label>
                                <input type="text" class="form-control" id="exampleInputEmail1"
                                    aria-describedby="emailHelp" name="fname" required> <!-- Input for full name -->
                            </div>
                            
                            <div class="form-group">
                                <label>Enter Email Id</label>
                                <input type="email" class="form-control" id="exampleInputEmail1"
                                    aria-describedby="emailHelp" name="uemail" required> <!-- Input for email -->
                            </div>

                            <div class="form-group">
                                <label>Enter Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1"
                                    name="upassword" required> <!-- Input for password -->
                            </div>

                            <button type="submit" class="btn btn-primary badge-pill btn-block">Register</button> <!-- Submit button for registration -->
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>
