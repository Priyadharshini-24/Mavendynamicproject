package com.timesheet.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.timesheet.daoimpl.TimesheetDAOimpl;
import com.timesheet.model.Timesheet;
@WebServlet("/updatetimesheet")
/**
 * Servlet implementation class UpdateTimesheet
 */
public class UpdateTimesheet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTimesheet() {
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
		DateTimeFormatter format=DateTimeFormatter.ofPattern("dd-MM-yyyy");
		String timedate=request.getParameter("timesheetdate");
		LocalDate timesheetdate=LocalDate.parse(timedate);
		int userid=Integer.parseInt(request.getParameter("userid"));
		int spendhrs=Integer.parseInt(request.getParameter("spendinghrs"));
		String comments=request.getParameter("comments");
		TimesheetDAOimpl timesheetdao=new TimesheetDAOimpl();
		Timesheet timesheet=new Timesheet(userid,0,spendhrs,comments,timesheetdate);
//		System.out.println(timesheet);
		boolean flag=timesheetdao.updateTimesheet(timesheet);
		if(flag)
		{
			request.setAttribute("timesheet","Timesheet updated Successfully");
		}
		else
		{
			request.setAttribute("timesheet","Timesheet not updated");
		}
		
		request.getRequestDispatcher("updatetimesheet1.jsp").forward(request, response);
	}
	}


