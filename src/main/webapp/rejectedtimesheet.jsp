<%@page import="com.timesheet.model.Rejecttimesheet"%>
<%@page import="com.timesheet.daoimpl.RejecttimesheetDAOimpl"%>
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
</style>
</head>
<body>
<% 
RejecttimesheetDAOimpl rejecttimesheetdao=new RejecttimesheetDAOimpl();
String username=(String)session.getAttribute("username");
List<Rejecttimesheet> rejectlist=new ArrayList<Rejecttimesheet>();
rejectlist=rejecttimesheetdao.showRejecttimesheet(username);
%>

<table border="1" id="allusers">
	<h1><b>Rejected Timesheets</b></h1>
	<thead>
	<tr>
  		<th >S.no</th>
		<th>Timesheet Id</th>
		<th>Task Name</th>
		<th>Timesheet Date</th>
		<th>Spending Hrs</th>
		<th>Comments</th>
		<th>Approved By</th>
		<th>Status</th>
		<th>Update Timesheet</th>
	</tr>
	</thead>
	<br><br>
<tbody>
<%
int i = 0;
for (Rejecttimesheet reject: rejectlist) {
i++;

%>
<tr>


<td><%=i%></td>
<td><%=reject.getTimesheetid()%></td>
<td><%=reject.getTask()%></td>
<td><%=reject.getTimesheetdate()%></td>
<td><%=reject.getSpendtimehrs()%></td>
<td> <%=reject.getComments()%></td>
<td> <%=reject.getApprovedby()%></td>
<td><%=reject.getStatus()%></td>
<td><a href="Updatetimesheet.jsp"><button>Edit</button></a></td>
</tr>

<%
}
%>
</tbody>
</table>


</body>
</html>