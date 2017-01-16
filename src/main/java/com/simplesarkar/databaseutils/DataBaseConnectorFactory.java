package com.simplesarkar.databaseutils;

import org.apache.log4j.Logger;

import com.simplesarkar.configuration.ConfigurationStoreFactory;
import com.simplesarkar.common.IConfigStore;
import com.simplesarkar.common.IDataBaseConnector;

//Factory that returns the concrete implementation of the DataSource
public final class DataBaseConnectorFactory {
	final static Logger log = Logger.getLogger(DataBaseConnectorFactory.class);
	public static IDataBaseConnector GetDataBaseConnector()
	throws Exception
	{
		IConfigStore configStore = ConfigurationStoreFactory.GetConfigStore();
		IDataBaseConnector dataSource = null;
		
		switch (configStore.GetDBType()) {
		case MYSQL :
		{		
			log.info("config specified an SQL database.. loading it");
			dataSource = DataBaseConectorMySQL.getInstance(configStore.GetDBUserName(), configStore.GetDBPasswd(), configStore.GetDBConnectionString());
			 
			break;
		}
		
		default :
		{
			throw new Exception("Unrecgnised datasource specified");
		}
	}
		
		return dataSource;
	}
}
