<%@page import="com.timesheet.model.AdminUser"%>
<%@page import="com.timesheet.daoimpl.AdminDAOimpl"%>
<%@page import="java.util.*"%>
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
     *
    {
    margin:0px;
    padding:0px;
    }
        a
        {
            
            margin-left: 30px;
        }
        .a
        {
            
            margin-left: 30px;
        }
        img
        {
         border-radius:45px;

        }
        body{
            background-size:cover;
        }
        .h1{
            margin:0px;
            padding: 20px;
            background-color: rgb(127, 202, 231);
        }
        nav{
            background-color: rgb(127, 202, 231);
        }
       .signout
       {
           float : right;
           margin-right: 20px;
       }
       a:link {
        font-size: 20px;
        color: rgb(250, 252, 250);
        text-decoration: none;
          }
       a:hover {
         color: rgb(158, 250, 96);
         text-decoration: none;
         }
       a:active {
         color: rgb(245, 245, 91);
        text-decoration: underline;
        }
</style>
</head>
<body style="background-image:url(images/Time2.jpg)">
<h1 class="h1" align="center">TRACK YOUR TIME</h1>
    <nav>
        
        <a href="#index.jsp"><img class="a" src="images/Home.jpg" alt="Home"width="42px" height="42px" title="Home"></a>
        <a href="timesheetstatus.jsp"><img src="images/timeshet.jpg" alt="Timesheet"width="42px" height="42px" title="Timesheet"></a>
        <a href="addtask.jsp"><img src="images/addtask.jpg" alt="addtask"width="42px" height="42px" title="Add Task"></a>
        <a href="#report.jsp"><img src="images/1report.jpg" alt="report"width="42px" height="42px" title="Report"></a>
        <a href="adminuser.jsp"><img src="images/user1.jpg" alt="user"width="42px" height="42px" title="user"></a>
        <a href="Logout"><img class="signout" src="images/signout.png" alt="signout"width="42px" height="42px" title="Signout"></a>
    </nav>
    <br><br>
    <%String username=(String)session.getAttribute("adminuser");
    if(username!=null)
    {
    %>
    <h3>login as :<%=username %></h3>
    <%} %>
<% AdminDAOimpl admindao = new AdminDAOimpl();
   List<AdminUser> userList = new ArrayList<AdminUser>();
   userList = admindao.showalluser();
%>


<table border="1" id="allusers">
	<h1><b>All Users List</b></h1>
	<thead>
	<tr>
  		<th >S.no</th>
		<th>First Name</th>
		<th>Last Name</th>
		<th>User Name</th>
		<th>Role</th>
		<th>Role Update</th>
	</tr>
	</thead>
	<br><br>
<tbody>
<%
int i = 0;
for (AdminUser viewUser: userList ) {
i++;

%>
<tr>


<td><%=i%></td>
<td><%=viewUser.getFirstname()%></td>
<td><%=viewUser.getLastname()%></td>
<td> <%=viewUser.getUsername()%></td>
<td><%=viewUser.getRole() %></td>
<td><button>Edit</button></td>
</tr>

<%
}
%>
</tbody>
</table>
</body>
</html>


