package com.simplesarkar.DAO;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.simplesarkar.databaseutils.DataBaseConnectorFactory;
import com.simplesarkar.databaseutils.EndUserDBHelper;
import com.simplesarkar.model.Technician;
import com.simplesarkar.security.AuthN;
import com.simplesarkar.utils.DataSource;


public class TechnicianDAO {

	private EndUserDBHelper dbConnector;
	private AuthN authN;
	final static Logger log = Logger.getLogger(UserDAO.class);


	public TechnicianDAO()
	{
		try
		{
			dbConnector = new EndUserDBHelper();
			dbConnector.Init();
		}
		catch (Exception ex)
		{
			dbConnector = null;
			System.out.println("DB conn is not initd : " + ex.getMessage());
		}

		try
		{
			authN = new AuthN();

			authN.Init();
		}
		catch(Exception ex)
		{
			authN = null;
			System.out.println("AuthN is not initd : " + ex.getMessage());
		}

	}

	public  Technician getTechnician(long id, String email){
		log.info("comes in get technician");
		Technician technician = null;
		StringBuffer stb = new StringBuffer();
		stb.append("select * from technician where is_blacklisted =0 ");
		if(  id  > 0)
			stb.append(" and id=? ");
		if( StringUtils.isNotBlank(email))
			stb.append(" and email=? ");

		int count = 1;
		Connection connection = null;
		java.sql.PreparedStatement pstmt = null;
		ResultSet resultSet = null;

		try {
			connection = DataSource.getInstance().getConnection();
			pstmt = connection.prepareStatement(stb.toString());

			if(id > 0)
				pstmt.setLong(count++, id);
			if(!StringUtils.isNotBlank(email))
				pstmt.setString(count++, email);
			
			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
 
				technician = new Technician(resultSet);

				 
			}

		} catch (Exception e) {
			log.error("error getting technician"); 
			log.error(e);
		}

		return technician;

	}

	public List<Technician> getAllTechnicians(int skill)
	{
		List<Technician> listOfTechnicians = null;

		if (dbConnector == null)
		{
			System.out.println("DBConn is not initd...");
			return null;
		}

	 
			 
			StringBuffer stb = new StringBuffer();
			
			if(skill > 0)
				stb.append("select * from technician t,skills s where t.is_blacklisted = 0 and s.skill = ? and s.technicial_id = t.technician_id");
			else
				stb.append("select * from technician");
				
			
				
			Connection connection = null;
			java.sql.PreparedStatement pstmt = null;
			ResultSet resultSet = null;

			try {
				connection = DataSource.getInstance().getConnection();
				pstmt = connection.prepareStatement(stb.toString());

				if(skill > 0)
				pstmt.setInt(1, skill);
				 
				resultSet = pstmt.executeQuery();
				while (resultSet.next()) { 
					listOfTechnicians.add( new Technician(resultSet));  
				}

			} catch (Exception e) {
				log.error("error getting technician"); 
				log.error(e);
			}

			return listOfTechnicians;

		}
 
 



	public   void insertTechnician( Technician tech) throws SQLException {
		 


		Connection connection = null;
		java.sql.PreparedStatement pstmt = null; 
		String sql = "INSERT INTO technician"
				+ "(first_name,last_name,country,state,city,email,password,about_me,rate,pic_url,last_updated,is_blacklisted,is_enabled,created_at) "
				+ "VALUES  (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			connection = DataSource.getInstance().getConnection();
			pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, tech.getFirstName());
			pstmt.setString(2, tech.getLastName()); 
			pstmt.setString(3, tech.getCountry());
			pstmt.setString(4, tech.getState());
			pstmt.setString(5, tech.getCity());
			pstmt.setString(6, tech.getEmail()); 
			pstmt.setString(7, tech.getPassword());
			pstmt.setString(8, tech.getAboutMe());
			pstmt.setDouble(9, tech.getRate());
			pstmt.setString(10, tech.getPicUrl()); 
			pstmt.setTimestamp(11, tech.getUpdatedAt());
			pstmt.setBoolean(12, tech.isBlackListed()  );
			pstmt.setBoolean(13, tech.isEnabled());
			pstmt.setTimestamp(14, tech.getCreatedAt());   
			
			pstmt.executeUpdate(); 
			
			System.out.println("Record is inserted into Technician table");

		} catch (Exception e ) {

			System.out.println("error inserting Technician info#####");
			e.printStackTrace();
			System.out.println(e.getMessage()+e.getCause());

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
