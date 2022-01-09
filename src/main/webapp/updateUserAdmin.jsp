<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User</title>
</head>
<body>
<% String username=(String)request.getParameter("username");%>
<form action="updateuseradmin" method="post">
<table>
<tr><td><label for="username">User Name</label></td>
<td><input type="text" name="username" value="<%=username%>" required readonly></td></tr>
<tr><td><label for="role">Role</label></td>
<td><select  name="role" required>
       <option>TEAM MEMBER</option>
       <option>IN ACTIVE</option>
       </select>
       </td></tr>
</table>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<input type="submit"value="Submit">
</form><br>
<%!
String flag;
%>
<%
if(request.getAttribute("updateuseradmin") != null){
flag = request.getAttribute("updateuseradmin").toString();
%>
<h4><%= flag%></h4>
<% }%> 

</body>
</html>