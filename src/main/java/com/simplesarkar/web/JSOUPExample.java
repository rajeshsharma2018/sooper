package com.simplesarkar.web;



import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;

import javax.imageio.ImageIO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


public class JSOUPExample {


	public static void main (String[] args){
		Document doc = null;



		String url = "https://resident.uidai.net.in/check-aadhaar-status";
		//String url ="http://static.travel.usnews.com/images/destinations/86/paris_edited_445x280.jpg";

		BufferedImage img = null;
		InputStream in = null;
		FileOutputStream out = null;
		try {

			try {
				URL url2 = new URL(url);

				URLConnection connection = url2.openConnection();
				connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36");
				connection.setRequestProperty("Referer", "https://resident.uidai.net.in/check-aadhaar-status");
				connection.setRequestProperty("Accept","image/webp,image/*,*/*;q=0.8");
		 
				connection.setRequestProperty("p_p_col_count", "1");connection.setRequestProperty("p_p_mode", "view");connection.setRequestProperty("p_p_lifecycle", "2");connection.setRequestProperty("p_p_id", "checkaadhaarstatus_WAR_rpcheckaadhaarstatusportlet");
				connection.setRequestProperty("p_p_col_id", "column-1");connection.setRequestProperty("p_p_cacheability", "cacheLevelPage"); connection.setRequestProperty("p_p_resource_id", "captchaImage");
				

				System.out.println("this is the URL TYPE "+connection.getContentType());
				in = connection.getInputStream();
				
				out = new FileOutputStream("RAJESH_IMAGE");

				int c;
				byte[] b = new byte[1024];
				while ((c = in.read(b)) != -1)
					out.write(b, 0, c);  

			} catch (IOException e) {
				e.printStackTrace();System.out.println("MESSAGE "+ e.getMessage());
			} finally {
				if (in != null)
					in.close();
				if (out != null)
					out.close();
			}
		
		}catch(Exception e){
			System.out.println("OUTSIDE SHIT");
			e.printStackTrace();
		}
			System.out.println("done" );

		
	}

}
