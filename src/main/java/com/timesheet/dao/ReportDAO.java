package com.timesheet.dao;

import java.util.List;

import com.timesheet.model.Report;

public interface ReportDAO {
	public List<Report> findreport(String timesheetdate,String username);

}
