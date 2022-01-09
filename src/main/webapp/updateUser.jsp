<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User</title>
<script>
    function myfunction()
    {
    	var pswd = document.getElementById("password");
    	var cpswd = document.getElementById("Confirm_password");
    	if(pswd!=cpswd)
    		{
    		document.getElementById("password").style.borderColor = "#E34234";
            document.getElementById("Confirm_password").style.borderColor = "#E34234";
    		}
    }
    </script>
</head>
<body>
<% String firstname=request.getParameter("firstname");
   String username=request.getParameter("username");
   String lastname=request.getParameter("lastname");
   String password=request.getParameter("password");
%>
<form action="updateuser" method="post">
<label for="firstname">First Name</label><br>
            <input type="text" id="First_Name" name="firstname" value="<%=firstname %>" pattern="[A-Za-z]{3,}" required autofocus><br><br>
            <label for="lastname">Last Name</label><br>
            <input type="text" id="Last_Name" name="lastname" value="<%=lastname %>" pattern="[A-Za-z]{3,}" required><br><br>
            <label for="username">User Name</label><br>
            <input type="email" id="User_Name" name="username" value="<%=username %>" pattern="[a-z][a-z0-9_.]+@[a-z0-9.]+[.][a-z]+"  title="Sample xyz12@gmail.com" readonly required><br><br>
            <label for="password">Password</label><br>
            <input type="password" id="password" name="password" value="<%=password%>" pattern="(?=.*\d)(?=.*[@#$%*!^()_+])(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Sample Xyz12@" required><br><br>
            <label for="password">Confirm Password</label><br>
            <input type="password" id="Confirm_password" name="Confirm_password" pattern="(?=.*\d)(?=.*[@#$%*!^()_+])(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Enter confirm password same as password " required><br><br>
            &nbsp;&nbsp;<button type="submit" onclick="myfunction()">Submit</button>&nbsp; &nbsp;
            </form>
</body>
</html>