package com.simplesarkar.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import com.simplesarkar.common.IDataBaseConnector;
import com.simplesarkar.databaseutils.DataBaseConnectorFactory;
import com.simplesarkar.databaseutils.DataBaseTypes;
import com.simplesarkar.model.Contact;
import com.simplesarkar.utils.DataSource;

public class ContactDAO {

	private IDataBaseConnector dbConnector;

	final static Logger log = Logger.getLogger(ContactDAO.class);
	
	public ContactDAO() {
		try
		{
		dbConnector = DataBaseConnectorFactory.GetDataBaseConnector();
		}
		catch (Exception ex)
		{
			dbConnector = null;
			System.out.println("DB conn is not initd : " + ex.getMessage());
		}
	}

	public void insertContactEntry(Contact c) throws SQLException {
 
		
		Connection connection = null;
		java.sql.PreparedStatement pstmt = null;
		long insertedKey = 0;
		String sql = "INSERT INTO contact"
				+ "(email, phone,message,name ) VALUES"
				+ "(?,?,?,?)";

		try {
			connection = dbConnector.GetConnection();
			pstmt = connection.prepareStatement(sql, pstmt.RETURN_GENERATED_KEYS);

			pstmt.setString(1, c.getEmail());
			pstmt.setString(2, c.getPhoneNumber()); 
			pstmt.setString(3,c.getMessage());
			pstmt.setString(4, c.getName());
		 
		 	
			pstmt.executeUpdate();


			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				insertedKey =  rs.getLong(1);
			}
			log.info("Record is inserted into Contact table! key="+insertedKey);

		} catch (Exception e ) {

		log.error(e.getMessage());

		} finally {

			if (pstmt != null) {
				pstmt.close();
			}

			if (connection != null) {
				connection.close();
			}

		}
}
}
