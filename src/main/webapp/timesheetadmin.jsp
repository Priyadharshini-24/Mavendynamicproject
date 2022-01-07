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
</head>
<%String adminuser=(String)session.getAttribute("adminuser"); %>
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
		<th>Status</th>
		<th>Edit status</th>
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
<td><a href="updatestatus.jsp"><button>Edit</button></a></td>
</tr>

<%
}
%>
</tbody>
</table>
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
  <td><input type="text" name="status" required></td>
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