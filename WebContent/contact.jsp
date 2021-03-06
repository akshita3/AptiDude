<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.aptidude.app.dto.*" %>
	<!DOCTYPE html>
	<html>
	
	<head>
		<meta charset="ISO-8859-1">
		<title>AptiDude: Contact Us</title>
		<link rel="stylesheet" type="text/css" media="screen" href="assets/Stylesheet/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/Stylesheet/main.css">
		
	</head>
	
	<body>
	
	<%
    System.out.println("Inside Home Page "+session.getAttribute("userid"));
	UserDTO userDTO = (UserDTO)session.getAttribute("userdata");
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
				<h2 id="getIn">Contact Us</h2>
				<table class="table table-dark table-hover">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Mobile</th>
                <th scope="col">Email</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Akshita Aggarwal</td>
                <td>9811454020</td>
                <td>akshagg3@gmail.com </td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Rohit Meghwal</td>
                <td>9560394272</td>
                <td>yuvrohit1996@gmail.com</td>
            </tr>
        </tbody>
    </table>
			</div>
		</div>
		<script src="assets\javascript\bootstrap.min.js"></script>
	</body>
	</html>