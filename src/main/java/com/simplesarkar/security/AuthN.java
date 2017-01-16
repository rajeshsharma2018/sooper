package com.simplesarkar.security;

import java.io.FileNotFoundException;

import org.apache.log4j.Logger;
import org.hibernate.tuple.InDatabaseValueGenerationStrategy;

import com.simplesarkar.common.ArgumentValidator;
import com.simplesarkar.common.IDataBaseConnector;
import com.simplesarkar.common.SimpleUtils;
import com.simplesarkar.common.ValidationToken;
import com.simplesarkar.databaseutils.DataBaseConnectorFactory;
import com.simplesarkar.databaseutils.DataBaseTypes;
import com.simplesarkar.databaseutils.EndUserDBHelper;
import com.simplesarkar.model.User;

//Class to authenticate a user... This class is not responsible for authorization.. just authentication, i.e.
//the use is who they say they are... This should be sufficient for end users.
public class AuthN {
	
	private EndUserDBHelper dbConnector;
	private boolean isInitd;
	final static Logger log = Logger.getLogger(ValidationToken.class);
	
	//TODO : this could be a singleton.. come back later to see if we can make it one
	public AuthN()
	{
		isInitd = false;
		dbConnector = null;
	}
	
	public void Init()
	throws IllegalArgumentException, Exception
	{
		if (isInitd == true)
		{
			return;
		}
		
		dbConnector = new EndUserDBHelper();
		dbConnector.Init();
		isInitd = true;
	}

	//Validate Creds for a user given his username and the MD5 hash of the password 
	//(calculated by appending the provided salt , which can be null )
	//Returns a ValudationToken (as a string) that can be used to validate the user later.
	//This token could potentially be saved as a cookie by the client side to be used later.
	public String ValidateCredentialsAndGetToken(String emailId, String passowrdHash, String salt)
	throws IllegalArgumentException, FileNotFoundException
	{
		boolean isAuthenticated = false;
		
		if (!isInitd)
		{
			return null;
		}
		
		if (ArgumentValidator.IsStringNullOrEmpty(emailId))
		{
			throw new IllegalArgumentException("emailId is null or empty");
		}
		
		if (ArgumentValidator.IsStringNullOrEmpty(passowrdHash))
		{
			throw new IllegalArgumentException("passwordHash is null or empty");
		}
		
		if (passowrdHash.length() > SimpleUtils.MD5HashLength)
		{
			throw new IllegalArgumentException("The password hash sent in (" + passowrdHash.length() + ") is longer then the allowed limit for an MD5 hash ( " + SimpleUtils.MD5HashLength + ")");
		}
		
		//lets see if the user exists in the database
		
		User user = dbConnector.GetUserByEmailId(emailId);
		
		if (user == null)
		{
			throw new FileNotFoundException("User with eid : " + emailId + " not found");
		}
		
		isAuthenticated = ValidatePasswordHashForUser(user.getPassword(), passowrdHash, salt);
		
		if(isAuthenticated)
		{
			ValidationToken vd = new ValidationToken();
			
			String strToCalcluateHashOf = user.getPassword() + user.getId();
			String[] roles = GetRolesForUserWithId(user.getId());
			vd.Init(user.getId(), user.getEmail(), SimpleUtils.CalculateMD5Hash(strToCalcluateHashOf), roles);
			return vd.ToString();
		}
		else
		{
			log.warn("USer with email " + emailId + "not authenticated");
			return null;
		}
	}
	
