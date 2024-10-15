<%@ page import = "com.User.UserDetails" %> <!-- Importing the UserDetails class for user session handling -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
  <a class="navbar-brand" href=""><i class="fa fa-book" aria-hidden="true"></i>E Notes</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span> <!-- Button to toggle the navbar on small screens -->
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent"> <!-- Collapsible navbar content -->
    <ul class="navbar-nav mr-auto"> <!-- Left-aligned navigation links -->
    
      <li class="nav-item active"> <!-- Home link -->
        <a class="nav-link" href="home.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home<span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item"> <!-- Add Notes link -->
        <a class="nav-link" href="addNotes.jsp"><i class="fa fa-plus" aria-hidden="true"></i>Add Notes</a>
      </li>
      
      <li class="nav-item"> <!-- Show Notes link -->
        <a class="nav-link" href="showNotes.jsp"><i class="fa fa-address-book-o" aria-hidden="true"></i>Show Notes</a>
      </li>
    </ul>

    <% 
      // Retrieve user details from the session
      UserDetails user = (UserDetails) session.getAttribute("userD"); 
      if(user != null) { %> <!-- Check if user is logged in -->
      
	    <ul class="navbar-nav"> <!-- User profile dropdown -->
	      <li class="nav-item dropdown" id="profileDropdownContainer">
	        <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" aria-haspopup="true" aria-expanded="false">
	          <i class="fa fa-user" aria-hidden="true"></i> <%= user.getName() %> <!-- Display user name -->
	        </a>
	        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="profileDropdown"> <!-- Dropdown menu for user info -->
	          <a class="dropdown-item" href="#"><strong>User ID:</strong> <%= user.getId() %></a> <!-- User ID -->
	          <a class="dropdown-item" href="#"><strong>Email:</strong> <%= user.getEmail() %></a> <!-- User email -->
	        </div>
	      </li>
	      <li class="nav-item">
	        <a href="logoutServlet" class="btn btn-light my-2 my-sm-0"><i class="fa fa-user-plus" aria-hidden="true"></i> Logout</a> <!-- Logout button -->
	      </li>
	    </ul>
    <% } else { %> <!-- If user is not logged in -->
	    <a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2"><i class="fa fa-user" aria-hidden="true"></i> Login</a> <!-- Login button -->
	    <a href="register.jsp" class="btn btn-light my-2 my-sm-0"><i class="fa fa-user-plus" aria-hidden="true"></i> Register</a> <!-- Register button -->
    <% } %>
    
  </div>
</nav>

<!-- Custom CSS for dropdown functionality -->
<style>
  .dropdown:hover .dropdown-menu { /* Show dropdown menu on hover */
    display: block;
  }

  .dropdown-menu.show { /* Ensure the dropdown menu is displayed when toggled */
    display: block;
  }
</style>

<!-- Custom JS for dropdown behavior -->
<script>
  // Ensure dropdown stays open on click
  document.addEventListener('DOMContentLoaded', function () {
    const dropdownToggle = document.getElementById('profileDropdown'); // Get the dropdown toggle button
    const dropdownMenu = dropdownToggle.nextElementSibling; // Get the associated dropdown menu
    const dropdownContainer = document.getElementById('profileDropdownContainer'); // Get the dropdown container
    
    dropdownToggle.addEventListener('click', function (e) { // Add click event listener
      e.preventDefault(); // Prevent default anchor behavior
      dropdownMenu.classList.toggle('show'); // Toggle visibility of the dropdown menu
    });

    // Close dropdown if clicked outside
    document.addEventListener('click', function (e) { // Add click event listener to the document
      if (!dropdownContainer.contains(e.target)) { // Check if click is outside the dropdown
        dropdownMenu.classList.remove('show'); // Hide dropdown menu
      }
    });
  });
</script>
