package com.simplesarkar.web;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Properties;

public class Testing {
    public static void main(String[] args) {
    	
    	 
        
        
         URL url = null;
        try {
            url = new URL("https://resident.uidai.net.in/check-aadhaar-status?p_p_id=checkaadhaarstatus_WAR_rpcheckaadhaarstatusportlet&p_p_lifecycle=2&p_p_state=normal&p_p_mode=view&p_p_resource_id=captchaImage&p_p_cacheability=cacheLevelPage&p_p_col_id=column-1&p_p_col_count=1");
          InputStream in = new BufferedInputStream(url.openStream());
          ByteArrayOutputStream out = new ByteArrayOutputStream();
          byte[] buf = new byte[1024];
          int n = 0;
          while (-1!=(n=in.read(buf)))
          {
            out.write(buf, 0, n);
          }
          out.close();
          in.close();
          byte[] response = out.toByteArray();
          FileOutputStream fos = new FileOutputStream(""
          		+ "lol-captcha.jpg");
          fos.write(response);
          fos.close();
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
    }
}
