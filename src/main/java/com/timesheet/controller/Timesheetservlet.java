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
import com.timesheet.daoimpl.TimesheetDAOimpl;
import com.timesheet.daoimpl.UserDAOimpl;
import com.timesheet.model.Timesheet;
@WebServlet("/timesheet")
/**
 * Servlet implementation class Timesheet
 */
public class Timesheetservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Timesheetservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		TimesheetDAOimpl timesheetdao=new TimesheetDAOimpl();
		DateTimeFormatter format=DateTimeFormatter.ofPattern("dd-MM-yyyy");
		int id=Integer.parseInt(request.getParameter("userid"));
		String timedate=request.getParameter("timesheetdate");
		LocalDate timesheetdate=LocalDate.parse(timedate);
		String taskname=request.getParameter("taskname");
		TaskDAOimpl taskdao=new TaskDAOimpl();
		int id1=taskdao.findtaskId(taskname);
		int spendinghrs=Integer.parseInt(request.getParameter("spendinghrs"));
		String comments=request.getParameter("comments");
		Timesheet timesheet=new Timesheet(id,id1,spendinghrs,comments,timesheetdate);
		boolean flag=timesheetdao.insertTimesheet(timesheet);
		if(flag)
		{
//			int taskid=taskdao.findtaskId(taskname);
//			request.setAttribute("taskid", taskid);
			request.setAttribute("timesheet","Timesheet Added Successfully");
//			request.setAttribute("taskname",taskname);
		}
		request.getRequestDispatcher("timesheetmain.jsp").forward(request, response);
	}

}
