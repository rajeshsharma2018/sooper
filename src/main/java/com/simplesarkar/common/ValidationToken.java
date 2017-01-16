package com.simplesarkar.common;

import java.text.ParseException;
import java.util.Date;

import org.apache.log4j.Logger;
import org.apache.commons.codec.binary.Base64;

import com.simplesarkar.security.AuthN;


//Class representing the validation token in memory... has serialize and de serialize functions.
/*The components of a token :
 *    - tokenSignature //a unique identifier which says that the token is ours
 *    - userId - id of the user whome the token is for
 *    - 32 chars unique to a token for the user
 *    - TTL, tokens life time in seconds (as of now a token will be valid for 1 hr (3600 seconds))
 *    - time of creation (UTC time the token was created at)
 *    
 *    Format : "tokenSignature:userId:timeOfCreation:TTL:tokenData"
 *    NOTE:
 *    * As of now the token is not encrypted... it lives in cleartext. We add the userId to the passwd as a salt.
 *    * This is kindof a disjoint thing.. where the AuthN code when generating the token used the userID as a salt.
 *    * We need to pass it back to AuthN when we validate the token. 
 **/
public class ValidationToken {
	
	private static final int NumParts = 7;
	
	private String rawToken;
	
	private final Integer tokenSignature = 0x7321;
	
	final static Logger log = Logger.getLogger(ValidationToken.class);
	
	private String timeOfCreation;
	
	//TODO : get this value from a config file
	private final Integer ttl = 3600;
	
	private Long userId;
	
	private String emailId;
	
	private String tokenData; //length is SimpleUtils.MD5HashLength
	
	//The roles the user has
	private String[] roles;
	
	private boolean isInitd;
	
	public ValidationToken()
	{
		rawToken = null;
		timeOfCreation = null;
		userId = null;
		tokenData = null;
		isInitd = false;
		roles = null;
		emailId = null;
	}
	
	//Serialize the token (returns a base64 encoded str)
	public String ToString()
	{
		if (isInitd)
		{
		    return rawToken;
		}
		else
		{
			return null;
		}
	}
	
	public long GetUserId()
	{
		if (isInitd)
		{
			return userId;
		}
		else
		{
			return -1;
		}
	}
	
	public String GetEmailId()
	{
		if (isInitd)
		{
			return emailId;
		}
		else
		{
			return null;
		}
	}
	
	public String[] GetRoles()
	{
		if (isInitd)
		{
			return roles;
		}
		else
		{
			return null;
		}
	}
	
	//Initialize the class from a raw token string
	//Desearilize
	public void Init(String rawTokenStr)
	throws IllegalArgumentException, ParseException
	{
		if(ArgumentValidator.IsStringNullOrEmpty(rawTokenStr))
		{
			throw new IllegalArgumentException("rawtokenStr is null or empty");
		}
		
		if (rawTokenStr.length() > SSConstants.MaxTokenLength)
		{
			throw new IllegalArgumentException("raw token length too long");
		}
		
		String decodedStr = new String(Base64.decodeBase64(rawTokenStr.getBytes()));	
		String[] parts = decodedStr.split("#");
		
		if (parts.length != ValidationToken.NumParts)
		{
			throw new IllegalArgumentException("rawtokenStr is not formatted correctly : not enough Data");
		}
		
		Integer tokenSig = Integer.decode(parts[0]);
		
		if (!tokenSig.equals(tokenSignature))
		{
			throw new IllegalArgumentException("rawtokenStr is not formatted correctly : tokenSig");
		}
		
		userId = Long.decode(parts[1]);
		
		if (!ArgumentValidator.IsUserIdValid(userId))
		{
			throw new IllegalArgumentException("rawtokenStr is not formatted correctly : userId");
		}
		
		emailId = parts[2];
		
		timeOfCreation = parts[3];
		
		Date dateCreated = null;
		
		try{
			dateCreated = SimpleUtils.StringDateToDate(timeOfCreation);
		}
		catch (ParseException ex)
		{
			throw new IllegalArgumentException("rawtokenStr is not formatted correctly : time Of Creation");
		}
		
		Integer ttlSent = Integer.decode(parts[4]);
		
		if (!ttlSent.equals(ttl))
		{
			throw new IllegalArgumentException("rawtokenStr is not formatted correctly : TTL");
		}
		
		tokenData = parts[5];
		
		if (tokenData.length() > SimpleUtils.UserAuthTokenDataLength)
		{
			throw new IllegalArgumentException("rawtokenStr is not formatted correctly : tokenData");
		}
		
		String roleList = parts[6];
		
		roles = roleList.split(",");
		
		rawToken = rawTokenStr;
		
		isInitd = true;
	}
	
