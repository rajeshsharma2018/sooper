package com.simplesarkar.actions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.simplesarkar.DAO.UserDAO;
import com.simplesarkar.common.SSConstants;

public class MyDocsAction extends ActionSupport   {


	final static Logger log = Logger.getLogger(MyDocsAction.class);

	 

	public String execute() throws Exception {

		log.info("comes in MyDocsAction  ");  

		Map session = ActionContext.getContext().getSession();
		HttpServletRequest req = ServletActionContext.getRequest();
		ServletContext context = ServletActionContext.getServletContext();
		log.info( "context path="+context.getContextPath());
		
		String token = (String)session.get(SSConstants.AUTHCOOKIENAME); 
		
		boolean isUserSignedIn = UserDAO.validateToken(token);
		
		if(!isUserSignedIn){
			return "failure";
		}
		
	 		 
		return "success";      
	}

  

}
