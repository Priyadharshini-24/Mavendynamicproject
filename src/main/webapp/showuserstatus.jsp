<%@page import="com.timesheet.model.ViewTimesheets"%>
<%@page import="java.util.*"%>
<%@page import="com.timesheet.daoimpl.ViewTimesheetsDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Timesheet Status</title>
</head>
<body>
<% ViewTimesheetsDAOimpl viewtimesheetdao=new ViewTimesheetsDAOimpl();
   List<ViewTimesheets> timesheetlist=new ArrayList<ViewTimesheets>();
   String username=(String)session.getAttribute("username");
   String startdate=(String)request.getParameter("startdate");
   String enddate=(String)request.getParameter("enddate");
   timesheetlist=viewtimesheetdao.showTimesheet(username,startdate,enddate);
%>
<h1><b> Timesheet Status</b></h1><br>
<table border="1" id="allusers">
	
	<thead>
	<tr>
  		<th >S.no</th>
  		<th>Timesheet Date</th>
		<th>Spending Time Hrs</th>
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
<td> <%=viewtimesheet.getTimesheetdate()%></td>
<td> <%=viewtimesheet.getSpendtimehrs()%></td>
<td> <%=viewtimesheet.getStatus()%></td>
</tr>

<%
}
%>
</tbody>
</table>
</body>
</html>