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
        <h1 class="display-4">Instructions for Test :</h1><br/>
        <p class="lead">-> Each question has 4 options.</p>
    	<p class="lead">-> Only 1 option is correct.</p>
    	<p class="lead">-> Correct response gives 3 points.</p>
    	<p class="lead">-> Incorrect response takes away 1 point.</p>
        <hr class="my-4">
        <a style="margin-left: 33%;" href="http://localhost:8080/AptiDude/takeTest.jsp" class="btn btn-success btn-lg active" role="button" aria-pressed="true">Proceed to Test</a>
	
    </div>
			</div>
		</div>
		
</body>
</html>