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
				<h2 id="getIn">Developers</h2>
				<div class="card-deck" style="width: 100%; height: 50%;">
        			<div class="card" style="width: 50%; size: 50%;">
            			<img class="card-img-top" src="assets/images/Dev_1.jpeg" alt="Card image cap">
            			<div class="card-body">
                			<h5 class="card-title">Akshita Aggarwal</h5>
                			<p class="card-text">
                    			Content & UI Developer <br>
                    			IT-7th Sem <br>
                   				00220803115 <br>
                			</p>
            			</div>
        			</div>
        			<div class="card" style="width: 50%; size: 50%;">
            			<img class="card-img-top" src="assets/images/Dev_3.jpg" alt="Card image cap">
            			<div class="card-body">
                			<h5 class="card-title">Rohit Meghwal</h5>
                			<p class="card-text">
                    			Back-End Developer <br>
                    			IT-7th Sem <br>
                    			02720803115 <br>
                			</p>
            			</div>
        			</div>
    			</div>
			</div>
		</div>
		<script src="assets\javascript\bootstrap.min.js"></script>
	</body>
	
	</html>