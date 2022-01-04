
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
#allusers table,th,tr,td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 10px;
        }
</style>
</head>
<body>
<% 
TimesheetDAOimpl timesheetdao=new TimesheetDAOimpl();
UserDAOimpl userdao = new UserDAOimpl();
User user=new User();
String username=(String)session.getAttribute("username");
int userid=userdao.findUserId(username);
List<Timesheet> timesheetlist=new ArrayList<Timesheet>();
timesheetlist=timesheetdao.showTimesheet(userid);
%>

<table border="1" id="allusers">
	<h1><b>Timesheet status</b></h1>
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