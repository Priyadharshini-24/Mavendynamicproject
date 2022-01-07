package com.timesheet.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.timesheet.daoimpl.TaskDAOimpl;
import com.timesheet.daoimpl.UserDAOimpl;
import com.timesheet.model.Task;

@WebServlet("/UpdateTask")
public class UpdateTask extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		DateTimeFormatter format=DateTimeFormatter.ofPattern("dd-MM-yyyy");
		String taskname=request.getParameter("taskname");
		String assigningdate=request.getParameter("assigningdate");
		LocalDate assdate=LocalDate.parse(assigningdate);
		String endingdate=request.getParameter("endingdate");
		LocalDate enddate=LocalDate.parse(endingdate);
		String priority=request.getParameter("priority");
		String username=request.getParameter("username");
		UserDAOimpl userdao=new UserDAOimpl();
		TaskDAOimpl taskdao=new TaskDAOimpl();
		int id=userdao.findUserId(username);
//		System.out.println(id);
		Task task=new Task(id,taskname,assdate,enddate,priority,username);
//		System.out.println(task);
		boolean flag=taskdao.updateTask(task);
		if(flag)
		{
			request.setAttribute("task","Task Updated Successfully");
		}
		else
		{
			request.setAttribute("task","Task not Updated ");
		}
		request.getRequestDispatcher("UpdateTask1.jsp").forward(request, response);
//		RequestDispatcher reqdis=request.getRequestDispatcher("addtaskmain.jsp");
//		reqdis.forward(request, response);
//		out.println("task successfully added");
	}

}
