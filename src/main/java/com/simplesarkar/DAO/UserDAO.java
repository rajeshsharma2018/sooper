 package com.simplesarkar.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.simplesarkar.common.ArgumentValidator;
import com.simplesarkar.common.IDataBaseConnector;
import com.simplesarkar.common.SimpleUtils;
import com.simplesarkar.common.ValidationToken;
import com.simplesarkar.databaseutils.DataBaseConnectorFactory;
import com.simplesarkar.databaseutils.DataBaseTypes;
import com.simplesarkar.databaseutils.EndUserDBHelper;
import com.simplesarkar.model.User;
import com.simplesarkar.security.AuthN;
import com.simplesarkar.utils.DataSource;

public class UserDAO {
	
	private EndUserDBHelper dbConnector;
	private AuthN authN;
	final static Logger log = Logger.getLogger(UserDAO.class);
	
	
	public UserDAO()
	{
		try
		{
		dbConnector = new EndUserDBHelper();
		dbConnector.Init();
		}
		catch (Exception ex)
		{
			dbConnector = null;
			System.out.println("DB conn is not initd : " + ex.getMessage());
		}
		
		try
		{
			authN = new AuthN();
			
			authN.Init();
		}
		catch(Exception ex)
		{
			authN = null;
			System.out.println("AuthN is not initd : " + ex.getMessage());
		}
	    
	}

	public  User getUser(long id, String email){
log.info("comes in get user");
		User user = null;
		StringBuffer stb = new StringBuffer();
		stb.append("select * from user where is_blacklisted =0 ");
		if(  id  > 0)
			stb.append(" and id=? ");
		if( StringUtils.isNotBlank(email))
			stb.append(" and email=? ");
 

		try {
			user = dbConnector.GetUserByEmailId(email);

			 
			
		} catch (IllegalArgumentException e) {
			log.error("error getting user"); 
			log.error(e);
		}
 
		return user;

	}

	public List<User> getAllUsers()
	{
		List<User> listOfUsers = null;
		
		if (dbConnector == null)
		{
			System.out.println("DBConn is not initd...");
			return listOfUsers;
		}
		
	    try
	    {
		    listOfUsers = dbConnector.GetAllUsers();
	    }
	    catch (Exception ex)
	    {
	    	System.out.println("Exception in getting data form DB : " + ex.getMessage());
	    }
	    
	    return listOfUsers;
	}
	
	private void ValidateAuthNCode(User user, String salt)
	{
		String passwd = user.getPassword();
		
		if (authN == null)
		{
			System.out.println("AuthN is not initd...");
			return;
		}
		
		if (!ArgumentValidator.IsStringNullOrEmpty(passwd))
		{
			StringBuffer stringToCaclculateMd5for = new StringBuffer(passwd);
			
			if (!ArgumentValidator.IsStringNullOrEmpty(salt))
			{
				stringToCaclculateMd5for = stringToCaclculateMd5for.append(salt);
			}
			
			String hashOfPasswd = SimpleUtils.CalculateMD5Hash(stringToCaclculateMd5for.toString());
			
			try
			{
			    String token = authN.ValidateCredentialsAndGetToken(user.getEmail(), hashOfPasswd, salt);
			    
			    if (!ArgumentValidator.IsStringNullOrEmpty(token))
			    {
			    	System.out.println("AuthN is working as expected... token : " + token);
			    	
			    	//LEts see of the Token code works...
			    	
			    	ValidationToken vdT = new ValidationToken();
			    	
			    	try{
			    		vdT.Init(token);
			    		
			    		if (vdT.IsValid())
			    		{
			    			System.out.println("ValidationToken is working as expected...");
			    		}
			    		else
			    		{
			    			System.out.println("ValidationToken is not working as expected... gave an invalid token");
			    		}
			    	}
			    	catch (Exception ex)
			    	{
			    		System.out.println("Somwething wrong with the token : " + ex.getMessage());
			    	}
			    	
			    }
			    else
			    {
			    	System.out.println("AuthN has issues man...");
			    }
			}
			catch (Exception ex)
			{
				System.out.println("Can not validate user's passwd, exception : " + ex.getMessage() );
			}
		}
	}


	public static long getUserIdFromToken(String token){
		long userId = 0;
		
		
		if (ArgumentValidator.IsStringNullOrEmpty(token))
		{
			 
			return -1;
		}

		ValidationToken vd = new ValidationToken();

		try {
			vd.Init(token);
			if (vd.IsValid())
			{
				log.info("token validated in getUserIdFromToken... ");
				userId = vd.GetUserId(); 
				 
				return userId;

			}else{
				 
				return -1;
			}
		}
		catch (Exception ex)
		{
			 
			return -1;
		}
		 
	}
	

public static boolean validateToken(String token){
	long userId = 0; 
	
	if (ArgumentValidator.IsStringNullOrEmpty(token))
	{
		log.info("No auth token found in the request... ");
		return false;
	}

	ValidationToken vd = new ValidationToken();

	try {
		vd.Init(token);
		if (vd.IsValid())
		{
			log.info("token validated ... ");
			userId = vd.GetUserId(); 
			 
			return true;

		}else{
			log.info("No auth token found in the request... sending to login");
			return false;
		}
	}
	catch (Exception ex)
	{
		log.warn("Got exception  when trying to validate sesison, sending to login, exception is : " + ex.toString() );
		return false;
	}

}

	public static void main(String args[]  ){
 
		
		
		UserDAO b = new UserDAO();

		//User u = b.getUser(9, ""); 
		
		List<User> listOfUsers = b.getAllUsers();
		
		int i = 0;
		for(User usr : listOfUsers)
		{
			i++;
			System.out.println("User : " + i);
			System.out.println("     " + usr.toString());
			
			String salt = null;
			
			if ((i/3) == 0)
			{
				salt = "1234";
			}
			
			b.ValidateAuthNCode(usr, salt);
		}
	
	}
	
	
	
	
}
