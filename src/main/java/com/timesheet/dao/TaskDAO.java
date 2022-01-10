package com.timesheet.dao;

import java.util.List;

import com.timesheet.model.Task;

public interface TaskDAO {
	public boolean insertTask(Task task);
	public boolean updateTask(Task task);
	public List<Task> showallTask();
	public List<Task> showTask(String username);
	public  int findtaskId(String task);
	public boolean validateTask(String taskname,String username);
	public boolean getTotalhrs(String username,String taskname);
//	public boolean removeTask(String task);

}
