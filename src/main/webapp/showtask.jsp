<%@page import="com.timesheet.model.Task"%>
<%@page import="java.util.*"%>
<%@page import="com.timesheet.daoimpl.TaskDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Task</title>
<style>
#allusers table,th,tr,td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 10px;
        }
</style>
</head>
<body>
<% TaskDAOimpl taskdao = new TaskDAOimpl();
   List<Task> taskList = new ArrayList<Task>();
   String username=(String)session.getAttribute("username");
   taskList = taskdao.showTask(username);
%>


<table border="1" id="allusers">
	<h1><b> Tasks List</b></h1>
	<thead>
	<tr>
  		<th >S.no</th>
		<th>Task Name</th>
		<th>Priority</th>
		<th>Task Starting Date</th>
		<th>Task Ending Date</th>
		<th>Assigned To</th>
	</tr>
	</thead>
<tbody>
<%
int i = 0;
for (Task viewtask: taskList ) {
i++;

%>
<tr>


<td><%=i%></td>
<td><%=viewtask.getTask()%></td>
<td><%=viewtask.getTaskpriority()%></td>
<td> <%=viewtask.getDateassigned()%></td>
<td> <%=viewtask.getEnddate()%></td>
<td> <%=viewtask.getAssignedto()%></td>
</tr>

<%
}
%>
</tbody>
</table>


</body>
</html>