	//Inits a token with a given user Id and tokenData.
	//Sets the date the token is created to UTC now
	public void Init(long userIdInp, String userNameIn, String tokenData, String[] roleList)
	throws IllegalArgumentException
	{
		if (!ArgumentValidator.IsUserIdValid(userIdInp))
		{
			throw new IllegalArgumentException("userId is invalid");
		}
		
		if (ArgumentValidator.IsStringNullOrEmpty(userNameIn))
		{
			throw new IllegalArgumentException("username is null or empty");
		}
		
		if (ArgumentValidator.IsStringNullOrEmpty(tokenData))
		{
			throw new IllegalArgumentException("tokenData is null or empty");
		}
		
		if (tokenData.length() > SimpleUtils.UserAuthTokenDataLength)
		{
			throw new IllegalArgumentException("tokenData is of wrong dimemtions");
		}
		
		if ((roleList == null) || (roleList.length == 0))
		{
			throw new IllegalArgumentException("users roles not specified...");
		}
		
        timeOfCreation = SimpleUtils.GetCurrentUTCdatetimeAsString();
        
        userId = userIdInp;
        
        emailId = userNameIn;
        
        this.tokenData = tokenData; 
        
        this.roles = roleList;
        
        String roleStr = "";
        
        for(int i = 0; i < roles.length;)
        {
        	roleStr = roleStr.concat(roles[i]);
        	if (i != (roles.length - 1))
        	{
        		roleStr.concat(",");
        	}
        	
        	i++;
        }
        
        String rawTokenUnEncoded = tokenSignature.toString() + "#" + 
                   userId.toString() + "#" + emailId + "#" +
        		   timeOfCreation + "#" + ttl.toString() +
        		   "#" + this.tokenData + "#" + roleStr;
        
        rawToken = new String(Base64.encodeBase64(rawTokenUnEncoded.getBytes()));
        
        isInitd = true;
	}
	
	//See of the token is expired...
	public boolean IsExpired()
	{
		boolean isExpired = true;
		Date dateCreated = null;
		
		if (!isInitd)
		{
			return isExpired;
		}
		
		try{
			dateCreated = SimpleUtils.StringDateToDate(timeOfCreation);
		}
		catch (ParseException ex)
		{
			log.warn("could not parse the date in the token : " + timeOfCreation + " caught exception : " + ex.toString());
			return isExpired;
		}
		
		Date dateNow = SimpleUtils.GetUTCNowAsDate();
		
		if (dateNow == null)
		{
			return isExpired;
		}
		
		long ttlMilliSecs = ttl * 1000;
		
		long createdMilliSecs = dateCreated.getTime();
		
		long milliSecsNow = dateNow.getTime();
		
		long tokenTimeout = createdMilliSecs + ttlMilliSecs;
		
		/* There are some interesting scenarios of long rolling over... but a Max long is 
		 * 9,223,372,036,854,775,807 (as of now in JAVA a long is 8 bytes). 
		 * If you were executing your function once per nanosecond, it would still take over 292 years to encounter this situation.
		 * So i think we should be good for some time now. If the code is still alive when we hit this situation.. 
		 * come see one of my instances (Pary here) running in the cloud somewhere :D n well patch it up ;)
		 * */
		if (tokenTimeout >= milliSecsNow)
		{
			isExpired = false;
		}
		else
		{
			log.warn("Token has timed out... renew it");
		}
	
		return isExpired;
	}
	
	//default IdValid, we do not allow TempPassord to validate for normal code path
	public boolean IsValid()
	{
		//TODO : Once the reset password page is created set the following value to false
		return IsValid(true);
	}
	
	//Check if the token is valid or not...
	public boolean IsValid(boolean allowTempPassword)
	{
		boolean isValid = false;
		
		//First check if the token hasnt expired...
		if (IsExpired())
		{
			log.warn("INVALID TOKEN!!!! Token has expired...");
			return isValid;
		}
		
		AuthN authN = new AuthN();
		
		try
		{
			//These settings need to move to a config file...
			authN.Init();
		
			//Now see if the data in the token is valid.. as in the passwd hash is for the user mentioned in the token
			if (authN.ValidatePassowordHashWithId(userId, tokenData, userId.toString(), allowTempPassword))
			{
				isValid = true;
			}
		}
		catch (Exception ex)
		{
			log.warn("Exception caught : " + ex.getMessage() + "\n"  + ex.toString());
			isValid = false;
		}
		
		return isValid;
	}

}
