package com.simplesarkar.model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

import org.joda.time.DateTime;

@Entity
@Table(name = "technician")

@XmlRootElement
public class Task {
	
	public Task() {}

	 public Task(ResultSet rs) {
	 try {
		this.id =   rs.getLong("id") ;
		this.smallDesc = rs.getString("small_desc");
		this.fullDesc = rs.getString("full_desc");
		this.createdAt = rs.getDate("create_dt");
		this.lastUpdated = rs.getDate("last_updated");
		this.parentId = rs.getInt("parent_id");
		this.photoUrl = rs.getString("photo_url");
		this.videoUrl = rs.getString("video_url");
		this.city = rs.getString("city");
		this.pincode =  rs.getString("pin");;
		this.locationDesc = rs.getString("location_description");
		this.active = rs.getInt("active");
		this.numOfVolunteers = rs.getInt("num_users");
		this.manHrs = rs.getInt("approx_man_hrs");
		this.credits = rs.getInt("credits");
		
		
	 } catch(Exception e){
		 System.out.println("error "+e);
		 e.printStackTrace();
	 }
	}

	
	@Id 
	@GeneratedValue
	@Column(name = "id")
	private long id;

	
	@Column(name = "small_desc")
	private String smallDesc;

	@Column(name = "full_desc")
	private String fullDesc;

	@Column(name = "create_dt")
	private Date createdAt;
	
	@Column(name = "last_updated")
	private Date lastUpdated;
	
	@Column(name = "parent_id")
	private long parentId;
	
	@Column(name = "photo_url")
	private String photoUrl;
	
	
	@Column(name = "password")
	private String password;
	

	@Column(name = "video_url")
	private String videoUrl;
	

	@Column(name = "city")
	private String city;
	

	@Column(name = "pin")
	private String pincode;
	
 
 
	
	@Column(name = "location_description")
	private String locationDesc;
	
	@Column(name = "active")
	private int active;



	@Column(name = "num_users")
	private int numOfVolunteers;
	


	@Column(name = "approx_man_hrs")
	private int manHrs;
	

	@Column(name = "credits")
	private int credits;
	 
	
	@Column(name = "created_by")
	private long createdBy;
	
	@Column(name = "creator_can_volunteer")
	private int creatorCanVolunteer;
	
	@Column(name = "trending_lvl")
	private int trendingLvl;
	
	
	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public String getSmallDesc() {
		return smallDesc;
	}


	public void setSmallDesc(String smallDesc) {
		this.smallDesc = smallDesc;
	}


	public String getFullDesc() {
		return fullDesc;
	}
	public void setFullDesc(String fullDesc) {
		this.fullDesc = fullDesc;
	}



	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}


	public Date getLastUpdated() {
		return lastUpdated;
	}

	

	public long getParentId() {
		return parentId;
	}

	public void setParentId(long parentId) {
		this.parentId = parentId;
	}


	public String getPhotoUrl() {
		return photoUrl;
	}


	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}


	public String getVideoUrl() {
		return videoUrl;
	}


	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getPincode() {
		return pincode;
	}


	public void setPincode(String pincode) {
		this.pincode = pincode;
	}


	public String getLocationDescription() {
		return locationDesc;
	}


	public void setLocation(String locationDesc) {
		this.locationDesc = locationDesc;
	}


	public int getActive() {
		return active;
	}


	public void setActive(int active) {
		this.active = active;
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

	@Override
	public String toString() {
		return "Task [id=" + id + ", smallDesc=" + smallDesc + ", fullDesc=" + fullDesc + ", createdAt=" + createdAt
				+ ", lastUpdated=" + lastUpdated + ", parentId=" + parentId + ", photoUrl=" + photoUrl + ", password="
				+ password + ", videoUrl=" + videoUrl + ", city=" + city + ", pincode=" + pincode + ", locationDesc="
				+ locationDesc + ", active=" + active + ", numOfVolunteers=" + numOfVolunteers + ", manHrs=" + manHrs
				+ ", credits=" + credits + "]";
	}
	
	 





}

