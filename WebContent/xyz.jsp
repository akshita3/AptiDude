<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.aptidude.app.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="favicon.ico">
<title>AptiDude: Dashboard</title>
<link rel="stylesheet" type="text/css" media="screen" href="assets\Stylesheet\bootstrap.min.css" />
<!-- <link href="assets/Stylesheet/dashboard.css" rel="stylesheet"> -->
<link rel="stylesheet" href="assets/Stylesheet/main.css">
</head>
<body>
	
    <%
    System.out.println("Inside DashBoard Page "+session.getAttribute("userid"));
  UserDTO userDTO = (UserDTO)session.getAttribute("userdata");
     if(session.getAttribute("userid")==null){
        response.sendRedirect("home.jsp");
     }
     else if(userDTO==null){
           response.sendRedirect("home.jsp");
     }
    boolean isActive = true;
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" style="color: #4CB853" href="home.jsp"><h1>AptiDude</h1></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
      <form action="logout">
                    <button class="btn-outline-danger btn-sm" type="submit" >logout</button>
                </form>
            </li>
        </ul>
    </div>
</nav>

<nav class="nav nav-pills nav-fill " style="background-color:rgba(26, 32, 119, 0.849)">
  <a class="nav-item nav-link" href="home.jsp" style="color: rgb(76, 184, 83)">Home</a>
  <% 
      if(userDTO!=null && userDTO.getRights()!=null && userDTO.getRights().size()>0){
      for(RightDTO rightDTO : userDTO.getRights()) { %>
      <a class="nav-item nav-link" href="<%=rightDTO.getScreenName()%>" style="color: rgb(76, 184, 83)"><%=rightDTO.getRightName() %></a>
      <%
      isActive = false;
      }
      }
      %>
<!--   <a class="nav-item nav-link" href="developers.jsp" style="color: rgb(76, 184, 83)">Developers</a> -->
<!--   <a class="nav-item nav-link" href="project.jsp" style="color: rgb(76, 184, 83)">Project</a> -->
<!--   <a class="nav-item nav-link" href="contact.jsp" style="color: rgb(76, 184, 83)">Contact Us</a> -->
</nav>

<div id="shareer">

<div class="main">
  <h1 style="text-align: center;"><b>Update Profile</b></h1><br/>
	<form action="http://localhost:8080/AptiDude/updateProfile" method="POST">
       	<div class="form-group">
           	<label for="exampleInputEmail1">Email address: </label>
           	<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="emailid" placeholder="<%= userDTO.getEmailid()%>" disabled>
       	</div>
       	<div class="form-group">
            <label for="exampleInputPassword1">Current Password: </label>
           	<input type="password" class="form-control" id="exampleInputPassword1" name="oldpassword" placeholder="********">
       	</div>
       	<div class="form-group">
            <label for="exampleInputPassword1">New Password: </label>
           	<input type="password" class="form-control" id="exampleInputPassword1" name="newpassword" placeholder="Enter New Password">
       	</div>
       	<div class="form-row">
            <div class="col">
           		<label for="firstname">First Name: </label>
               	<input name="firstname" type="text" class="form-control" placeholder="<%= userDTO.getFirstName()%>">
           	</div>
            <div class="col">
           		<label for="lastname">Last Name: </label>
                <input name="lastname" type="text" class="form-control" placeholder="<%= userDTO.getLastName()%>">
           	</div>
       	</div><br/>
       	<button type="reset" class="btn">Reset</button>
        <button type="submit" class="btn btn-primary">Update</button>
   	</form>
</div>
</div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="jquery-slim.min.js"><\/script>')</script>
    <script src="assets/javascript/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="holder.min.js"></script>
</body>
</html>