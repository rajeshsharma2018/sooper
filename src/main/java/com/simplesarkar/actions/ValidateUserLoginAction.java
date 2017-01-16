package com.simplesarkar.actions;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.simplesarkar.common.ArgumentValidator;
import com.simplesarkar.common.SSConstants;
import com.simplesarkar.common.ValidationToken;

public class ValidateUserLoginAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6996000991323672988L;
	
	final static Logger log = Logger.getLogger(LogonAction.class);
	
	public String execute() throws Exception {
	
	log.info("Trying to validate the session");
	

	HttpServletRequest req = ServletActionContext.getRequest(); 
	HttpSession session = req.getSession();
	//We should be calling the REST API.. but since we are here.. we'll use the mechanisms to authenticate the user here
	
	String token = (String)session.getAttribute(SSConstants.AUTHCOOKIENAME);
	if (ArgumentValidator.IsStringNullOrEmpty(token))
	{
		return "failure";
	}
	
	ValidationToken vd = new ValidationToken();
	
	try {
		vd.Init(token);
		if (!vd.IsValid())
		{
			return "failure";
		}
	}
	catch (Exception ex)
	{
		log.warn("Got exception  when trying to validate sesison : " + ex.toString());
		return "failure";
	}
	
	return "success";
	}

}
