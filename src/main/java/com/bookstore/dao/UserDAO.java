package com.bookstore.dao;

import com.bookstore.model.User;

import java.util.List;

public interface UserDAO {
	boolean isExistsUser(User user);
	boolean saveUser(User user);
	User getUserById(int id);
	int getIdByUserName(String username);
	boolean update(User user);
	boolean updateUserAdmin(User user);
	String getPasswordByUserName(String name);
	void updatePassword(String password, String name);
	List<User> listUser(int id);
	List<String> listRole();
	boolean deleteUser(int id);
}
