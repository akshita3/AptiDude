<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.aptidude.app.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AptiDude: Test Instructions</title>
<link rel="stylesheet" type="text/css" media="screen" href="assets\Stylesheet\bootstrap.min.css" />
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

<div id="shareer">
	<div class="main">
		<div class="jumbotron">
			<h3 style="text-align: center;">Choose Category :</h3>
			<form action="test">
				<input  class="btn btn-outline-primary" name="category" type="submit" value="Ratio and Proportions"/><br/>
				<input  class="btn btn-outline-primary" name="category" type="submit" value="Puzzle"/><br/>
				<input  class="btn btn-outline-primary" name="category" type="submit" value="Blood Relations"/><br/>
				<input  class="btn btn-outline-primary" name="category" type="submit" value="Simple and Compound Interest"/><br/>
				<input  class="btn btn-outline-primary" name="category" type="submit" value="Calendars"/><br/>
       			<hr class="my-4">	
			</form>
   		</div>
	</div>
</div>
		
</body>
</html>