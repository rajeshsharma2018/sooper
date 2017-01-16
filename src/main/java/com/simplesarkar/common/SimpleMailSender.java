package com.simplesarkar.common;

import java.security.Security;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;

import com.simplesarkar.configuration.ConfigurationStoreFactory;
import com.simplesarkar.actions.SignupAction;

//Class that does nothing but sends a message to a fixed account from a fixed account...
//an example use case is if some one wants to send a contact us email... we send from a fixed acocunt to a fixed account...
public final class SimpleMailSender {

	//These values are expected to remain fixed
	private static final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
	
	final static Logger log = Logger.getLogger(SimpleMailSender.class);
	
	//sends a mail when the contact us action happens
	public static boolean SendContactUsMail(String emailAddress, String message, String name, String phoneNumber)
	{
		IConfigStore configStore = ConfigurationStoreFactory.GetConfigStore();
		
		boolean succeeded = false;
		if (ArgumentValidator.IsStringNullOrEmpty(emailAddress) && (ArgumentValidator.IsStringNullOrEmpty(phoneNumber)))
		{
			log.warn("User email and phone number is empty. At least one is needed to be able to reach back... error!!!");;
			return succeeded;
		}
		
		String messageForEmail = "This is a contact us email. Kindly respond at the soonest. \n Message details :";
		String messageSubject = "ContactUs Email Action!!! ";
		
		messageSubject = messageSubject + " From : (" + emailAddress + "/" + phoneNumber + ")";
		messageForEmail = messageForEmail + " From : " + name + " (" + emailAddress + "/" + phoneNumber + ")\n";
		messageForEmail = messageForEmail + "Message : \n" + message;
		
		log.info("Sending contactUs message : \n" + messageSubject + "\n" + messageForEmail);
		try
		{
			SendMail(messageSubject, messageForEmail, configStore.GetEmailUserName());
			succeeded = true;
		}
		catch(MessagingException ex)
		{
			log.error("Caught exception in sending message <" + messageSubject + "> : " + ex.toString());
		}
		
		log.info("Message : <" + messageSubject + "> sent succesfully");
		succeeded = true;
		return succeeded;
	}
	
	public static boolean SendPasswordResetEmailConfirmation(String sendToAddress, String messageSubject, String messageBody)
	{
		boolean succeeded = false;
		
		if (ArgumentValidator.IsStringNullOrEmpty(sendToAddress))
		{
			log.error("invalid send to address");
			return succeeded;
		}
		
		if (ArgumentValidator.IsStringNullOrEmpty(messageSubject))
		{
			log.error("Empty message subject");
			return succeeded;
		}
		
		if (ArgumentValidator.IsStringNullOrEmpty(messageBody))
		{
			log.error("Empty message body");
			return succeeded;
		}
		
		try
		{
			SendMail(messageSubject, messageBody, sendToAddress);
		}
		catch (MessagingException ex)
		{
			log.error("Caught exception in sending password reset message to : " + sendToAddress 
					+ " : " + ex.toString());
		}
		
		log.info("Password reset message sent succesfully to " + sendToAddress);
		succeeded = true;
		return succeeded;
	}

	
	private static void SendMail(String subject, String message, String sendMailTo) throws MessagingException
	{
	
	    Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
	    final IConfigStore configStore = ConfigurationStoreFactory.GetConfigStore();
	    Properties props = new Properties();
	    props.put("mail.smtp.host", configStore.GetEmailHostName());
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.debug", "true");
	    props.put("mail.smtp.port", configStore.GetEmailHostPort());
	    props.put("mail.smtp.socketFactory.port", configStore.GetEmailHostPort());
	    props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
	    props.put("mail.smtp.socketFactory.fallback", "false");

	    Session session = Session.getDefaultInstance(props,
	            new javax.mail.Authenticator() 
	             {
	                 protected PasswordAuthentication                   

	              getPasswordAuthentication() {
	                    return new   
	                 PasswordAuthentication(configStore.GetEmailUserName(), configStore.GetEmailPassword());
	                }
	            });

	    Message msg = new MimeMessage(session);
	    InternetAddress addressFrom = new InternetAddress(configStore.GetEmailUserName());
	    msg.setFrom(addressFrom);

	    InternetAddress addressTo = new InternetAddress(sendMailTo);
	    
	    msg.setRecipient(Message.RecipientType.TO, addressTo);

	    // Setting the Subject and Content Type
	    msg.setSubject(subject);
	    msg.setContent(message, "text/plain");
	    Transport.send(msg);
	}
}
