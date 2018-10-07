<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8" autoFlush="true" buffer="18kb"
    isErrorPage="false" trimDirectiveWhitespaces="true"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AptiDude: Register</title>
<link rel="stylesheet" type="text/css" media="screen" href="assets\Stylesheet\bootstrap.min.css" />
</head>
<body>
	<h1>Register</h1>
    	<form action="http://localhost:8080/AptiDude/register" method="POST">
        	<div class="form-group">
            	<label for="exampleInputEmail1">User ID: </label>
            	<input type="text" class="form-control" id="exampleInputEmail1" name="userid" placeholder="Enter User ID">
        	</div>
        	<div class="form-group">
            	<label for="exampleInputEmail1">Email address: </label>
            	<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="emailid" placeholder="Enter email">
            	<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
        	</div>
        	<div class="form-group">
	            <label for="exampleInputPassword1">Password: </label>
            	<input type="password" class="form-control" id="exampleInputPassword1" name="pwd" placeholder="Password">
        	</div>
        	<div class="form-group">
	            <label for="exampleInputPassword1">Confirm Password: </label>
            	<input type="password" class="form-control" id="exampleInputPassword1" name="cpwd" placeholder="Password">
        	</div>
        	<div class="form-row">
	            <div class="col">
            		<label for="firstname">First Name: </label>
                	<input name="firstname" type="text" class="form-control" placeholder="First name">
            	</div>
	            <div class="col">
            		<label for="lastname">Last Name: </label>
	                <input name="lastname" type="text" class="form-control" placeholder="Last name">
            	</div>
        	</div>      
        	<button type="reset" class="btn">Reset</button>
	        <button type="submit" class="btn btn-primary">Submit</button>
    	</form>

    <script src="assets\javascript\bootstrap.min.js"></script>
</body>
</html>