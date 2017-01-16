package com.simplesarkar.actions;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.simplesarkar.DAO.UserDAO;
import com.simplesarkar.common.ArgumentValidator;
import com.simplesarkar.common.SimpleMailSender;
import com.simplesarkar.common.SimpleUtils;
import com.simplesarkar.databaseutils.EndUserDBHelper;
import com.simplesarkar.model.User;

public class ResetPasswordAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5076996352256291921L;
	final static Logger log = Logger.getLogger(ResetPasswordAction.class);
	
	private String email;
	private String securityQ;
	private String securityA;
	
	private String cmd;
	
	public String execute(){
		if(cmd != null && "securityQ".equalsIgnoreCase(cmd))
		{
			HttpServletRequest req = ServletActionContext.getRequest();
			if(req == null)
			{
				log.error("The request is null");
				return "security_question";
			}

			EndUserDBHelper dbHelper = new EndUserDBHelper();
			try
			{
				dbHelper.Init();
			}
			catch (Exception ex)
			{
				log.error("Caught exception in db init : " + ex.toString());
				return "security_question";
			}
			
			User user = dbHelper.GetUserByEmailId(email);
			
			if(user == null)
			{
				log.warn("No user found with email : " + email);
				return "security_question";
			}
			
		//	securityQ = user.getSecurityQ();
		 	
			 
			 
		}
		
		return "security_question";
	}

	/**
	 * @return the Email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param userEmailAddress the Email to set
	 */
	public void setEmail(String userEmailAddress) {
		this.email = userEmailAddress;
	}

	/**
	 * @return the securityQ
	 */
	public String getSecurityQ() {
		return securityQ;
	}

	/**
	 * @param userSecQ the securityQ to set
	 */
	public void setSecurityQ(String userSecQ) {
		this.securityQ = userSecQ;
	}
	
	/**
	 * @return the securityA
	 */
	public String getSecurityA() {
		return securityA;
	}

	/**
	 * @param userSecAns the securityA to set
	 */
	public void setSecurityA(String userSecAns) {
		this.securityA = userSecAns;
	}

	/**
	 * @return the cmd
	 */
	public String getCmd() {
		return cmd;
	}

	/**
	 * @param set the cmd to stage
	 */
	public void setCmd(String stage) {
		this.cmd = stage;
	}
	
	private boolean GeneratePasswordAndSendNotification(User user)
	{
		boolean status = false;
		
		String newPass = SimpleUtils.GeneratePassword();
		
		String oldPasswd = user.getPassword();
		user.setPassword(newPass);
		 
		try
		{
			EndUserDBHelper dbHelper = new EndUserDBHelper();
			dbHelper.Init();
			if (!dbHelper.UpdateUserRecord(user.getId(), user))
			{
				log.error("Failed to update the users (" + user.getEmail() + ")info in the DB");
				return status;
			}
			
			//Send am email now...
			String msgTitle = "Password Reset completed for SimpleSarkar.com User : " + user.getEmail();
			String msgBody = "Hi " + user.getFirstName() + ",\n";
			msgBody += "We are glad to inform you that your password was succesfully reset.\n" +
			 "You can go to www.simplesarker.com/passwordRecovery.jsp to create a new password.\n" +
			 "Your temporary one time use password is : " + newPass + "\n Thanks,\nSimple Sarkar Customer Care Team\n\n";
			//TODO : Once the password reset option is enabled... Add the following text to the email message
			/*
			 "PS : This one time password can not be used for any other purpose, you will have to create  a\n" +
			 "new password in order to use the various services on the site.";
			 */
			
			if (!SimpleMailSender.SendPasswordResetEmailConfirmation(user.getEmail(), msgTitle, msgBody))
			{
				log.error("could not send an email to the user " + user.getEmail() + " to notify of a password reset... roll back to the old password now");
				user.setPassword(oldPasswd);
				 
				if (!dbHelper.UpdateUserRecord(user.getId(), user))
				{
					log.error("Failed to revert the users (" + user.getEmail() + ")info in the DB, we have an issue." + 
				    " Users password is a tempo password and they dont know what it it, a new reset request will need to be raised");
					return status;
				}
			}
			else
			{
				log.info("sent notificagtion to the user " + user.getEmail() + " to notify of a password reset");
				status = true;
			}
			
		}
		catch (Exception e) {
			log.error("caught exception while updating users (" + user.getEmail() + ") info : " + e.toString());
		}
		
		return status;
	}
}
