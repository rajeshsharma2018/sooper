package com.simplesarkar.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport; 
import com.simplesarkar.DAO.UserDAO;
import com.simplesarkar.common.ArgumentValidator;
import com.simplesarkar.common.SSConstants;
import com.simplesarkar.databaseutils.EndUserDBHelper; 
import com.simplesarkar.model.User;
import com.simplesarkar.security.AuthN;

public class SignupAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -982253810542768141L;
	private String fName;
	private String lName;
	private String email;
	private String pwd;
	private String phoneNum; 
	private String isTechnician;
	
	final static Logger log = Logger.getLogger(SignupAction.class);
	
	public String execute() throws Exception {
		HttpServletRequest req = ServletActionContext.getRequest();

		HttpSession session = req.getSession();
		
		log.info("fName="+fName+"lName= "+lName+" email="+email+" pwd="+pwd );
		
		
		if(ArgumentValidator.IsStringNullOrEmpty(fName))
		{
			log.warn("User First name is empty... error!!!");
			req.setAttribute("response","failure");
			return "success";
		}
		
		if(ArgumentValidator.IsStringNullOrEmpty(lName))
		{
			log.warn("User Last name is empty... error!!!");
			req.setAttribute("response","failure");
			return "success";
		}
		
		if(ArgumentValidator.IsStringNullOrEmpty(email))
		{
			log.warn("User email id is empty... error!!!");
			req.setAttribute("response","failure");
			return "success";
		}
		
		if(ArgumentValidator.IsStringNullOrEmpty(pwd))
		{
			log.warn("User pwd is empty... error!!!");
			req.setAttribute("response","failure");
			return "success";
		}
		
		 
		
		log.info("trying to add user with email" + email);
		
		EndUserDBHelper dbConnector = new EndUserDBHelper();
		dbConnector.Init();
		
		User user = dbConnector.GetUserByEmailId(email);
		
		if (user != null)
		{
			log.warn("USer with email : " + email + " already exists in the system!!!");
			req.setAttribute("response","existing");
			return "success";
		}
		
		user = new User();
		user.setEmail(email);
		user.setFirstName(fName);
		user.setLastName(lName);
		user.setPassword(pwd);
 		user.setBlacklisted(false);
 		user.setPhoneNum(phoneNum);
 	
		if (!dbConnector.AddUser(user))
		{
			log.error("unable to add user : " + email);
			req.setAttribute("response","existing");
			return "success";
		}
		
		log.info("add user : " + email + " to database");
		
		log.info("creating users token now that the signup happened succesfully... we'll add the token to thr sesison as well");
		//only validate if the token is not null
		AuthN aN = new AuthN();
		String token = null;
		try
		{
			aN.Init();
    	
			token = aN.ValidateCleartextCredentialsAndGetToken(email, pwd);
		}
		catch (Exception ex)
		{
			log.error("USer : " + email + " could not be logged in due to exception : " + ex.toString());
			token = "";
			req.setAttribute("response","failure");
			return "success";
		}
		 
		session.setAttribute(SSConstants.AUTHCOOKIENAME, token);
		
		Object obj = session.getAttribute("aadhar_app");
		
		 
				
		
		req.setAttribute("response","success");
		return "success";
	}
	
	public String getFName()
	{
		return this.fName;
	}
	public void setFName(String value)
	{
		this.fName = value;
	}
	
	public String getLName()
	{
		return this.lName;
	}
	public void setLName(String value)
	{
		this.lName = value;
	}
	
	public String getEmail()
	{
		return this.email;
	}
	public void setEmail(String value)
	{
		this.email = value;
	}
	
	public String getPwd()
	{
		return this.pwd;
	}
	public void setPwd(String value)
	{
		this.pwd = value;
	}
	
	public String getPhoneNum()
	{
		return this.phoneNum;
	}
	public void setPhoneNum(String phoneNum)
	{
		this.phoneNum = phoneNum;
	}
	
	public String getIsTechnician()
	{
		return this.isTechnician;
	}
	public void setIsTechnician(String isTechnician)
	{
		this.isTechnician = isTechnician;
	}
}
