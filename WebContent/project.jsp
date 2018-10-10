<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html>
	
	<head>
		<meta charset="ISO-8859-1">
		<title>AptiDude: Home Page</title>
		<link rel="stylesheet" type="text/css" media="screen" href="assets/Stylesheet/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/Stylesheet/main.css">
		
	</head>
	
	<body>
	
	<%
    System.out.println("Inside Home Page "+session.getAttribute("userid"));
     if(session.getAttribute("userid")!=null){
        response.sendRedirect("Dashboard.jsp");
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
						<form action="login">
							<input class="form-group form-group-lg" type="text" placeholder="Email ID" name="emailid">
							<input class="form-group iform-group-lg" type="password" placeholder="Password" name="password">
							<button class="btn-success" type="submit" >Login</button>
						</form> 
					</li>
				</ul>
			</div>
		</nav>
	
		<nav class="nav nav-pills nav-fill " style="background-color:rgba(26, 32, 119, 0.849)">
				<a class="nav-item nav-link" href="home.jsp" style="color: rgb(76, 184, 83);">Home</a>
				<a class="nav-item nav-link" href="developers.jsp" style="color: rgb(76, 184, 83)">Developers</a>
				<a class="nav-item nav-link" href="project.jsp" style="color: rgb(76, 184, 83)">Project</a>
				<a class="nav-item nav-link" href="contact.jsp" style="color: rgb(76, 184, 83)">Contact Us</a>
			</nav>
	
		<div id="shareer">
			
			<div class="main">
				<h2 id="getIn">Project Description</h2>
				<div class="jumbotron">
        <h1 class="display-4">AptiDude</h1>
        <p class="lead">In today’s world of great competition, every organization requires competent people.
People with special abilities to find the solution to general problems quickly and
effectively are in high demand in the industry of Information Technology. As the
demand of organizations increases, the need for improvement in problem solving and
general mental ability is also escalating for the aspirants.
AptiDude is an online portal for such aspirants to meet up the growing industry
demands.</p>
        <hr class="my-4">
    </div>
			</div>
		</div>
		<script src="assets\javascript\bootstrap.min.js"></script>
	</body>
	
	</html>