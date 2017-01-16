package com.simplesarkar.web;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map.Entry;

import javax.imageio.ImageIO;

import org.apache.log4j.Logger;

public class AadharCardStatusCall {
 
	final static Logger log = Logger.getLogger(AadharCardStatusCall.class); 

	public static void getCaptcha(){
		String charset = null;	
		try {
			String path = "captcha_image.jpeg";
			URL url = new URL("https://indianvisaonline.gov.in/visa/Rimage.jsp");
			BufferedImage image = ImageIO.read(url);
			ImageIO.write(image, "jpeg", new File(path));
			URLConnection connection = url.openConnection();

			connection.setRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36"); 
			connection.setRequestProperty("Host", "indianvisaonline.gov.in" );
			connection.setRequestProperty("Accept","text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
			connection.setRequestProperty("Accept-Language","en-US,en;q=0.5");
			connection.setRequestProperty("Accept-Encoding","gzip,dflate,br");
			connection.setRequestProperty("Connection","Keep-Alive");
			connection.setRequestProperty("Cache-Control","max-age=0"); 

			InputStream response = connection.getInputStream();
			HttpURLConnection httpConnection = (HttpURLConnection) connection;

			int status = httpConnection.getResponseCode();
			log.info("status="+status); 

			for (Entry<String, List<String>> header : connection.getHeaderFields().entrySet()) {
				log.info(header.getKey() + "=" + header.getValue());
			} 

			String contentType = connection.getHeaderField("Content-Type");
 
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
		}
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


	public static void main(String [] args){

		getCaptcha();

		log.info("done");

	}
}
