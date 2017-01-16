package com.simplesarkar.common;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;

public class HTMLMailSender {
	final static Logger log = Logger.getLogger(HTMLMailSender.class);

	/*
	
	
	 public static MimeMessage createEmail(String to, String from, String subject,
		      String bodyText) throws MessagingException {
		    Properties props = new Properties();
		    Session session = Session.getDefaultInstance(props, null);

		    MimeMessage email = new MimeMessage(session);
		    InternetAddress tAddress = new InternetAddress(to);
		    InternetAddress fAddress = new InternetAddress(from);

		    email.setFrom(new InternetAddress(from));
		    email.addRecipient(javax.mail.Message.RecipientType.TO,
		                       new InternetAddress(to));
		    email.setSubject(subject);
		    email.setText(bodyText);
		    return email;
		  }
	 
	 
	 
	  public static Message createMessageWithEmail(MimeMessage email)
		      throws MessagingException, IOException {
		    ByteArrayOutputStream bytes = new ByteArrayOutputStream();
		    email.writeTo(bytes);
		    String encodedEmail = Base64.encodeBase64URLSafeString(bytes.toByteArray());
		    Message message = new Message();
		    message.setRaw(encodedEmail);
		    return message;
		  }
	  
	  

	  public static MimeMessage createEmailWithAttachment(String to, String from, String subject,
	      String bodyText, String fileDir, String filename) throws MessagingException, IOException {
	    Properties props = new Properties();
	    Session session = Session.getDefaultInstance(props, null);

	    MimeMessage email = new MimeMessage(session);
	    InternetAddress tAddress = new InternetAddress(to);
	    InternetAddress fAddress = new InternetAddress(from);

	    email.setFrom(fAddress);
	    email.addRecipient(javax.mail.Message.RecipientType.TO, tAddress);
	    email.setSubject(subject);

	    MimeBodyPart mimeBodyPart = new MimeBodyPart();
	    mimeBodyPart.setContent(bodyText, "text/plain");
	    mimeBodyPart.setHeader("Content-Type", "text/plain; charset=\"UTF-8\"");

	    Multipart multipart = new MimeMultipart();
	    multipart.addBodyPart(mimeBodyPart);

	    mimeBodyPart = new MimeBodyPart();
	    DataSource source = new FileDataSource(fileDir + filename);

	    mimeBodyPart.setDataHandler(new DataHandler(source));
	    mimeBodyPart.setFileName(filename);
	    String contentType = Files.probeContentType(FileSystems.getDefault()
	        .getPath(fileDir, filename));
	    mimeBodyPart.setHeader("Content-Type", contentType + "; name=\"" + filename + "\"");
	    mimeBodyPart.setHeader("Content-Transfer-Encoding", "base64");

	    multipart.addBodyPart(mimeBodyPart);

	    email.setContent(multipart);

	    return email;
	  }
*/
	 
}
