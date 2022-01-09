<%@page import="com.timesheet.model.ViewTimesheets"%>
<%@page import="java.util.*"%>
<%@page import="com.timesheet.daoimpl.ViewTimesheetsDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Timesheet Status Admin</title>
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
        border: 1px solid black;
        border-collapse: collapse;
        padding: 8px;
        }
</style>
</head>
<%String adminuser=(String)session.getAttribute("adminuser"); %>
<body style="background-image:url(images/Time2.jpg)">
<h1 align="center">TRACK YOUR TIME</h1>
    <nav> 
        <a href="adminindex.jsp"><img class="a" src="images/Home.jpg" alt="Home"width="42px" height="42px" title="Home"></a>
        <a href="timesheetstatus.jsp"><img src="images/timeshet.jpg" alt="Timesheet"width="42px" height="42px" title="Timesheet"></a>
        <a href="addtask.jsp"><img src="images/addtask.jpg" alt="addtask"width="42px" height="42px" title="Add Task"></a>
        <a href="#report.jsp"><img src="images/1report.jpg" alt="report"width="42px" height="42px" title="Report"></a>
        <a href="adminuser.jsp"><img src="images/user1.jpg" alt="user"width="42px" height="42px" title="user"></a>
        <a href="Logout"><img class="signout" src="images/signout.png" alt="signout"width="42px" height="42px" title="Signout"></a>
    </nav><br><br>
<% ViewTimesheetsDAOimpl viewtimesheetdao=new ViewTimesheetsDAOimpl();
   List<ViewTimesheets> timesheetlist=new ArrayList<ViewTimesheets>();
   timesheetlist=viewtimesheetdao.showAllTimesheet();
%>
<table border="1" id="allusers">
	<h2><b> Timesheet List</b></h2>
	<thead>
	<tr>
  		<th >S.no</th>
		<th>User Name</th>
		<th>Comments</th>
		<th>Spending Time Hrs</th>
		<th>Timesheet Id</th>
		<th>Timesheet Date</th>
		<th>Task Id</th>
		<th>Status</th>
	</tr>
	</thead>
<tbody>
<%
int i = 0;
for (ViewTimesheets viewtimesheet: timesheetlist ) {
i++;

%>
<tr>


<td><%=i%></td>
<td> <%=viewtimesheet.getUsername()%></td>
<td> <%=viewtimesheet.getComments()%></td>
<td> <%=viewtimesheet.getSpendtimehrs()%></td>
<td> <%=viewtimesheet.getTimesheetid()%></td>
<td> <%=viewtimesheet.getTimesheetdate()%></td>
<td> <%=viewtimesheet.getTaskid()%></td>
<td> <%=viewtimesheet.getStatus()%></td>
</tr>

<%
}
%>
</tbody>
</table><br><br>
<form action="addstatus" method="post">
<table>
  <tr>
 <th><label for="username">Enter User Name</label></th>
  <td><input type="email" name="username" required></td>
  </tr>
<tr>
 <th><label for="timesheetdate">Enter Timesheet Date</label></th>
  <td><input type="date" name="timesheetdate" required></td>
  </tr>
  <tr>
 <th><label for="status">Enter Status</label></th>
  <td><select name="status" required>
       <option>Approved</option>
       <option>Rejected</option>
       <option>Not Approved</option>
       </select></td>
  </tr>
  <tr>
 <th><label for="approvedby">Approved By</label></th>
  <td><input type="text" name="approvedby" value="<%=adminuser%>" readonly required></td>
  </tr>
  </table>
   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="submit"value="Submit">
   &nbsp; &nbsp; <input type="reset"value="Reset">
</form>
 <%!
String flag;
%>
<%
if(request.getAttribute("status") != null){
flag = request.getAttribute("status").toString();
%>
<h4><%= flag%></h4>
<% }%>  
</body>
</html>