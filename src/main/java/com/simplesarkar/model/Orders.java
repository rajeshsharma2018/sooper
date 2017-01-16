package com.simplesarkar.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

import org.joda.time.DateTime;

@Entity
@Table(name = "orders")

@XmlRootElement
public class Orders {
	
	@Id 
	@GeneratedValue
	@Column(name = "id")
	private long id;

	
	@Column(name = "technician_id")
	private int technicianId;

	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "amount")
	private int amount;
	
	@Column(name = "is_successful")
	private boolean isSuccessful;

	@Column(name = "notes")
	private String notes;
	
	@Column(name = "last_updated")
	private Timestamp lastUpdated;

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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public boolean isSuccessful() {
		return isSuccessful;
	}

	public void setSuccessful(boolean isSuccessful) {
		this.isSuccessful = isSuccessful;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Timestamp getLastUpdated() {
		return lastUpdated;
	}

	public void setLastUpdated(Timestamp lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	@Override
	public String toString() {
		return "Orders [id=" + id + ", technicianId=" + technicianId + ", userId=" + userId + ", amount=" + amount
				+ ", isSuccessful=" + isSuccessful + ", notes=" + notes + ", lastUpdated=" + lastUpdated + "]";
	}



	
}