	//Validate Creds for a user given his username and the cleartest password 
	//Returns a ValudationToken (as a string) that can be used to validate the user later.
	//This token could potentially be saved as a cookie by the client side to be used later.
	public String ValidateCleartextCredentialsAndGetToken(String emailId, String passowrd)
	throws IllegalArgumentException, FileNotFoundException
	{
		boolean isAuthenticated = false;
		
		if (!isInitd)
		{
			return null;
		}
		
		if (ArgumentValidator.IsStringNullOrEmpty(emailId))
		{
			throw new IllegalArgumentException("email is null or empty");
		}
		
		if (ArgumentValidator.IsStringNullOrEmpty(passowrd))
		{
			throw new IllegalArgumentException("passwordHash is null or empty");
		}
		
		//lets see if the user exists in the database
		
		User user = dbConnector.GetUserByEmailId(emailId);
		
		if (user == null)
		{
			throw new FileNotFoundException("User with email : " + emailId + " not found");
		}
		
		isAuthenticated = passowrd.equals(user.getPassword());
		
		if(isAuthenticated)
		{
			ValidationToken vd = new ValidationToken();
			
			String strToCalcluateHashOf = user.getPassword() + user.getId();
			
			String[] roles = GetRolesForUserWithId(user.getId());
			vd.Init(user.getId(), user.getEmail(), SimpleUtils.CalculateMD5Hash(strToCalcluateHashOf), roles);
			return vd.ToString();
		}
		else
		{
			log.warn("USer " + emailId + "not authenticated");
			return null;
		}
	}
	
	//Given a user Id and a password hash, return true if the hash matched the hash for the users passwd
	public boolean ValidatePassowordHashWithId(long userIdIn, String passowrdHash, String salt) throws FileNotFoundException
	{
		//TODO : Once the reset password page is turned on, set the last boolean value in the line below to false
		return ValidatePassowordHashWithId(userIdIn, passowrdHash, salt, true);
	}
	
	//Given a user Id and a password hash, return true if the hash matched the hash for the users passwd
	public boolean ValidatePassowordHashWithId(long userIdIn, String passowrdHash, String salt, boolean allowTempPassword) throws FileNotFoundException
	{
		boolean isAuthenticated = false;
		
		if (!isInitd)
		{
			return false;
		}
		
		if (!ArgumentValidator.IsUserIdValid(userIdIn))
		{
			throw new IllegalArgumentException("userId sent in is invalid");
		}
		
		if (ArgumentValidator.IsStringNullOrEmpty(passowrdHash))
		{
			throw new IllegalArgumentException("passwordHash is null or empty");
		}
		
		if (passowrdHash.length() > SimpleUtils.MD5HashLength)
		{
			throw new IllegalArgumentException("The password hash sent in (" + passowrdHash.length() + ") is longer then the allowed limit for an MD5 hash ( " + SimpleUtils.MD5HashLength + ")");
		}
		
		//lets see if the user exists in the database
		
		User user = dbConnector.GetUserById(userIdIn);
		
		if (user == null)
		{
			throw new FileNotFoundException("User with ID : " + userIdIn + " not found");
		}
		
		 
		
		isAuthenticated = ValidatePasswordHashForUser(user.getPassword(), passowrdHash, salt);
		
		return isAuthenticated;
	}
	
	private String[] GetRolesForUserWithId(long userIdIn)
	{
		String[] roles = null;
		
		if (!ArgumentValidator.IsUserIdValid(userIdIn))
		{
			throw new IllegalArgumentException("userId sent in is invalid");
		}
		
		//TODO : implement the get Roles for user functionality to fetch the users roles from the DB...
		roles = new String[1];
		roles[0] = "user";
		
		return roles;
	}
	
	//Given a user's password in plaintext, a password hash and a salt see if the password hash is valid for the user
	private boolean ValidatePasswordHashForUser(String password, String passowrdHash, String salt)
	{
		boolean passwordMatched = false;
		
		StringBuffer stringToCaclculateMd5for = new StringBuffer(password);
		
		if (!ArgumentValidator.IsStringNullOrEmpty(salt))
		{
			stringToCaclculateMd5for = stringToCaclculateMd5for.append(salt);
		}
		
		String hashOfPasswd = SimpleUtils.CalculateMD5Hash(stringToCaclculateMd5for.toString());
		
		if (hashOfPasswd.equals(passowrdHash))
		{
			passwordMatched = true;
		}
		
		return passwordMatched;
	}
}
