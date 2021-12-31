<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp</title>
    <style>
        body
        {
          background-size:cover;
        }
        legend {
         background:lightslategray;
         color: rgb(248, 245, 245);
         padding: 5px 15px;
         }
         fieldset
          {
              position:absolute;
              border-radius: 5px;
              top: 80px;
              left: 500px;
              background:rgb(169, 226, 228);
              padding: 30px 80px;
          }
          input
          {
            padding: 4px 15px;
            border-radius: 5px;
          }
          
    </style>
</head>
<body style="background-image:url(images/Time1.jpg)";>
    <form action="Registerservlet" method="post">
        <fieldset>
            <legend ><b>Sign Up</b></legend>
            <label for="firstname">First Name</label><br>
            <input type="text" id="First_Name" name="firstname" pattern="[A-Za-z]{3,}" required autofocus><br><br>
            <label for="lastname">Last Name</label><br>
            <input type="text" id="Last_Name" name="lastname" pattern="[A-Za-z]{3,}" required><br><br>
            <label for="username">User Name</label><br>
            <input type="email" id="User_Name" name="username" required><br><br>
            <label for="password">Password</label><br>
            <input type="password" id="password" name="password" pattern="[A-Za-z0-9]+[@#.]+{8,15}" required><br><br>
            <label for="password">Confirm Password</label><br>
            <input type="password" id="Confirm_password" name="Confirm_password" pattern="[A-Za-z0-9]+[@#.]+{8,15}" required><br><br>
            &nbsp;&nbsp;<input type="submit" name="submit"> &nbsp; &nbsp;
           <a href="Login.html"><input type="button" value="Cancel"></a> 
        </fieldset>
    </form>  
</body>
</html>