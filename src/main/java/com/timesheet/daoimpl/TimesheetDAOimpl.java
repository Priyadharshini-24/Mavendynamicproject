package com.timesheet.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.timesheet.dao.TimesheetDAO;
import com.timesheet.model.Timesheet;
import com.timesheet.util.Connectionutil;

public class TimesheetDAOimpl implements TimesheetDAO 
{
	public boolean insertTimesheet(Timesheet timesheet)
	{
		boolean flag=false;
		String insertquery="insert into timesheets(user_id,task_id,spend_time_hrs,comments,timesheet_for_date)values(?,?,?,?,?)";
		Connectionutil conutil=new Connectionutil();
		Connection con=conutil.getDbConnection();
		PreparedStatement pstmt=null;
		try
		{
			pstmt=con.prepareStatement(insertquery);
			pstmt.setInt(1, timesheet.getUserid());
			pstmt.setInt(2, timesheet.getTaskid());
			pstmt.setInt(3, timesheet.getSpendtime());
			pstmt.setString(4,timesheet.getComments());
			pstmt.setDate(5,java.sql.Date.valueOf(timesheet.getTimesheetfordate()));
			if(pstmt.executeUpdate()>0)
			{
				flag=true;
			}
			
//			System.out.println("Timesheet Entered successfully");
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			System.out.println("somthing went wrong");
		}
		return flag;
	}
	public boolean updateTimesheet(Timesheet timesheet)
	{
		boolean flag=false;
		String updatequery="update timesheets set user_id=?,spend_time_hrs=?,comments=? where timesheet_for_date=?";

		Connection con=Connectionutil.getDbConnection();
		PreparedStatement pstmt=null;
		try
		{
			pstmt=con.prepareStatement(updatequery);
			pstmt.setInt(1, timesheet.getUserid());
			pstmt.setInt(2, timesheet.getSpendtime());
			pstmt.setString(3,timesheet.getComments());
			pstmt.setDate(4,java.sql.Date.valueOf(timesheet.getTimesheetfordate()));
//			System.out.println("dao"+java.sql.Date.valueOf(timesheet.getTimesheetfordate()));
			if(pstmt.executeUpdate()>0)
			{
				flag=true;
			}
//			int i=pstmt.executeUpdate();
//			System.out.println(i+" Timesheet updated");
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			System.out.println("something went wrong");
		}
		return flag;
	}
	public List<Timesheet> showTimesheet(int userid)
	{
		List<Timesheet> timesheetlist=new ArrayList<Timesheet>();
		String selectquery="select * from timesheets where user_id='"+userid+"'";
		Connectionutil conutil=new Connectionutil();
		Connection con=conutil.getDbConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try
		{
			pstmt=con.prepareStatement(selectquery);	
			rs=pstmt.executeQuery();
		while(rs.next())
		{
			Timesheet timesheet=new Timesheet(rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getDate(6).toLocalDate());
			timesheetlist.add(timesheet);
		}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			System.out.println("somthing went wrong");
		}
		
		return timesheetlist;
	}
	
//	public boolean removeTimesheet(String timesheetfordate)
//	{
//	     boolean flag=false;
//		String removequery="delete from timesheets where timesheet_for_date=?";
//		Connection con=Connectionutil.getDbConnection();
//		PreparedStatement pstmt=null;
//		try
//		{
//			pstmt=con.prepareStatement(removequery);
//		    pstmt.setString(1,timesheetfordate);
//	    if(pstmt.executeUpdate()>0)
//	     {
//		  flag=true;
//	      }
//		    int i=pstmt.executeUpdate();
//            System.out.println(i+" Timesheet Remove ");
//			
//		}
//		catch(SQLException e)
//		{
//			e.printStackTrace();
//			System.out.println("something went wrong");
//		}
//	    return flag;
//		}
	public  int findTimesheetId(LocalDate timesheetfordate)
	{
		String findUser="select timesheet_id from timesheets where to_char(timesheet_for_date,'yyyy-MM-dd')='"+timesheetfordate+"'";
		Connection con=Connectionutil.getDbConnection();
		Statement stmt;
		int timesheetId=0;
		try {
			stmt = con.createStatement();
			ResultSet rs=stmt.executeQuery(findUser);
			if(rs.next())
			{
			timesheetId=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return timesheetId;
		
	}
	}
	
	
	
