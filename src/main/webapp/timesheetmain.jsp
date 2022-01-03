<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>Timesheet</title>
    <style>
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
        
        <a href="index.jsp"><img class="a" src="images/Home.jpg" alt="Home"width="42px" height="42px" title="Home"></a>
        <a href="timesheet.jsp"><img src="images/timeshet.jpg" alt="Timesheet"width="42px" height="42px" title="Timesheet"></a>
        <a href="#"><img src="images/addtask.jpg" alt="addtask"width="42px" height="42px" title="Add Task"></a>
        <a href="report.jsp"><img src="images/1report.jpg" alt="report"width="42px" height="42px" title="Report"></a>
        <a href="users.jsp"><img src="images/user1.jpg" alt="user"width="42px" height="42px" title="user"></a>
        <a href="login.jsp"><img class="signout" src="images/signout.png" alt="signout"width="42px" height="42px" title="Signout"></a>
    </nav>
    <br><br>
     <div class="sidebar"> 
        <ul>
        <li><a href="timesheetmain.jsp">Add Timesheet</a><br><br></li>
        <li><a href="updatetimesheet.jsp">Edit Timesheet</a><br><br></li>
        <li><a href="deletetimesheet.jsp">Delete Timesheet</a><br><br></li>
        <li><a href="view timesheet.jsp">View Timesheet</a><br><br></li>
        </ul>
    </div>
    <div class="box">
        <form method="post" action="timesheet">
            <table>
            <tr>
       <th><label for="timesheetdate">Enter Timesheet Date</label></th>
       <td><input type="date" name="timesheetdate" required></td>
    </tr>
                <tr>
       <th><label for="userid">User Id</label></th>
       <td><input type="number" name="userid" required></td>
    </tr>
    <tr>
       <th> <label for="taskname">Enter Task Name</label></th>
        <td><input type="text" name="taskname" required></td>
    </tr>
     <tr>
       <th> <label for="spendinghrs">Enter Spending Hrs</label></th>
        <td><input type="number" name="assigningdate" required></td>
    </tr>
    <tr>
       <th><label for="comments">Enter Comments</label></th>
       <td><input type="text" name="comments" required></td>
    </tr>
    <tr>
       <th><label for="status">Status</label></th>
       <td><input type="text" name="status" required></td>
    </tr>
    </table><br><br>
   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="submit"value="Submit">
   &nbsp; &nbsp; <input type="reset"value="Reset">
    </form>
        
    </div>
</body>
</html>