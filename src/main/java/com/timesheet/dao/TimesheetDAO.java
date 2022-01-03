package com.timesheet.dao;

import java.util.List;

import com.timesheet.model.Timesheet;

public interface TimesheetDAO {
	public void insertTimesheet(Timesheet timesheet);
	public void updateTimesheet(Timesheet timesheet);
	public List<Timesheet> showTimesheet();
	public void removeTimesheet(String timesheetfordate);
	public  int findTimesheetId(String timesheetfordate);
}
