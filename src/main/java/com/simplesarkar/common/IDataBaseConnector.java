package com.simplesarkar.common;

import java.util.List;
import java.sql.Connection;

import com.simplesarkar.model.*;

//Interface that defines the things we expect out of the data source.

public interface IDataBaseConnector {
	
	//Caller is supposed to release the connection
	Connection GetConnection();
}
