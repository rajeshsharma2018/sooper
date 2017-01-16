package com.simplesarkar.utils;

public class LOCAL_DATASOURCE {
/*
  package com.simplesarkar.utils;
 

import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.log4j.Logger;

import com.simplesarkar.actions.ContactAction;

public class DataSource {


	final static Logger log = Logger.getLogger(DataSource.class);
	
    private static DataSource dataSource;
    private static Object lock = new Object();
    private BasicDataSource basicDS;
    
     

    public static String name = System.getenv("${OPENSHIFT_APP_NAME}");
    public static String host = System.getenv("${OPENSHIFT_MYSQL_DB_HOST}");
    public static String port = System.getenv("${OPENSHIFT_MYSQL_DB_PORT}"); 
	   
    public  static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
     

  	public  static final String DB_URL = "jdbc:mysql://localhost:3306/ss";

    //constructor
    private DataSource()
    {
    	basicDS = null;
    	dataSource = null;
    }
    
    //inits the object
    private void InitDS(String userName, String password, String dbUrl, String driverClassName) 
    		throws IOException, SQLException, PropertyVetoException {
        basicDS = new BasicDataSource();
        basicDS.setDriverClassName(driverClassName);
        basicDS.setUsername(userName);
        basicDS.setPassword(password);
        basicDS.setUrl(dbUrl);
       
     // the settings below are optional -- dbcp can work with defaults
        basicDS.setMinIdle(5);
        basicDS.setMaxIdle(20);
        basicDS.setMaxOpenPreparedStatements(180);
    	
    }
    
    //For the timebeing some entities expect to pass in no params...
    public static DataSource getInstance() throws IOException, SQLException, PropertyVetoException
    {
    	System.out.println("rajesh: this is DB_URL="+DB_URL);
    	log.info("rajesh: this is DB_URL="+DB_URL);
    	
    	return DataSource.getInstance("root", "rajesh",
    			"jdbc:mysql://localhost:3306/ss", "com.mysql.jdbc.Driver");

   // 	return DataSource.getInstance("adminHUHrxU6", "BxGx9GzAJyCW",
    //			DB_URL, "com.mysql.jdbc.Driver");
    }

    

	 
    //Get an instance of the DataSource... passed i params are used to init the data source
    public static DataSource getInstance(String userName, String password, String dbUrl, String driverClassName)
    		throws IOException, SQLException, PropertyVetoException {
    	DataSource dsInstance = null;
    	
    	//make sure only one instance is ever created... make it thread safe
    	synchronized(lock){
        if (dataSource == null) {
            dataSource = new DataSource();
            dataSource.InitDS(userName, password, dbUrl, driverClassName);
        }
        
        dsInstance =  dataSource;
    	}
    	
    	return dsInstance;
    }

    public Connection getConnection() throws SQLException {
        return this.basicDS.getConnection();
    }

}

 */
}
