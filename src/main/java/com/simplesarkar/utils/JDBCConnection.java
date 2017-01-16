package com.simplesarkar.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCConnection {

	
     public static String name = System.getenv("${OPENSHIFT_APP_NAME}");
     public static String host = System.getenv("${OPENSHIFT_MYSQL_DB_HOST}");
     public static String port = System.getenv("${OPENSHIFT_MYSQL_DB_PORT}");
	   
     public  static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
     
  //   public static final String DB_URL= "jdbc:mysql://"+host+":"+port+"/"+name;
     
 	//public  static final String DB_URL = "jdbc:mysql://56ce782b89f5cf67ce000171-simplesarkar.rhcloud.com:62616/web";
     public  static final String DB_URL =  "mysql://adminHUHrxU6:BxGx9GzAJyCW@56ce782b89f5cf67ce000171-simplesarkar.rhcloud.com:62616/web";
     
     
	public   static final String USER = "adminHUHrxU6";
	public  static final String PASS = "BxGx9GzAJyCW";
	       
	    
	   
}
