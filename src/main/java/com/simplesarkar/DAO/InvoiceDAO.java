package com.simplesarkar.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.simplesarkar.databaseutils.EndUserDBHelper;
import com.simplesarkar.model.Invoice;
import com.simplesarkar.model.Technician;
import com.simplesarkar.security.AuthN;
import com.simplesarkar.utils.DataSource;

public class InvoiceDAO {

	private EndUserDBHelper dbConnector;
	private AuthN authN;
	final static Logger log = Logger.getLogger(UserDAO.class);


	public InvoiceDAO()
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

	public List<Invoice> getInvoices(long technicianId, long userId, String status){
		
		log.info("comes in get Invoices");
		 
		StringBuffer stb = new StringBuffer();
		stb.append("select * from invoice where ");
		
		if(technicianId  > 0)
			stb.append(" and technician_id=? ");
		if(userId  > 0)
			stb.append(" and user_id=? ");
		if(status != null)
			stb.append(" and status=? ");
		
		
		
		int count = 1;
		Connection connection = null;
		java.sql.PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		List<Invoice> invList = new ArrayList<Invoice>();

		try {
			connection = DataSource.getInstance().getConnection();
			pstmt = connection.prepareStatement(stb.toString());

			if(technicianId > 0)
				pstmt.setLong(count++, technicianId);
			if(userId > 0)
				pstmt.setLong(count++, userId);
			 if(StringUtils.isNotBlank(status))
				pstmt.setString(count++, status);
			
			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
 
				Invoice inv = new Invoice(resultSet);
				invList.add(inv); 
			}

		} catch (Exception e) {
			log.error("error getting Invoice"); 
			log.error(e);
		}

		return invList;

	}
 



	public   void insertInvoice( Invoice inv) throws SQLException {
		 


		Connection connection = null;
		java.sql.PreparedStatement pstmt = null; 
		String sql = "INSERT INTO invoice"
				+ "(technician_id,user_id,status) "
				+ "VALUES  (?,?,?)";

		try {
			connection = DataSource.getInstance().getConnection();
			pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, inv.getTechnicianId());
			pstmt.setInt(2, inv.getUserId()); 
			pstmt.setInt(3, inv.getStatus());
			 
			pstmt.executeUpdate(); 
			
			System.out.println("Record is inserted into Invoice table");

		} catch (Exception e ) {

			System.out.println("error inserting Invoice info#####");
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

