<%@page import="java.sql.*"%>
<%@page import="com.timesheet.util.Connectionutil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title> Update Status</title>
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
        h1{
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
       /* a:link {
        font-size: 20px;
        color: rgb(250, 252, 250);
        text-decoration: none;
          }
       a:hover {
         color: rgb(158, 250, 96);
         text-decoration: none;
         }
       a:active {
         color: rgb(245, 245, 91);
        text-decoration: underline;
        }    */
    </style>
    <link rel="stylesheet" href="addtaskmain.css">
</head>
<body style="background-image:url(images/Time2.jpg)";>
    <h1 align="center">TRACK YOUR TIME</h1>
    <nav>
        
        <a href="adminindex.jsp"><img class="a" src="images/Home.jpg" alt="Home"width="42px" height="42px" title="Home"></a>
        <a href="timesheetstatus.jsp"><img src="images/timeshet.jpg" alt="Timesheet"width="42px" height="42px" title="Timesheet"></a>
        <a href="addtask.jsp"><img src="images/addtask.jpg" alt="addtask"width="42px" height="42px" title="Add Task"></a>
        <a href="#report.jsp"><img src="images/1report.jpg" alt="report"width="42px" height="42px" title="Report"></a>
        <a href="adminuser.jsp"><img src="images/user1.jpg" alt="user"width="42px" height="42px" title="user"></a>
        <a href="login.jsp"><img class="signout" src="images/signout.png" alt="signout"width="42px" height="42px" title="Signout"></a>
    </nav>
    <br><br>
     <div class="sidebar"> 
        <ul>
        <li><a href="timesheetadmin.jsp">Add Timesheet status</a><br><br></li>
        </ul>
    </div>
    <%! int timesheetid; %>
    <%timesheetid=Integer.parseInt(request.getParameter("timesheetid")); 
    String query="select * from status where timesheet_id='"+timesheetid+"'";
    Connectionutil conutil=new Connectionutil();
    Connection con=conutil.getDbConnection();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery(query);
    if(rs.next()){%>
     <div class="box">
        <form method="post" action="updateStatus">
            <table>
            <tr>
       <th><label for="timesheetid">Enter Timesheet Id</label></th>
       <td><input type="number" name="timesheetid" value="<%=rs.getInt(3)%>" readonly required></td>
    </tr>
    <tr>
       <th><label for="userid">User Id</label></th>
       <td><input type="number" name="userid" value="<%=rs.getInt(2)%>" readonly required></td>
    </tr>
    <tr>
       <th><label for="status">Enter Status</label></th>
       <td><select name="status" required>
       <option>Approved</option>
       <option>Rejected</option>
       <option>Not Approved</option>
       </select></td>
    </tr>
    <tr>
       <th><label for="approvedby">Approvedb By</label></th>
       <td><input type="text" name="approvedby" value="<%=rs.getString(5)%>" readonly required></td>
    </tr>
    
    </table><br><br>
   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
   <input type="submit"value="Submit">
   
        <%} %>
        
         <%!
String flag;
%>
<%
if(request.getAttribute("status") != null){
flag = request.getAttribute("status").toString();
%>
<h4><%= flag%></h4>
<% }%> 
    </form>
     </div>
    </body>
</html>