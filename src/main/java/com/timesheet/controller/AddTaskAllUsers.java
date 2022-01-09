package com.timesheet.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.timesheet.daoimpl.AdminDAOimpl;
import com.timesheet.daoimpl.TaskDAOimpl;
import com.timesheet.daoimpl.UserDAOimpl;
import com.timesheet.model.AdminUser;
import com.timesheet.model.Task;
@WebServlet("/addtaskalluser")

public class AddTaskAllUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddTaskAllUsers() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String taskname=request.getParameter("taskname");
		DateTimeFormatter format=DateTimeFormatter.ofPattern("dd-MM-yyyy");
		String assigningdate=request.getParameter("assigningdate");
		LocalDate assdate=LocalDate.parse(assigningdate);
		String endingdate=request.getParameter("endingdate");
		LocalDate enddate=LocalDate.parse(endingdate);
		String priority=request.getParameter("priority");
		UserDAOimpl userdao=new UserDAOimpl();
		TaskDAOimpl taskdao=new TaskDAOimpl();
		AdminDAOimpl admindao=new AdminDAOimpl();
		List<AdminUser> userList = new ArrayList<AdminUser>();
		userList=admindao.showusers();
		int id=0;
		boolean flag=false;
		for (AdminUser viewUser: userList ) {
		id=userdao.findUserId(viewUser.getUsername());
		Task task=new Task(id,taskname,assdate,enddate,priority,viewUser.getUsername());
	    flag=taskdao.insertTask(task);
		}
		if(flag)
		{
			request.setAttribute("task","Task Added Successfully");
		}
		else
		{
			request.setAttribute("task","Task Not Added");
		}
		request.getRequestDispatcher("addtaskalluser.jsp").forward(request, response);
	}

		
	}

