package com.timesheet.dao;

import com.timesheet.model.User;

public interface AdminDAO {
	public User validateAdmin(String username,String password);
}
