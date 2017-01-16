package com.simplesarkar.databaseutils;

import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.simplesarkar.configuration.ConfigurationStoreFactory;
import com.simplesarkar.common.IDataBaseConnector;
import com.simplesarkar.model.User;
import com.simplesarkar.utils.DataSource;

public class DataBaseConectorMySQL implements IDataBaseConnector{
	
	private static DataBaseConectorMySQL dbConnectorInstance;
	private static Object initLock = new Object();
	private DataSource dataSource;
	final static Logger log = Logger.getLogger(DataBaseConectorMySQL.class);
	
	private DataBaseConectorMySQL()
	{
		dbConnectorInstance = null;
		dataSource = null;
	}
	
	
	private void Init(String userName, String password, String dbUrl) throws IOException
	{
		//Implement Init...
		try{
		    dataSource = DataSource.getInstance(userName, password, dbUrl, DataSource.JDBC_DRIVER);
		}
		catch (SQLException sqEx)
		{
			IOException ex = new IOException(sqEx.getMessage() + " " 
		                         + sqEx.getSQLState() + " " + sqEx.getErrorCode());
			ex.setStackTrace(sqEx.getStackTrace());
			throw ex;
		}
		catch (PropertyVetoException prEx)
		{
			IOException ex = new IOException(prEx.getMessage());
			ex.setStackTrace(prEx.getStackTrace());
			throw ex;
		}
	}
	
	//Singleton...
	public static IDataBaseConnector getInstance(String userName, String password, String dbUrl) throws IOException
	{
		IDataBaseConnector connectorInst = null;
		synchronized(initLock){
			if (dbConnectorInstance == null)
			{
				dbConnectorInstance = new DataBaseConectorMySQL();
				dbConnectorInstance.Init(userName, password, dbUrl);
			}
			connectorInst = dbConnectorInstance;
		}
		
		return connectorInst;
	}
	
	//Get a connection to the database.
	//caller is responsible for closing the connection once we are done.
	public Connection GetConnection() {
		try
		{
		return dataSource.getConnection();
		}
		catch ( SQLException ex)
		{
			log.error("cautght an exception while returning a conenctin : " + ex.toString());
			return null;
		}
	}


}
