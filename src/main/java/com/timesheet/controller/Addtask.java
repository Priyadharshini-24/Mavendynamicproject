package com.timesheet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.timesheet.daoimpl.TaskDAOimpl;
import com.timesheet.daoimpl.UserDAOimpl;
import com.timesheet.model.Task;
@WebServlet("/addtask")
/**
 * Servlet implementation class Addtask
 */
public class Addtask extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addtask() {
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
		PrintWriter out=response.getWriter();
		String taskname=request.getParameter("taskname");
		SimpleDateFormat sdf=new SimpleDateFormat("DD-MM-YYYY");
		Date assigningdate=null;
		try {
			assigningdate=sdf.parse(request.getParameter("assigningdate"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Date endingdate=null;
		try {
			endingdate=sdf.parse(request.getParameter("endingdate"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String priority=request.getParameter("priority");
		String username=request.getParameter("username");
		UserDAOimpl userdao=new UserDAOimpl();
		TaskDAOimpl taskdao=new TaskDAOimpl();
		int id=userdao.findUserId(username);
		System.out.println(id+taskname+assigningdate+endingdate+priority+username);
		Task task=new Task(id,taskname,assigningdate,endingdate,priority,username);
		taskdao.insertTask(task);
		out.println("task successfully added");
	}

}
