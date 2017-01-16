package com.simplesarkar.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
 
import com.simplesarkar.model.Review;
import com.simplesarkar.utils.DataSource;

public class ReviewsDAO {
	
	public List<Review> getReviews(long brokerId, long userId){
		List<Review> reviewList = new ArrayList<Review>();
		
		StringBuffer stb = new StringBuffer();
		stb.append("select * from reviews where enable = 1 ");
		if(brokerId > 0)
			stb.append(" and broker_id=? ");
		if(userId > 0)
			stb.append(" and userId=? ");
		 

		Connection connection = null;
		java.sql.PreparedStatement pstmt = null;
		ResultSet resultSet = null;

		int count = 1;

		try {
			connection = DataSource.getInstance().getConnection();
			pstmt = connection.prepareStatement(stb.toString());

			if(brokerId > 0)
				pstmt.setLong(count++, brokerId);
			if(userId > 0)
				pstmt.setLong(count++, userId);	
			 
			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
 
				Review r = new Review(resultSet);
				System.out.println("Review ="+r.toString());
				
				reviewList.add( new Review(resultSet));
 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {e.printStackTrace();}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {e.printStackTrace();}
			if (connection != null) try { connection.close(); } catch (SQLException e) {e.printStackTrace();}
		}

		System.out.println(" brokerList = "+reviewList.toString()); 
		return reviewList;
		
		 
	}
	
	
	
	


	public static void main(String args[]  ){

		System.out.println("rajesh ");
		ReviewsDAO b = new ReviewsDAO();

		List reviews =b.getReviews(4, 0);
 

	}

	
	
	
	
	
	

}
