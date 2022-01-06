package com.timesheet.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.timesheet.dao.ViewTimesheetsDAO;
import com.timesheet.model.ViewTimesheets;
import com.timesheet.util.Connectionutil;

public class ViewTimesheetsDAOimpl implements ViewTimesheetsDAO {
	public List<ViewTimesheets> showAllTimesheet()
	{
		List<ViewTimesheets> timesheetlist=new ArrayList<ViewTimesheets>();
		String selectquery="select ud.user_name,ts.comments,ts.spend_time_hrs,ts.timesheet_for_date,ts.task_id,ts.timesheet_id from timesheets ts inner join user_details ud on ts.user_id=ud.user_id";
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
			ViewTimesheets timesheet=new ViewTimesheets(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getDate(4).toLocalDate(),rs.getInt(5),rs.getInt(6));
			timesheetlist.add(timesheet);
		}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
//			System.out.println("somthing went wrong");
		}
		
		return timesheetlist;
	}

}
