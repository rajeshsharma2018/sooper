package com.simplesarkar.DAO;
 

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.mysql.jdbc.Statement;
import com.simplesarkar.databaseutils.EndUserDBHelper;
import com.simplesarkar.model.Task;
import com.simplesarkar.model.TaskSummary;
import com.simplesarkar.security.AuthN;
import com.simplesarkar.utils.DataSource;
 

public class TaskDAO {

	private EndUserDBHelper dbConnector;
	private AuthN authN;
	final static Logger log = Logger.getLogger(TaskDAO.class);


	public TaskDAO()
	{
		try
		{
			dbConnector = new EndUserDBHelper();
			dbConnector.Init();
		}
		catch (Exception ex)
		{
			dbConnector = null;
			log.info("DB conn is not initd : " + ex.getMessage());
		}

		try
		{
			authN = new AuthN();

			authN.Init();
		}
		catch(Exception ex)
		{
			authN = null;
			log.info("AuthN is not initd : " + ex.getMessage());
		}

	}

	public  Task getTechnician(long id){
		log.info("comes in get technician");
		Task task = null;
		StringBuffer stb = new StringBuffer();
		stb.append("select * from task where id = ? ");


		Connection connection = null;
		java.sql.PreparedStatement pstmt = null;
		ResultSet resultSet = null;

		try {
			connection = DataSource.getInstance().getConnection();
			pstmt = connection.prepareStatement(stb.toString());

			pstmt.setLong(0, id);

			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

				task = new Task(resultSet);


			}

		} catch (Exception e) {
			log.error("error getting technician"); 
			log.error(e);
		}

		return task;

	}

	public List<Task> getAllTasks(Long id)
	{
		List<Task> listOfTask = new ArrayList<Task>();

		if (dbConnector == null)
		{
			log.info("DBConn is not initd...");
			return null;
		} 			 
		StringBuffer stb = new StringBuffer();
		stb.append("select * from task");
		
		if(id !=null){
			stb.append(" where id = ?");
		}

		Connection connection = null;
		java.sql.PreparedStatement pstmt = null;
		ResultSet resultSet = null;

		try {
			connection = DataSource.getInstance().getConnection();
			pstmt = connection.prepareStatement(stb.toString());
			if(id !=null){
				pstmt.setLong(1, id);
			}


			resultSet = pstmt.executeQuery();
			while (resultSet.next()) { 
				listOfTask.add( new Task(resultSet));  
			}

		} catch (Exception e) {
			log.error("error getting technician"); 
			log.error(e);
		}

		return listOfTask;

	}



	public List<TaskSummary> getAllTasksSummary( ) throws SQLException
	{
		List<TaskSummary> listOfTask = new ArrayList<TaskSummary>();

		if (dbConnector == null)
		{
			log.info("DBConn is not initd...");
			return null;
		} 			 
		StringBuffer stb = new StringBuffer();
		stb.append("select id,small_desc,full_desc,create_dt,last_updated,video_url,photo_url,city,pin,num_users,"
				+ " approx_man_hrs,credits,status,trending_lvl from task");

		Connection connection = null;
		java.sql.PreparedStatement pstmt = null;
		ResultSet resultSet = null;

		try {
			connection = DataSource.getInstance().getConnection();
			pstmt = connection.prepareStatement(stb.toString());

			resultSet = pstmt.executeQuery();
			while (resultSet.next()) { 
				listOfTask.add( new TaskSummary(resultSet));  
			}

		} catch (Exception e) {
			log.error("error getting technician"); 
			log.error(e);
		} finally {

			if (pstmt != null) {
				pstmt.close();
			}

			if (connection != null) {
				connection.close();
			}

		}

		System.out.println("number of Tasks="+listOfTask.size());
		
		return listOfTask;

	}


	public long insertTask( Task task) throws SQLException {

		long id = 0L;


		Connection connection = null;
		java.sql.PreparedStatement pstmt = null; 
		String sql = "INSERT INTO task"
				+ "(small_desc,full_desc,create_dt,last_updated,parent_id,photo_url,video_url,city,pin,location_description,active,num_users,approx_man_hrs,credits) "
				+ "VALUES  (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			connection = DataSource.getInstance().getConnection();
			pstmt = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);

			pstmt.setString(1, task.getSmallDesc() );
			pstmt.setString(2, task.getFullDesc()); 
			pstmt.setDate(3, task.getCreatedAt());
			pstmt.setDate(4, task.getLastUpdated());
			pstmt.setLong(5, task.getParentId());
			pstmt.setString(6, task.getPhotoUrl()); 
			pstmt.setString(7, task.getVideoUrl());
			pstmt.setString(8, task.getCity());
			pstmt.setString(9, task.getPincode());
			pstmt.setString(10, task.getLocationDescription()); 
			pstmt.setInt(11, task.getActive());
			pstmt.setInt(12, task.getNumOfVolunteers()  );
			pstmt.setInt(13, task.getManHrs());
			pstmt.setInt(14, task.getCredits());   

			id = pstmt.executeUpdate(); 

			log.info("Record is inserted into Task table");

		} catch (Exception e ) {

			log.error("error inserting Task info#####");
			e.printStackTrace();
			log.error(e.getMessage()+e.getCause());

		} finally {

			if (pstmt != null) {
				pstmt.close();
			}

			if (connection != null) {
				connection.close();
			}

		}
		
		return id;
	}



}
