package com.simplesarkar.configuration;

import java.util.Map;

import org.apache.log4j.Logger;

import com.simplesarkar.common.ArgumentValidator;
import com.simplesarkar.common.IConfigStore;
import com.simplesarkar.common.SimpleUtils;
import com.simplesarkar.databaseutils.DataBaseTypes;

public class StaticConfigurationStore implements IConfigStore{
		final static Logger log = Logger.getLogger(StaticConfigurationStore.class);

		private static StaticConfigurationStore configStoreInst;
		private static Object lockingObj = new Object();
		
		//PROD config values
		private static final String PRODDBConnStr = "jdbc:mysql://56ce782b89f5cf67ce000171-simplesarkar.rhcloud.com:62616/web";
		private static final String PRODDBUserName = "adminHUHrxU6";
		private static final String PRODDBUserPasswd = "BxGx9GzAJyCW";
		private static final String PRODEmailUserName = "simplesarkarcus@gmail.com";
		private static final String PRODEmailUserPAsswd = "mlrdloolzqmtcmod";
		private static final String PRODEmailHostName = "smtp.gmail.com";
		private static final String PRODEmailHostPort = "465";
		
		//DEV config values
		//To use these values, add this to a file called "setenv.sh" under  CATALINA_BASE/bin:
		//'export CATALINA_OPTS="-DSSDeploymentEnv=devenv"'
		//or run it before launching tomcat
		//an absence of the above will lead to using the prod values
		private static final String DEVDBConnStr = "jdbc:mysql://localhost:3306/nagrik";
		private static final String DEVDBUserName = "root";
		private static final String DEVDBUserPasswd = "rajesh";
		private static final String DEVEmailUserName = "simplesarkarcus@gmail.com";
		private static final String DEVEmailUserPAsswd = "mlrdloolzqmtcmod";
		private static final String DEVEmailHostName = "smtp.gmail.com";
		private static final String DEVEmailHostPort = "465";
		
		private String DBConnStr;
		private String DBUserName;
		private String DBUserPasswd;
		private String EmailUserName;
		private String EmailUserPAsswd;
		private String EmailHostName;
		private String EmailHostPort;
		
		public static StaticConfigurationStore GetInstance()
		{
			StaticConfigurationStore store = null;
			synchronized(lockingObj)
			{
				if (configStoreInst == null)
				{
					configStoreInst = new StaticConfigurationStore();
				}
				
				store = configStoreInst;
			}
			
			return store;
		}
		
		//singleton... 
		private StaticConfigurationStore() {
			String deployEnv = null;
			
			deployEnv = "devenv";
			
			log.info("deployEnv cariable : (" + deployEnv + ")");
			
			if (!(ArgumentValidator.IsStringNullOrEmpty(deployEnv)) && (deployEnv.equalsIgnoreCase("devenv")))
			{
				
				log.info("comes in dev"); 
				log.info("Running in dev env, Loading dev config values");
				DBConnStr = DEVDBConnStr;
				DBUserName = DEVDBUserName;
				DBUserPasswd = DEVDBUserPasswd;
				EmailHostName = DEVEmailHostName;
				EmailHostPort = DEVEmailHostPort;
				EmailUserName = DEVEmailUserName;
				EmailUserPAsswd = DEVEmailUserPAsswd;
			}
			else
			{
				log.info("comes in qa"); 
				log.info("Running in prod env, Loading prod config values");
				DBConnStr = PRODDBConnStr;
				DBUserName = PRODDBUserName;
				DBUserPasswd = PRODDBUserPasswd;
				EmailHostName = PRODEmailHostName;
				EmailHostPort = PRODEmailHostPort;
				EmailUserName = PRODEmailUserName;
				EmailUserPAsswd = PRODEmailUserPAsswd;
			}
		}	
		
		public String GetDBConnectionString() {
			return DBConnStr;
		}

		public String GetDBUserName() {
			return DBUserName;
		}

		public String GetDBPasswd() {
			return DBUserPasswd;
		}

		public String GetEmailUserName() {
			return EmailUserName;
		}

		public String GetEmailPassword() {
			return EmailUserPAsswd;
		}

		public String GetEmailHostName() {
			return EmailHostName;
		}

		public String GetEmailHostPort() {
			return EmailHostPort;
		}

		public DataBaseTypes GetDBType() {
			return DataBaseTypes.MYSQL;
		}

}
