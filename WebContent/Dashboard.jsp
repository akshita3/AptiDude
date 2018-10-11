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
    session.setAttribute("qstnNo", 0);
    session.setAttribute("totalCorrect", 0);
    session.setAttribute("points", 0);
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
  <h1 id="welcome">Welcome <%=session.getAttribute("firstName") %> !</h1>
  
</div>
</div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="jquery-slim.min.js"><\/script>')</script>
    <script src="assets/javascript/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="holder.min.js"></script>
</body>
</html>