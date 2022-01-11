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
<link rel="stylesheet" href="addtaskmain.css">
</head>
<body style="background-image:url(images/Time2.jpg)";>
<% TaskDAOimpl taskdao = new TaskDAOimpl();
   List<Task> taskList = new ArrayList<Task>();
   String username=(String)session.getAttribute("username");
   taskList = taskdao.showTask(username);
%>
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
     <div class="sidebar"> 
        <ul>
        <li><a href="showtask.jsp">Add Timesheet</a><br><br></li>
        <li><a href="Updatetimesheet.jsp">Edit Timesheet</a><br><br></li>
        <li><a href="rejectedtimesheet.jsp">Rejected Timesheet</a><br><br></li>
        <li><a href="showuserstatus1.jsp">View Timesheet Status</a><br><br></li>
        <li><a href="viewtimesheet.jsp">View Timesheet</a><br><br></li>
        </ul>
    </div>
    <div class="box">
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
		<th>Total Hrs</th>
		<th>Add Timesheet</th>
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
<td><%=viewtask.getTotalhrs()%></td>
<td><a href="timesheetmain.jsp?taskName=<%=viewtask.getTask()%>&taskDate=<%=viewtask.getDateassigned() %>" ><button>ADD</button></a></td>
</tr>

<%
}
%>
</tbody>
</table>
</div>
</body>
</html>