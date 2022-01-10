
<%@page import="com.timesheet.model.User"%>
<%@page import="com.timesheet.daoimpl.UserDAOimpl"%>
<%@page import="com.timesheet.model.Timesheet"%>
<%@page import="com.timesheet.daoimpl.TimesheetDAOimpl"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Timesheet</title>
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
        h1{
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
#allusers table,th,tr,td{
        padding: 10px;
        }
</style>
</head>
<body style="background-image:url(images/Time2.jpg)">
<h1 align="center">TRACK YOUR TIME</h1>
    <nav>
        <a href="#index.jsp"><img class="a" src="images/Home.jpg" alt="Home"width="42px" height="42px" title="Home"></a>
        <a href="timesheet.jsp"><img src="images/timeshet.jpg" alt="Timesheet"width="42px" height="42px" title="Timesheet"></a>
        <a href="#"><img src="images/addtask.jpg" alt="addtask"width="42px" height="42px" title="Add Task"></a>
        <a href="report.jsp"><img src="images/1report.jpg" alt="report"width="42px" height="42px" title="Report"></a>
        <a href="showuser.jsp"><img src="images/user1.jpg" alt="user"width="42px" height="42px" title="user"></a>
        <a href="Logout"><img class="signout" src="images/signout.png" alt="signout"width="42px" height="42px" title="Signout"></a>
    </nav>
<% 
TimesheetDAOimpl timesheetdao=new TimesheetDAOimpl();
UserDAOimpl userdao = new UserDAOimpl();
User user=new User();
String username=(String)session.getAttribute("username");
int userid=userdao.findUserId(username);
List<Timesheet> timesheetlist=new ArrayList<Timesheet>();
timesheetlist=timesheetdao.showTimesheet(userid);
%>
<br><br>
<table  id="allusers">
	<h2><b>Timesheet status</b></h2>
	<h4>User name :<%=username%></h4>
	<thead>
	<tr>
  		<th >S.no</th>
		<th>User Id</th>
		<th>Task Id</th>
		<th>Spending Hrs</th>
		<th>Timesheet Date</th>
	</tr>
	</thead>
	<br><br>
<tbody>
<%
int i = 0;
for (Timesheet timesheet: timesheetlist) {
i++;

%>
<tr>


<td><%=i%></td>
<td><%=timesheet.getUserid()%></td>
<td><%=timesheet.getTaskid()%></td>
<td><%=timesheet.getSpendtime()%></td>
<td><%=timesheet.getTimesheetfordate()%></td>
</tr>

<%
}
%>
</tbody>
</table>
</body>
</html>