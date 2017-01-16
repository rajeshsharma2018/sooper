package com.simplesarkar.databaseutils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.simplesarkar.configuration.ConfigurationStoreFactory;
import com.simplesarkar.actions.SignupAction;
import com.simplesarkar.common.IConfigStore;
import com.simplesarkar.common.IDataBaseConnector;
import com.simplesarkar.model.User;
import com.simplesarkar.utils.DataSource;

public class EndUserDBHelper {
	private IDataBaseConnector dbConnector;
	private boolean isInitd;
	
	final static Logger log = Logger.getLogger(EndUserDBHelper.class);
	
	public void Init() throws Exception
	{
		IConfigStore configStore = ConfigurationStoreFactory.GetConfigStore();
		dbConnector = DataBaseConnectorFactory.GetDataBaseConnector();   
		isInitd = true;
	}
	
	
	public List<User> GetAllUsers() {
		if (!isInitd)
		{
			return null;
		}
		// TODO Auto-generated method stub
		List<User> listOfUSers = new ArrayList<User>();
		
		Connection connection = null;
		StringBuffer stb = new StringBuffer();
		stb.append("select * from user where is_blacklisted =0 ");

		java.sql.PreparedStatement pstmt = null;
		ResultSet resultSet = null;

		int count = 1;

		try {
			connection = dbConnector.GetConnection();
			pstmt = connection.prepareStatement(stb.toString());
			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
				User user = new User(resultSet);
				
				listOfUSers.add(user);
			}
		
	    } catch (Exception e) {
		    e.printStackTrace();
	    } finally {
		    if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {e.printStackTrace();}
		    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {e.printStackTrace();}
		    if (connection != null) try { connection.close(); } catch (SQLException e) {e.printStackTrace();}
	    }

		return listOfUSers;
	}

	//Get a user by ID
	public User GetUserById(long id) throws IllegalArgumentException {
		if (!isInitd)
		{
			return null;
		}
		if (id <= 0)
		{
			throw new IllegalArgumentException("id value <= 0");
		}
		
		User user = null;
		Connection connection = null;
		StringBuffer stb = new StringBuffer();
		stb.append("select * from user where is_blacklisted =0 ");
		stb.append(" and id=? ");

		java.sql.PreparedStatement pstmt = null;
		ResultSet resultSet = null;

		int count = 1;

		try {
			connection = dbConnector.GetConnection();
			pstmt = connection.prepareStatement(stb.toString());
			pstmt.setLong(count++, id);

			resultSet = pstmt.executeQuery();
			
			while (resultSet.next()) {

				user = new User(resultSet);
				break; //we only want one result
				       //there should be only one user

				//System.out.println("userId: " + resultSet.getString("id"));
				//System.out.println("firstname: " + resultSet.getString("first_name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {e.printStackTrace();}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {e.printStackTrace();}
			if (connection != null) try { connection.close(); } catch (SQLException e) {e.printStackTrace();}
		}

		return user;
	}

	//Get a user by emailId
	public User GetUserByEmailId(String emailId) throws IllegalArgumentException {
		log.info("inside getuser by emailId, isInitd="+isInitd);
		
		if (!isInitd)
		{
			return null;
		}
		if (emailId == null || emailId.isEmpty())
		{
			throw new IllegalArgumentException("emailId eiter null or empty");
		}
		
		User user = null;
		Connection connection = null;
		StringBuffer stb = new StringBuffer();
		stb.append("select * from user where is_blacklisted =0 ");
			stb.append(" and email=? ");

		java.sql.PreparedStatement pstmt = null;
		ResultSet resultSet = null;
log.info("sql for get user by email="+stb.toString());
		int count = 1;

		try {
			connection = dbConnector.GetConnection();
			pstmt = connection.prepareStatement(stb.toString());
		    pstmt.setString(count++, emailId);
			
			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

			user = new User(resultSet);
			break;//we only want the first result... t
			      //there should be only one user
			}
		} catch (SQLException e) {
			log.error("error getting user");
			log.error(e);
		} finally {
			if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {log.error(e.getMessage());}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {log.error(e.getMessage());}
			if (connection != null) try { connection.close(); } catch (SQLException e) {log.error(e.getMessage());}
		}

		log.info("is user null ? "+user == null);
		log.info("comeing out of get user by email id");
		return user;
	}

	public boolean AddUser(User userData) throws IllegalArgumentException {
		boolean success = false;
		java.sql.PreparedStatement pstmt = null;
		long insertedKey = 0;
		Connection connection = null;
		ResultSet rs = null;
		
		String sql = "INSERT INTO user"
				+ "(email,first_name, last_name,password,phone_num, is_blacklisted ) VALUES"
				+ "(?,?,?,?,?,?)";

		try {
			connection = dbConnector.GetConnection();
			pstmt = connection.prepareStatement(sql, pstmt.RETURN_GENERATED_KEYS);

			pstmt.setString(1, userData.getEmail());
			pstmt.setString(2, userData.getFirstName()); 
			pstmt.setString(3, userData.getLastName());
			pstmt.setString(4, userData.getPassword()); 
			pstmt.setString(5, userData.getPhoneNum()); 
			pstmt.setBoolean(6, userData.isBlacklisted()); 
		 
			pstmt.executeUpdate();


			rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				insertedKey =  rs.getLong(1);
			}
			success = true;
			log.info("User : " + userData.getEmail() + " is inserted into Contact table! key= " + insertedKey);

		} catch (Exception e ) {

		log.error(e.getMessage());

		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException e) {log.error(e.getMessage());}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {log.error(e.getMessage());}
			if (connection != null) try { connection.close(); } catch (SQLException e) {log.error(e.getMessage());}
		}
		return success;
	}

	public boolean RemoveUser(long id) throws IllegalArgumentException {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean UpdateUserRecord(long id, User userData) throws IllegalArgumentException {
		boolean success = false;
		
		if (id != userData.getId())
		{
			throw new IllegalArgumentException("user id in the record is not the same as the id sent");
		}
		
		java.sql.PreparedStatement pstmt = null;
		long insertedKey = 0;
		Connection connection = null;
		ResultSet rs = null;
		
		String sql = "UPDATE  user "
				+ "SET email=?,first_name=?,last_name=?,phone_num=?,is_blacklisted=? "
				+ " WHERE id=?";

		try {
			connection = dbConnector.GetConnection();
			pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, userData.getEmail());
			pstmt.setString(2, userData.getFirstName()); 
			pstmt.setString(3, userData.getLastName());
			pstmt.setString(4, userData.getPassword()); 
			pstmt.setBoolean(5, userData.isBlacklisted()); 
			pstmt.setString(5, userData.getPhoneNum());
			pstmt.setLong(6, id);

			pstmt.executeUpdate();
			success = true;
			log.info("User : " + userData.getEmail() + " is updated");

		} catch (Exception e ) {

		log.error(e.getMessage());

		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException e) {log.error(e.getMessage());}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {log.error(e.getMessage());}
			if (connection != null) try { connection.close(); } catch (SQLException e) {log.error(e.getMessage());}
		}
		
		return success;
	}
}
