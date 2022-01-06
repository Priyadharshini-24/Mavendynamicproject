<%@page import="com.timesheet.model.ViewTimesheets"%>
<%@page import="java.util.*"%>
<%@page import="com.timesheet.daoimpl.ViewTimesheetsDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Timesheets</title>
</head>
<body>
<% ViewTimesheetsDAOimpl viewtimesheetdao=new ViewTimesheetsDAOimpl();
   List<ViewTimesheets> timesheetlist=new ArrayList<ViewTimesheets>();
   timesheetlist=viewtimesheetdao.showAllTimesheet();
%>
<table border="1" id="allusers">
	<h1><b> Timesheet List</b></h1>
	<thead>
	<tr>
  		<th >S.no</th>
		<th>User Name</th>
		<th>Comments</th>
		<th>Spending Time Hrs</th>
		<th>Timesheet Id</th>
		<th>Timesheet Date</th>
		<th>Task Id</th>
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
</tr>

<%
}
%>
</tbody>
</table>


</body>
</html>