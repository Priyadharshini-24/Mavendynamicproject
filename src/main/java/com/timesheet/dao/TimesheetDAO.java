package com.timesheet.dao;

import java.util.List;

import com.timesheet.model.Timesheet;

public interface TimesheetDAO {
	public boolean insertTimesheet(Timesheet timesheet);
	public boolean updateTimesheet(Timesheet timesheet);
	public List<Timesheet> showTimesheet(int userid);
//	public boolean removeTimesheet(String timesheetfordate);
	public  int findTimesheetId(String timesheetfordate);
}
