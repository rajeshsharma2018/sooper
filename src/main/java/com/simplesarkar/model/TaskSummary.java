package com.simplesarkar.model;

import java.sql.Date;
import java.sql.ResultSet;

import javax.persistence.Column;

public class TaskSummary {

	 public TaskSummary(ResultSet rs) {
		 try {
			 this.id = rs.getLong("id");
			this.smallDesc = rs.getString("small_desc"); 
			this.createdAt = rs.getDate("create_dt");
			this.lastUpdated = rs.getDate("last_updated"); 
			this.photoUrl = rs.getString("photo_url");
			this.videoUrl = rs.getString("video_url");
			this.city = rs.getString("city");
			this.pincode =  rs.getString("pin"); 
			this.numOfVolunteers = rs.getInt("num_users");
			this.manHrs = rs.getInt("approx_man_hrs");
			this.credits = rs.getInt("credits");  
		 } catch(Exception e){
			 System.out.println("error "+e);
			 e.printStackTrace();
		 }
		}

	 

		@Column(name = "id")
		private long id;
		
		
		
	@Column(name = "small_desc")
	private String smallDesc;
	

	@Column(name = "last_updated")
	private Date lastUpdated;
	

	@Column(name = "last_updated")
	private Date createdAt;

	@Column(name = "city")
	private String city;
	
	@Column(name = "password")
	private String password;
	

	@Column(name = "video_url")
	private String videoUrl;
	
	@Column(name = "photo_url")
	private String photoUrl;


	@Column(name = "pin")
	private String pincode;
	
	@Column(name = "num_users")
	private int numOfVolunteers;
	


	@Column(name = "approx_man_hrs")
	private int manHrs;
	

	@Column(name = "credits")
	private int credits;


	@Override
	public String toString() {
		return "TaskSummary [smallDesc=" + smallDesc + ", lastUpdated=" + lastUpdated + ", city=" + city + ", password="
				+ password + ", videoUrl=" + videoUrl + ", numOfVolunteers=" + numOfVolunteers + ", manHrs=" + manHrs
				+ ", credits=" + credits + "]";
	}


	public String getSmallDesc() {
		return smallDesc;
	}


	public void setSmallDesc(String smallDesc) {
		this.smallDesc = smallDesc;
	}


	public Date getLastUpdated() {
		return lastUpdated;
	}


	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getVideoUrl() {
		return videoUrl;
	}


	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}


	public int getNumOfVolunteers() {
		return numOfVolunteers;
	}


	public void setNumOfVolunteers(int numOfVolunteers) {
		this.numOfVolunteers = numOfVolunteers;
	}


	public int getManHrs() {
		return manHrs;
	}


	public void setManHrs(int manHrs) {
		this.manHrs = manHrs;
	}


	public int getCredits() {
		return credits;
	}


	public void setCredits(int credits) {
		this.credits = credits;
	}


	public Date getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}


	public String getPhotoUrl() {
		return photoUrl;
	}


	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}


	public String getPincode() {
		return pincode;
	}


	public void setPincode(String pincode) {
		this.pincode = pincode;
	}


	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}
	
	
	
	
}
