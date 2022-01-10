<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.timesheet.daoimpl.ReportDAOimpl"%>
<%@page import="com.timesheet.model.Report"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report</title>
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
</style>
</head>
<body style="background-image:url(images/Time2.jpg)";>
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
<%
DateTimeFormatter format=DateTimeFormatter.ofPattern("dd-MM-yyyy");
String timedate=request.getParameter("timesheetdate");
LocalDate timesheetdate=LocalDate.parse(timedate);
String username=(String)session.getAttribute("username");
ReportDAOimpl reportdao=new ReportDAOimpl();
List<Report> showReport=reportdao.findreport(timesheetdate, username);

%>
<table id="report">
	<h2><b>Report</b></h2>
<tbody>
<%

for (int i=0; i<showReport.size(); i++ ) {

Report view = showReport.get(i);
System.out.println("jsp page "+view.getTimesheetid());
%>
<tr>
<td>Timesheet Date :&nbsp;&nbsp;&nbsp;<%=view.getTimesheetdate()%></td>
</tr> 
<tr>
<td>Timesheet Id :&nbsp;&nbsp;&nbsp;<%=view.getTimesheetid()%></td>
</tr>
<tr>
<td>User Name :&nbsp;&nbsp;&nbsp;<%=view.getUsername()%></td>
</tr>
<tr>
<td>User Role :&nbsp;&nbsp;&nbsp;<%=view.getRole()%></td>
</tr>
<tr>
<td>Task Name : &nbsp;&nbsp;&nbsp;
<%=view.getTask()%></td>
</tr>
<tr>
<td>User Name :&nbsp;&nbsp;&nbsp;<%=view.getUsername()%></td>
</tr>
<tr>
<td>Spending Hrs :&nbsp;&nbsp;&nbsp;<%=view.getSpendhrs()%></td>
</tr>
<tr>
<td>Timesheet Status :&nbsp;&nbsp;&nbsp;<%=view.getStatus()%></td>
</tr>
<tr>
<td>Approved By :&nbsp;&nbsp;&nbsp;<%=view.getApprovedby()%></td>
</tr>
<tr>
<td>Timesheet Status Updated Date :&nbsp;&nbsp;&nbsp;<%=view.getApprovedon()%></td>
</tr>
<%
}
%>
</tbody>
</table>
</body>
</html>