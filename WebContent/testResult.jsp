<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.aptidude.app.dto.*" %>
<%@ page import="com.aptidude.app.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AptiDude: Test Result</title>
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
    
    int points = (int)session.getAttribute("points");
    int totalQstns = (int)session.getAttribute("qstnNo") - 1;
    int totalCorrect = (int)session.getAttribute("totalCorrect");
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
					<table class="table table-dark table-hover">
							<tr>
								<td><p class="display-4">Total Questions :</p></td>
								<td><p class="display-4"><%= totalQstns %></p></td>
							</tr>
							<tr>
								<td><p class="display-4">Total Correct :</p></td>
								<td><p class="display-4"><%= totalCorrect %></p></td>
							</tr>
							<tr>
								<td><p class="display-4">Score :</p></td>
								<td><p class="display-4"><%= points %> / 15</p></td>
							</tr>
					</table>
					<hr class="m-4">
					<a style="margin-left: 35%;" href="http://localhost:8080/AptiDude/Dashboard.jsp" class="btn btn-success btn-lg active" role="button" aria-pressed="true">Return to Home</a>
			    </div>
			</div>
		</div>

<%
	TestDAO testDAO = new TestDAO();
	int resetPoints = testDAO.resetPoints(session.getAttribute("userid").toString());
	session.setAttribute("points", resetPoints);
%>
	
</body>
</html>