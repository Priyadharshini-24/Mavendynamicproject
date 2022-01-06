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
<a href="viewalltimesheet.jsp"><button>viewtimesheet</button></a>
<a href="viewstatus.jsp"><button>viewStatus</button></a>
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