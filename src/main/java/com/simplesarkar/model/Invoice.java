package com.simplesarkar.model;

import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

 
@Entity
@Table(name = "Invoice")

@XmlRootElement
public class Invoice {
	
	public Invoice() {}

	 public Invoice(ResultSet rs) {
	 try {
		this.id =   rs.getLong("id") ;
		this.createdAt = rs.getTimestamp("created_at");
		this.lastUpdated = rs.getTimestamp("last_updated_at");
		this.status = rs.getInt("status");
		this.technicianId = rs.getInt("technician_id");
		this.userId = rs.getInt("user_id");
		 
	 } catch(Exception e){
		 System.out.println("error "+e);
		 e.printStackTrace();
	 }
	}


	@Id 
	@GeneratedValue
	@Column(name = "id")
	private long id;


	@Column(name = "technician_id")
	private int technicianId;

	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "status")
	private int status;
	
	
	@Column(name = "last_updated")
	private Timestamp lastUpdated;
	
	@Column(name = "created_at")
	private Timestamp createdAt;
	
	

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getTechnicianId() {
		return technicianId;
	}

	public void setTechnicianId(int technicianId) {
		this.technicianId = technicianId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Timestamp getLastUpdated() {
		return lastUpdated;
	}

	public void setLastUpdated(Timestamp lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	@Override
	public String toString() {
		return "Invoice [id=" + id + ", technicianId=" + technicianId + ", userId=" + userId + ", status=" + status
				+ ", lastUpdated=" + lastUpdated + ", createdAt=" + createdAt + "]";
	}
	

}
