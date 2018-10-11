<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.aptidude.app.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AptiDude: Test</title>
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
    
    TestDTO testDTO = (TestDTO)session.getAttribute("qstnData");
    String qstn = testDTO.getQuestions().get(2).getQstn();
	String[] options = (String[])testDTO.getQuestions().get(2).getOptions().getArray();
	String answer = testDTO.getQuestions().get(2).getAnswer();
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
					<form action="checkTest">
                        <h3>Q<%=session.getAttribute("qstnNo")%>.  <%= qstn %></h3> 
                        <label class="btn btn-outline-info">
                            <input type="radio" name="option" value="<%= options[0] %>"> a.  <%= options[0] %>
                        </label><br/>
                        <label class="btn btn-outline-info">
                            <input type="radio" name="option" value="<%= options[1] %>"> b.  <%= options[1] %>
                        </label><br/>
                        <label class="btn btn-outline-info">
                            <input type="radio" name="option" value="<%= options[2] %>"> c.  <%= options[2] %>
                        </label><br/>
                        <label class="btn btn-outline-info">
                            <input type="radio" name="option" value="<%= options[3] %>"> d.  <%= options[3] %>
                        </label><br/>
                        <hr class="my-4">
                        <button type="submit" class="btn btn-success">Submit</button>
					</form>
			    </div>
			</div>
		</div>


    
    
	
</body>
</html>