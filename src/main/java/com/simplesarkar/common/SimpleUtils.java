package com.simplesarkar.common;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import org.apache.commons.lang3.RandomStringUtils;

import java.util.Random;
import java.util.Base64;


//defines functions for various odd bits needed in the code.. 
public final class SimpleUtils {
	//md5 hash length... the string can not be longer than 32 chars...
	public final static int MD5HashLength = 32; 
	
	//the length of the token data section of a user AuthN token
	public final static int UserAuthTokenDataLength = MD5HashLength;
	
	//The format we store the date in the user AuthN token
	public final static String DATEFORMAT = "yyyy-MM-dd HH:mm:ss";

	//Returns the current UTC Date n time as a Date
	public static Date GetUTCNowAsDate()
	{
		//note: doesn't check for null
		try
		{
		return StringDateToDate(GetCurrentUTCdatetimeAsString());
		}
		catch (Exception ex)
		{
			return null;
		}
	}

	//Returns the current UTC date n time as a string
	public static String GetCurrentUTCdatetimeAsString()
	{
		final SimpleDateFormat sdf = new SimpleDateFormat(DATEFORMAT);
		sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
		final String utcTime = sdf.format(new Date());

		return utcTime;
	}

	//Parses a date/time in a String to date
	public static Date StringDateToDate(String StrDate)
	throws ParseException
	{
		Date dateToReturn = null;
		SimpleDateFormat dateFormat = new SimpleDateFormat(DATEFORMAT);

		dateToReturn = (Date)dateFormat.parse(StrDate);

		return dateToReturn;
	}
	
	//calculate Md5 hash of an input string...
	public static String CalculateMD5Hash(String md5) {
		try{
			MessageDigest m = MessageDigest.getInstance("MD5");
			m.reset();
			m.update(md5.getBytes());
			byte[] digest = m.digest();
			BigInteger bigInt = new BigInteger(1,digest);
			String hashtext = bigInt.toString(16);
		
			// Now we need to zero pad it if you actually want the full 32 chars.
			while(hashtext.length() < 32 ){
				hashtext = "0"+hashtext;
			}
		
			return hashtext;
		}
		catch (NoSuchAlgorithmException ex)
		{
			return null;
		}
	}
	
	//Gets a random long value
	public static Long GetRandomNumber()
	{
		Random rand = new Random();
		
		return rand.nextLong();
	}
	
	public static String Base64EncodeStr(String str)
	{
		if (ArgumentValidator.IsStringNullOrEmpty(str))
		{
			return null;
		}
		else
		{
			return(Base64.getEncoder().encodeToString(str.getBytes()));
		}
	}
	
	public static String DecodeBase64(String encodedStr)
	{
		if (ArgumentValidator.IsStringNullOrEmpty(encodedStr))
		{
			return null;
		}
		else
		{
			return new String(Base64.getDecoder().decode(encodedStr));
		}
	}
	
	//generates a password
	public static String GeneratePassword()
	{
		return RandomStringUtils.randomAlphanumeric(10);
	}
	
	//JVM property takes precedence over env var
	public static String GetEnvOrJVMProp(String propName)
	{
		String var = null;
		
		var = System.getProperty(propName);
		
		if (ArgumentValidator.IsStringNullOrEmpty(var))
		{
			var = System.getenv(propName);
		}
		
		return var;
	}
	
}
