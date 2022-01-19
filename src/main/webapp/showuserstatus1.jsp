<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Status search</title>
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
         body
       {
          background-color:rgb(107, 173, 235);
       }
    </style>
    <link rel="stylesheet" href="addtaskmain.css">
</head>
<body>
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
   <form action="showuserstatus.jsp">
   <label for="startdate">Start Date</label>
   <input type="date" name="startdate" required><br><br>
   <label for="startdate">End Date</label>
   &nbsp;<input type="date" name="enddate" required><br><br>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <input type="submit" value="Search">
   </form>

   </div>
</body>
</html>