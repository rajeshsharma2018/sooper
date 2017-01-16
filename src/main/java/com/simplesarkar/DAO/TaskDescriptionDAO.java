package com.simplesarkar.DAO;
 
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List; 
import org.apache.log4j.Logger;

import com.mysql.jdbc.Statement;
import com.simplesarkar.databaseutils.EndUserDBHelper;
import com.simplesarkar.model.Task;
import com.simplesarkar.model.TaskDescription;
import com.simplesarkar.security.AuthN;
import com.simplesarkar.utils.DataSource; 


public class TaskDescriptionDAO {
  
	private EndUserDBHelper dbConnector;
	private AuthN authN;
	final static Logger log = Logger.getLogger(TaskDescriptionDAO.class);


	public TaskDescriptionDAO()
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



	public HashMap<String,ArrayList> getArticleSummary() throws SQLException{

		HashMap<String,ArrayList> aMap = new HashMap<String,ArrayList>();

		log.info("comes in get articles summary");
		StringBuffer stb = new StringBuffer();
		stb.append("select * from articles where active =1");

		Connection connection = null;
		java.sql.PreparedStatement pstmt = null;
		ResultSet resultSet = null;

		try {
			connection = DataSource.getInstance().getConnection();
			pstmt = connection.prepareStatement(stb.toString()); 

			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

				TaskDescription a = new TaskDescription(resultSet);
				ArrayList aList = (ArrayList)aMap.get(a.getCategory());

				if(aList == null){
					ArrayList temp = new ArrayList();
					temp.add(a);
					aMap.put(a.getCategory(), temp);
				}else{
					aList.add(a);
				}
			}

		} catch (Exception e) {
			log.error("error getting Article"); 
			log.error(e);
		} finally { 
			if (pstmt != null) {
				pstmt.close();
			}

			if (connection != null) {
				connection.close();
			}

		}


		return aMap;

	}


	public List<TaskDescription> getTaskDescription(long taskId) throws SQLException{

		log.info("comes in get TaskDescription");
		log.info("will query for taskid="+taskId);
		StringBuffer stb = new StringBuffer();
		stb.append("select * from task_description where id= ?");



		Connection connection = null;
		java.sql.PreparedStatement pstmt = null;
		ResultSet resultSet = null;

		List<TaskDescription> invList = new ArrayList<TaskDescription>();

		try {
			connection = DataSource.getInstance().getConnection();
			pstmt = connection.prepareStatement(stb.toString()); 
			pstmt.setLong(1,taskId);

			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

				TaskDescription article = new TaskDescription(resultSet);
				invList.add(article); 
			}

		} catch (Exception e) {
			log.error("error getting TaskDescription"); 
			log.error(e);
		} finally { 
			if (pstmt != null) {
				pstmt.close();
			}

			if (connection != null) {
				connection.close();
			}

		}

		log.info("found task description: "+invList);

		return invList;

	}




	public TaskDescription upsertTaskDescription( TaskDescription taskDescription) throws SQLException { 

		log.info("********** comes in upsertTaskDescription************");
		log.info("length of article="+taskDescription.getTaskText().length());


		Connection connection = null;
		java.sql.PreparedStatement pstmt = null; 
		String sql = "";
		long taskDescId = 0L;
		long taskId =0L;
		if(taskDescription.getId() <= 0) { 
			
			Task t = new Task();
			TaskDAO td = new TaskDAO();
			  taskId = td.insertTask(t);
			
			
			log.info("********** comes in INSERT TaskDescription ************");
			sql = "INSERT INTO task_description"
					+ "(task_text,task_id) "
					+ "VALUES  (?,?)";
		}else{ 
			log.info("********** comes in UPDATE TaskDescription ************");
			sql = "update task_description"
					+ " set task_text = ? where id = ?"; 
		}

		try {
			connection = DataSource.getInstance().getConnection();
			pstmt = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
 
			
			if(taskDescription.getId() <= 0) { 
				pstmt.setString(1, taskDescription.getTaskText()); 
				pstmt.setLong(2, taskId); 
				 
			} else{ 
				pstmt.setString(1, taskDescription.getTaskText()); 
				pstmt.setLong(2, taskDescription.getId());

			}
			  pstmt.executeUpdate(); 		
			  
			  ResultSet rs = pstmt.getGeneratedKeys();
				if (rs.next()) {
					taskDescId =  rs.getLong(1);
				}
				
			log.info(" ********* Record is upserted into task_description table with id="+taskDescId);

		} catch (Exception e ) { 
			log.error("error upserting task_description info*********");
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

		return getTaskDescription(taskDescId).get(0);
	} 

}

