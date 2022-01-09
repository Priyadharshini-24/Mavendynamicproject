<%@page import="com.timesheet.model.User"%>
<%@page import="java.util.*"%>
<%@page import="com.timesheet.daoimpl.UserDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users</title>
<style>
#allusers table,th,tr,td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 10px;
        }
</style>
</head>
<body>
<% UserDAOimpl userdao = new UserDAOimpl();
   List<User> userList = new ArrayList<User>();
   User user=new User();
   String username=(String)session.getAttribute("username");
   userList = userdao.showuser(username);
%>


<table border="1" id="allusers">
	<h1><b>User Profile</b></h1>
	<thead>
	<tr>
  		<th >S.no</th>
		<th>First Name</th>
		<th>Last Name</th>
		<th>User Name</th>
		<th>Password</th>
		<th>Edit</th>
	</tr>
	</thead>
	<br><br>
<tbody>
<%
int i = 0;
for (User viewUser: userList ) {
i++;

%>
<tr>


<td><%=i%></td>
<td><%=viewUser.getFirstname()%></td>
<td><%=viewUser.getLastname()%></td>
<td> <%=viewUser.getUsername()%></td>
<td><%=viewUser.getPassword()%></td>
<td><a href="updateUser.jsp?firstname=<%=viewUser.getFirstname()%>&lastname=<%=viewUser.getLastname()%>&password=<%=viewUser.getPassword()%>"><button>Edit</button></a></td>
</tr>

<%
}
%>
</tbody>
</table>
</body>
</html>