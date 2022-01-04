package com.timesheet.dao;

import java.util.List;

import com.timesheet.model.Status;

public interface StatusDAO {
	public void insertStatus(Status status);
	public void updateStatus(Status status);
	 public List<Status> showStatus(int timesheetid);
//	 public void removeStatus(int timesheetid);

}
