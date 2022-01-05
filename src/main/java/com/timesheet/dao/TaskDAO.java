package com.timesheet.dao;

import java.util.List;

import com.timesheet.model.Task;

public interface TaskDAO {
	public boolean insertTask(Task task);
	public boolean updateTask(Task task);
	public List<Task> showallTask();
	public List<Task> showTask(String username);
	public  int findtaskId(String task);
	public boolean removeTask(String task);

}
