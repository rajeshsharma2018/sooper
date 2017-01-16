package com.simplesarkar.actions;



import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;
import com.simplesarkar.DAO.ContactDAO;
import com.simplesarkar.common.SimpleMailSender;
import com.simplesarkar.model.Contact;

public class ContactAction extends ActionSupport   {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5626093027266287718L;
	private String name;
	private String email;
	private String phone;
	private String message;

	final static Logger log = Logger.getLogger(ContactAction.class);

	public String execute() throws Exception {

		log.info("comes in ContactAction  "); 
		log.info("email="+email+ " phone="+phone+" message="+ message);
		 
		if (!SimpleMailSender.SendContactUsMail(email, message, name, phone))
		{
			return "failure";
		}
		
		//TODO : remove this once we verify that send mail is working
		Contact c = new Contact(); c.setEmail(email); c.setMessage(message); c.setPhoneNumber(phone);c.setName(name);

		ContactDAO ctDao = new ContactDAO();
		ctDao.insertContactEntry(c); 

		return "success";      
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public static Logger getLog() {
		return log;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}



}
