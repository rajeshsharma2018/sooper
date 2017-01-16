package com.simplesarkar.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map.Entry;

import org.apache.log4j.Logger;

public class IndiaVisa {


	final static Logger log = Logger.getLogger(IndiaVisa.class);

	 static String url = "https://indianvisaonline.gov.in/visa/info1.jsp?ser_req=1";
	//static String url = "https://indianvisaonline.gov.in/visa/tvoa.html";
	
	static	String charset = "UTF-8";  // Or in Java 7 and later, use the constant: java.nio.charset.StandardCharsets.UTF_8.name()
	static String param1 = "value1";
	static String param2 = "value2";
	
//	curl -H "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36" 
	//--data "ser_req=1" -H  "Content-Type: application/x-www-form-urlencoded" -H "Cache-Control:max-age=0" 
	//-H "Connection: keep-alive" -H "Cookie:JSESSIONID=00275C52954B5D40FF6A93A6EC028A57.ndc2-2" 
	//-H "Referer: https://indianvisaonline.gov.in/visa/index.html" -H "Accept-Encoding:gzip,dflate,br" 
	//-H "Accept-Language:en-US,en;q=0.5" -H "Accept:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" 
	//-H "Host: indianvisaonline.gov.in"  https://indianvisaonline.gov.in/visa/info1.jsp


	public static void doCall(){


		try {


			URLConnection connection = new URL(url).openConnection();
			//connection.setDoOutput(true); // Triggers POST.
		 	connection.setRequestProperty("Accept-Charset", charset);
			 
		 	connection.setRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36"); 
	  	connection.setRequestProperty("Host", "indianvisaonline.gov.in" );
		 	connection.setRequestProperty("Accept","text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
		 //	connection.setRequestProperty("Accept","application/font-woff2;q=1.0,application/font-woff;q=0.9,*/*;q=0.8");
			
		 	connection.setRequestProperty("Accept-Language","en-US,en;q=0.5");
			 connection.setRequestProperty("Accept-Encoding","gzip,dflate,br");
		//	 connection.setRequestProperty("Cookie","JSESSIONID=00275C52954B5D40FF6A93A6EC028A57.ndc2-2");
		 	connection.setRequestProperty("Connection","keep-alive");
			 connection.setRequestProperty("Cache-Control","max-age=0"); 
			 connection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
		//	connection.setRequestProperty("Content-Type","text/html");
		//	connection.setRequestProperty("Accept-Ranges","bytes");
		  	connection.setRequestProperty("Referer","https://indianvisaonline.gov.in/visa/index.html");
		 //	connection.setRequestProperty("Accept-Encoding","identity");
			
			InputStream response = connection.getInputStream();
			HttpURLConnection httpConnection = (HttpURLConnection) connection;
			 
			int status = httpConnection.getResponseCode();
			log.info("status="+status); 

			for (Entry<String, List<String>> header : connection.getHeaderFields().entrySet()) {
				log.info(header.getKey() + "=" + header.getValue());
			}

			


			String contentType = connection.getHeaderField("Content-Type");
			String charset = null;

			for (String param : contentType.replace(" ", "").split(";")) {
				if (param.startsWith("charset=")) {
					charset = param.split("=", 2)[1];
					break;
				}
			}

			if (charset != null) {
				try (BufferedReader reader = new BufferedReader(new InputStreamReader(response, charset))) {
					for (String line; (line = reader.readLine()) != null;) {
						log.info(line);;
					}
				}
			}
			
			 log.info("response="+getStringFromInputStream(response));


		}catch(Exception e){
			log.error("error");
			log.error(e);
			e.printStackTrace();
		}


		log.info("done");
	}
	public static void main (String args[]){

		doCall();
	}

	
	private static String getStringFromInputStream(InputStream is) {

		BufferedReader br = null;
		StringBuilder sb = new StringBuilder();

		String line;
		try {

			br = new BufferedReader(new InputStreamReader(is));
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return sb.toString();

	}
}
