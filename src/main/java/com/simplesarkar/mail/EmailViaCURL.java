package com.simplesarkar.mail;

import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.apache.log4j.Logger;


public class EmailViaCURL {


	final static Logger log = Logger.getLogger(EmailViaCURL.class);

	public final static  String SEND_GRID_URL = "https://sendgrid.com/api/mail.send.json?"
			+"api_user=ss123&api_key=rajesh123&from=support@simplesarkar.com"
			+"&subject=Import+done&text=Done&to=rajeshsharmaa@gmail.com";
	String charset = "UTF-8";

	public void setup(String to){

		String paramTo = "&to=rajeshsharmaa@gmail.com";

		try {
			URLConnection connection = new URL(SEND_GRID_URL).openConnection();
			connection.setDoOutput(true); // Triggers POST.
			connection.setRequestProperty("Accept-Charset", charset);
			connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=" + charset);

			String query = String.format("paramTo=%s", URLEncoder.encode(paramTo, charset));
 
			OutputStream output = connection.getOutputStream();
			output.write(query.getBytes(charset));			

			java.io.InputStream response = connection.getInputStream();
			log.info("Response of curl = "+response);
		}catch( Exception e){
			log.error(e);
		}finally{

		}

	}

	public static void main(String args []){
		log.info("running curl");

		EmailViaCURL e = new EmailViaCURL();
		e.setup("rajeshsharmaa@gmail.com");
	}

}
