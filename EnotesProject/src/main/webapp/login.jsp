<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Memo Magic</title>
    
    <%-- Including external CSS files for styling --%>
    <%@ include file="all_component/allcss.jsp" %>
</head>
<body>

    <%-- Including the navigation bar --%>
    <%@ include file="all_component/navbar.jsp" %>
    
    <div class="container-fluid div-clor"> <!-- Full-width container for the login card -->
        <div class="row">
            <div class="col-md-4 offset-md-4"> <!-- Centering the card in the middle of the page -->
                <div class="card mt-4"> <!-- Card component for the login form -->

                    <div class="card-header text-center bg-custom text-white"> <!-- Header section with styling -->
                        <i class="fa fa-user fa-3x" aria-hidden="true"></i> <!-- User icon -->
                        <h3>Login</h3> <!-- Heading for the login form -->
                    </div>

                    <%-- Displaying invalid login message if any --%>
                    <%
                    String invalidMsg = (String) session.getAttribute("login-failed");
                    if (invalidMsg != null) {
                    %>
                    <div class="alert alert-dark" role="alert"><%= invalidMsg %></div> <!-- Alert for invalid login -->
                    <%
                    session.removeAttribute("login-failed"); // Remove the message after displaying
                    }
                    %>

                    <%-- Displaying message if user tries to access without login --%>
                    <%
                    String withoutLogin = (String) session.getAttribute("Login-error");
                    if (withoutLogin != null) {
                    %>
                    <div class="alert alert-danger" role="alert"><%= withoutLogin %></div> <!-- Alert for login error -->
                    <%
                    session.removeAttribute("Login-error"); // Remove the message after displaying
                    }
                    %>

                    <%-- Displaying logout message if user has logged out --%>
                    <%
                    String logout = (String) session.getAttribute("logoutMsg");
                    if (logout != null) {
                    %>
                    <div class="alert alert-success" role="alert"><%= logout %></div> <!-- Alert for successful logout -->
                    <%
                    session.removeAttribute("logoutMsg"); // Remove the message after displaying
                    }
                    %>

                    <div class="card-body"> <!-- Body of the card containing the form -->
                        <form action="loginServlet" method="post"> <!-- Form submission to loginServlet -->

                            <div class="form-group">
                                <label>Enter Email Id</label>
                                <input type="email" class="form-control" id="exampleInputEmail1"
                                    aria-describedby="emailHelp" placeholder="Enter email"
                                    name="uemail" required> <!-- Input for email -->
                            </div>

                            <div class="form-group">
                                <label>Enter Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1"
                                    placeholder="Password" name="upassword" required> <!-- Input for password -->
                            </div>

                            <button type="submit" class="btn btn-primary badge-pill btn-block">Login</button> <!-- Submit button for login -->
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
