<%@page import="com.timesheet.model.Status"%>
<%@page import="java.util.*"%>
<%@page import="com.timesheet.daoimpl.StatusDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Status</title>
</head>
<body>
<% StatusDAOimpl statusdao = new StatusDAOimpl();
   List<Status> statusList = new ArrayList<Status>();
   statusList = statusdao.showallStatus();
%>

<table border="1">
	<h1><b>Status List</b></h1>
	<thead>
	<tr>
  		<th >S.no</th>
		<th>User Id</th>
		<th>Timesheet Id</th>
		<th>Status</th>
		<th>Approved By</th>
	</tr>
	</thead>
	<br><br>
<tbody>
<%
int i = 0;
for (Status viewstatus: statusList ) {
i++;

%>
<tr>


<td><%=i%></td>
<td><%=viewstatus.getUserid()%></td>
<td><%=viewstatus.getTimesheetid()%></td>
<td><%=viewstatus.getStatus()%></td>
<td><%=viewstatus.getApprovedby()%></td>
</tr>

<%
}
%>
</tbody>
</table>

</body>
</html>