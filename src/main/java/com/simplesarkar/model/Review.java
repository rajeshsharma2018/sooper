package com.simplesarkar.model;

import java.sql.ResultSet;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class Review {
	


	public Review (ResultSet rs) {
		 try {
		this.id = rs.getLong("it");
		this.brokerId = rs.getLong("broker_id");
		this.userId = rs.getLong("userid");
		this.text = rs.getString("text");
		this.stars = rs.getInt("start");
		this.enable = rs.getBoolean("enable");
		 
		this.createdAt = rs.getDate("created_at");
		this.lastUpdated = rs.getDate("last_updated");
		  }catch(Exception e){
			 e.printStackTrace();
		 }
	}
	
	 @Column(name = "it")
	private long id;
	 
	 @Column(name = "broker_id")
	 private long brokerId;
	 
	@Column(name = "userid")
	 private long userId;
	
	 @Column(name = "text")
	 private String text;

	 @Column(name = "start")
	 private int stars;
	 
	 @Column(name = "enable")
	 private boolean enable;
	 
	 @Column(name = "created_at")
	 private Date createdAt;
	 
	 @Column(name = "last_updated")
	 private Date lastUpdated;
	 

	 public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getBrokerId() {
		return brokerId;
	}

	public void setBrokerId(long brokerId) {
		this.brokerId = brokerId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getStars() {
		return stars;
	}

	public void setStars(int stars) {
		this.stars = stars;
	}

	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
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

	@Override
	public String toString() {
		return "Review [id=" + id + ", brokerId=" + brokerId + ", userId=" + userId + ", text=" + text + ", stars="
				+ stars + ", enable=" + enable + "]";
	}

	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

}
