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
#allusers table,th,tr,td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 10px;
        }
</style>
</head>
<body style="background-image:url(images/Time2.jpg)">
<h1 class="h1" align="center">TRACK YOUR TIME</h1>
    <nav>
        
        <a href="index.jsp"><img class="a" src="images/Home.jpg" alt="Home"width="42px" height="42px" title="Home"></a>
        <a href="timesheet.jsp"><img src="images/timeshet.jpg" alt="Timesheet"width="42px" height="42px" title="Timesheet"></a>
        <a href="#"><img src="images/addtask.jpg" alt="addtask"width="42px" height="42px" title="Add Task"></a>
        <a href="report.jsp"><img src="images/1report.jpg" alt="report"width="42px" height="42px" title="Report"></a>
        <a href="showuser.jsp"><img src="images/user1.jpg" alt="user"width="42px" height="42px" title="user"></a>
        <a href="Logout"><img class="signout" src="images/signout.png" alt="signout"width="42px" height="42px" title="Signout"></a>
    </nav>
    <br><br>
<% UserDAOimpl userdao = new UserDAOimpl();
   List<User> userList = new ArrayList<User>();
   User user=new User();
   String username=(String)session.getAttribute("username");
   userList = userdao.showuser(username);
%>


<table border="1" id="allusers">
	<h2><b>User Profile</b></h2>
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
<td><a href="updateUser.jsp?firstname=<%=viewUser.getFirstname()%>&lastname=<%=viewUser.getLastname()%>&username=<%=viewUser.getUsername()%>"><button>Edit</button></a></td>
</tr>

<%
}
%>
</tbody>
</table>
 <%!
String flag;
%>
<%
if(request.getAttribute("updateuser") != null){
flag = request.getAttribute("updateuser").toString();
%>
<h4><%= flag%></h4>
<% }%>
<%session.removeAttribute("updateuser");%> 
</body>
</html>