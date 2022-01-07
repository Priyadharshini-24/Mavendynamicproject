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
</head>
<body>
<%
DateTimeFormatter format=DateTimeFormatter.ofPattern("dd-MM-yyyy");
String timedate=request.getParameter("timesheetdate");
LocalDate timesheetdate=LocalDate.parse(timedate);
String username=(String)session.getAttribute("username");
ReportDAOimpl reportdao=new ReportDAOimpl();
List<Report> showReport=reportdao.findreport(timesheetdate, username);

%>
<table id="report">
	<h1><b>Report</b></h1>
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
<td>Task Name : </td>
<td><%=view.getTask()%></td>
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