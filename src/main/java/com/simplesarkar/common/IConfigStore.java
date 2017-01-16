package com.simplesarkar.common;

import com.simplesarkar.databaseutils.DataBaseTypes;

public interface IConfigStore {
	DataBaseTypes GetDBType();
	String GetDBConnectionString();
	String GetDBUserName();
	String GetDBPasswd();
	String GetEmailUserName();
	String GetEmailPassword();
	String GetEmailHostName();
	String GetEmailHostPort();
}
