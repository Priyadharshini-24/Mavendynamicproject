package com.timesheet.dao;

import java.util.List;

import com.timesheet.model.Task;

public interface TaskDAO {
	public void insertTask(Task task);
	public void updateTask(Task task);
	public List<Task> showallTask();
	public List<Task> showTask(String username);
	public  int findtaskId(String task);
	public void removeTask(String task);

}
