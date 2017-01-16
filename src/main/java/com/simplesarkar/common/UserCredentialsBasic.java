package com.simplesarkar.common;

import java.io.Serializable;

public class UserCredentialsBasic implements Serializable {

	public UserCredentialsBasic(String userName, String password)
	{
		setUsername(userName);
		setPassword(password);
	}
	
	    /**
	 * 
	 */
	private static final long serialVersionUID = -5183625492579432905L;
	private String username;
	private String password;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
