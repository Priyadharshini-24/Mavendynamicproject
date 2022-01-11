
<%@page import="java.sql.*"%>
<%@page import="com.timesheet.util.Connectionutil"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.timesheet.model.Task"%>
<%@page import="java.util.*"%>
<%@page import="com.timesheet.daoimpl.TaskDAOimpl"%>
<%@page import="com.timesheet.model.User"%>
<%@page import="com.timesheet.daoimpl.UserDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>Timesheet</title>
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
   <% UserDAOimpl userdao = new UserDAOimpl();
   User user=new User();
   String username=(String)session.getAttribute("username");
   int uid=userdao.findUserId(username);
  // TaskDAOimpl taskdao=new TaskDAOimpl();
   //List<Task> taskList = new ArrayList<Task>();
   //taskList = taskdao.showTask(username);
   String query="select to_char(sysdate,'yyyy-MM-dd') from dual";
   Connection con=Connectionutil.getDbConnection();
   Statement st=con.createStatement();
   ResultSet rs=st.executeQuery(query);
   String Date=null;
   if(rs.next())
   {
	 Date=rs.getString(1);  
	 System.out.println(Date);
   }
   String name=(String)request.getParameter("taskName");
   String date=(String)request.getParameter("taskDate");
	 System.out.println("sys"+date);
   
%>
    <h1 align="center">TRACK YOUR TIME</h1>
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

 
        <form method="post" action="timesheet">
            <table>
            <tr>
       <th><label for="timesheetdate">Enter Timesheet Date</label></th>
       <td><input type="date" min="<%=date%>" max="<%=Date%>" name="timesheetdate" required></td>
    </tr>
    <tr>
       <th> <label for="taskname">Enter Task Name</label></th>
        <td><input type="text" name="taskname" value="<%=name%>" readonly required></td>
    </tr>
     <tr>
       <th> <label for="spendinghrs">User Id</label></th>
        <td><input type="number" name="userid" value="<%=uid %>"readonly></td>
    </tr>
     <tr>
       <th> <label for="spendinghrs">Enter Spending Hrs</label></th>
        <td><input type="number" pattern="[1-9]{1+}" maxlength="2" name="spendinghrs" required></td>
    </tr>
    <tr>
       <th><label for="comments">Enter Comments</label></th>
       <td><input type="text" name="comments" required></td>
    </tr>
    <tr>
       <th><label for="status" >Status</label></th>
       <td><input type="text" name="status" placeholder="not approved" readonly></td>
    </tr>
    </table><br><br>

   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="submit"value="Submit">
   &nbsp; &nbsp; <input type="reset"value="Reset">
    </form>
    <script type="text/javascript">
    function name() {
		
	}
    </script>
      <%!
String flag;
%>
<%
if(request.getAttribute("timesheet") != null){
flag = request.getAttribute("timesheet").toString();
%>
<h4><%= flag%></h4>
<% }%>
        
    </div>
 
</body>
</html>