package com.simplesarkar.mail;

import org.apache.log4j.Logger;

public class SendGridException extends Exception {
	
	final static Logger log = Logger.getLogger(SendGridException.class);

    public SendGridException(Exception e) {
        super(e);
    }
    


    public static void main(String args[]){
    	
    	log.info("comes in main of SendGrid");
    	
    }
}