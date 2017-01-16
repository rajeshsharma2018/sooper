package com.simplesarkar.common;

//a common util that holds the logic to validate various sorts of arguments
public final class ArgumentValidator {
	
	//Validates if a string is not empty or null
	public static boolean IsStringNullOrEmpty(String arg)
	{
		if ((arg == null) || (arg.isEmpty()))
		{
			return true;
		}
		
		return false;
	}
	
	//Check if a user Id is valid or not...
	public static boolean IsUserIdValid(long userId)
	{
		if (userId <= 0)
		{
			return false;
		}
		
		//TODO : Add more criteria?
		return true;
	}
}
