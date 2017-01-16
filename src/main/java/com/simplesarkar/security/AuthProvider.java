package com.simplesarkar.security;

import com.simplesarkar.common.ArgumentValidator;
import com.simplesarkar.common.IDataBaseConnector;
import com.simplesarkar.common.ValidationToken;
import com.simplesarkar.databaseutils.DataBaseConnectorFactory;
import com.simplesarkar.databaseutils.DataBaseTypes;
import com.simplesarkar.databaseutils.EndUserDBHelper;
import com.simplesarkar.model.User;

//Wrapper over AuthN class.. makes it easy to use in the JSP code
public final class AuthProvider {
    public static String AuthenticateUser(String userName, String passwdHash, String salt)
    {
    	AuthN authN = new AuthN();
    	
    	try
    	{
    	//TODO : get the following config values from a  config file...
    	authN.Init();
    	
    	return authN.ValidateCredentialsAndGetToken(userName, passwdHash, salt);
    	}
    	catch (Exception ex)
    	{
    		System.out.println("Caught Exception when tryin to validate user AuthN : " + ex.getMessage());
    		return null;
    	}
    }
    
    //Authenticate user with cleartext passwd
    public static String AuthenticateUser(String userName, String passwd)
    {
    	AuthN authN = new AuthN();
    	
    	try
    	{
    	//TODO : get the following config values from a  config file...
    	authN.Init();
    	
    	return authN.ValidateCleartextCredentialsAndGetToken(userName, passwd);
    	}
    	catch (Exception ex)
    	{
    		System.out.println("Caught Exception when tryin to validate user AuthN : " + ex.getMessage());
    		return null;
    	}
    }
    
    public static boolean IsSessionAuthenticated(String token)
    {
    	ValidationToken vD = new ValidationToken();
    	
    	try
    	{
    	vD.Init(token);
    	
    	return vD.IsValid();
    	}
    	catch (Exception ex)
    	{
    		System.out.println("Caught Exception when tryin  to validate session authN : " + ex.getMessage());
    		return false;
    	}
    }
    
    //Given a token, return the user Name
    public static String GetUserNameFromToken(String token)
    {
    	if (ArgumentValidator.IsStringNullOrEmpty(token))
    	{
    		return null;
    	}
    	
    	String userName = null;
    	ValidationToken vD = new ValidationToken();
    	
    	try
    	{
    	vD.Init(token);
    	
    	if(vD.IsValid())
    	{
    		long userId = vD.GetUserId();
    		if (ArgumentValidator.IsUserIdValid(userId))
    		{
    			//TODO : maybe cache the users in a user cache.. so that we dont have to constantly hit 
    			//the DB for the user query fro the various components
    			//TODO : if we keep this code, we need to make sure the config values come from a config file
    			EndUserDBHelper dbConnector = new EndUserDBHelper();
    			dbConnector.Init();
    			
    			User user = dbConnector.GetUserById(userId);
    			if (user != null)
    			{
    				return user.getEmail();
    			}
    		}
    	}
    	}
    	catch (Exception ex)
    	{
    		System.out.println("Caught Exception when tryin  to get user name from token : " + ex.getMessage());
    		return null;
    	}
    	
    	return userName;
    }
}
