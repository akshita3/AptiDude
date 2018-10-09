<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    isErrorPage="false" errorPage="updateProfileError.jsp" pageEncoding="ISO-8859-1" import="com.aptidude.app.dto.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AptiDude: Update Profile</title>
<link rel="stylesheet" type="text/css" media="screen" href="assets\Stylesheet\bootstrap.min.css" />
</head>
<body>
<%
	System.out.println("Inside Update Profile Page "+session.getAttribute("userid"));
 	if(session.getAttribute("userid")==null){
		response.sendRedirect("home.jsp");
 	}
          	
    UserDTO userDTO = (UserDTO)session.getAttribute("userdata");
    if(userDTO==null){
  		response.sendRedirect("home.jsp");
    }
    boolean isActive = true;
%>

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
       	</div>      
       	<button type="reset" class="btn">Reset</button>
        <button type="submit" class="btn btn-primary">Update</button>
   	</form>
	

</body>
</html>