package com.simplesarkar.actions;

import java.io.FileNotFoundException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.simplesarkar.common.ArgumentValidator;
import com.simplesarkar.common.SSConstants;
import com.simplesarkar.common.ValidationToken;
import com.simplesarkar.security.AuthN;

public class LogonAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8515723004466020979L;
	private String email;
	private String pwd;
	private String cmd;
		
	final static Logger log = Logger.getLogger(LogonAction.class);
	
	public String execute() throws Exception {
		String token = "";
		
		HttpServletRequest req = ServletActionContext.getRequest(); 
		HttpSession session = req.getSession();
		
		
		log.info("Came in with cmd : " + cmd);
		log.info("email"+email);
		log.info("pwd"+pwd);
		
		if ((!ArgumentValidator.IsStringNullOrEmpty(cmd)) && (cmd.equalsIgnoreCase("logout"))) {
			session.setAttribute(SSConstants.AUTHCOOKIENAME, "");
			session.removeAttribute(SSConstants.AUTHCOOKIENAME);
			req.getSession().invalidate();
			
			return "loggedout";
		}
			
		log.info("Trying to login user : " + email);

		//We should be calling the REST API.. but since we are here.. we'll use the mechanisms to authenticate the user here
		
		token = (String)session.getAttribute(SSConstants.AUTHCOOKIENAME);
		if (ArgumentValidator.IsStringNullOrEmpty(token))
		{
			//only validate if the token is not null
			AuthN aN = new AuthN();
			try
			{
	    	aN.Init();
	    	
	    	token = aN.ValidateCleartextCredentialsAndGetToken(email, pwd);
			}
			catch (IllegalArgumentException ex)
			{
				log.error("USer : " + email + " could not be logged in due to exception : " + ex.toString());
				log.error(ex);
				req.setAttribute("response","failure");
				token = "";
				return "success";
			}catch( FileNotFoundException e){
				log.error("USer : " + email + " could not be logged in due to exception : " + e.toString());
				log.error(e);
				req.setAttribute("response","failure");
				token = "";
				return "success"; 
			}
			
			session.setAttribute(SSConstants.AUTHCOOKIENAME, token);
		}
		else
		{
			ValidationToken vD = new ValidationToken();
			vD.Init(token);
			if (!vD.IsValid())
			{
				log.info("USer had an invalid token in the sesison..., deleting it");
				session.setAttribute(SSConstants.AUTHCOOKIENAME, "");
				session.removeAttribute(SSConstants.AUTHCOOKIENAME);
				
				//only validate if the token is not null
				AuthN aN = new AuthN();
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
			}
		}
		
		log.info("succesfull login for user : " + email + " token : " + token);
		
		req.setAttribute("response","success");
		
		Object obj = session.getAttribute("aadhar_app");
		
	 
		return "success";
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public static Logger getLog() {
		return log;
	}

	/**
	 * @return the cmd
	 */
	public String getCmd() {
		return cmd;
	}

	/**
	 * @param cmd the cmd to set
	 */
	public void setCmd(String cmd) {
		this.cmd = cmd;
	}
}
