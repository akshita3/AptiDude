<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>AptiDude: Login</title>
	<link rel="stylesheet" type="text/css" href="assets/Stylesheet/Bootstrap.css"/>
</head>
	<body>
		
		<h2>AptiDude</h2><br/>
		
		<form action="http://localhost:8080/AptiDude/login" method="POST">
        	<div class="form-group">
          		<label for="exampleInputUserId">User ID</label>
          		<input type="text" class="form-control" id="exampleInputUserId" placeholder="Enter User ID" name="userid">
        	</div>
        	<div class="form-group">
          		<label for="exampleInputPassword1">Password</label>
          		<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password">
        	</div>
        	<button type="submit" class="btn btn-success">Login</button>
        	<button type="reset" class="btn btn-primary">Reset</button>
    	</form>
		
		<script src="assets/javascript/bootstrap.min.js"></script>
	</body>
</html>