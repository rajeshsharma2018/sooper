package com.simplesarkar.model;

import java.sql.ResultSet;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;


@Entity
@Table(name = "user")

@XmlRootElement
public class User {

	public User()
	{
		this.id = 0;
		this.firstName = null;
		this.lastName = null;
		this.email = null;
		this.phoneNum = null;
	
		this.password = null;
		this.addressId = 0;
		this.isBlacklisted = false;
		this.createdAt = null;
		this.lastUpdated = null; 
	}

	public User(ResultSet rs) {
		 try {
		this.id = rs.getLong("id");
		this.firstName = rs.getString("first_name");
		this.lastName = rs.getString("last_name");
		this.email = rs.getString("email");
		this.password = rs.getString("password");
		this.addressId = rs.getLong("address_id");
		this.phoneNum = rs.getString("phone_num");
		this.isBlacklisted = rs.getBoolean("is_blacklisted");
		this.createdAt = rs.getDate("created_at");
		this.lastUpdated = new Date();
		 		 }catch(Exception e){
			 e.printStackTrace();
		 }
	}
	
	@Id 
	@GeneratedValue
	@Column(name = "id")
	private long id;

	
	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	@Column(name = "email")
	private String email;
	

	@Column(name = "phoneNum")
	private String phoneNum;

	@Column(name = "password")
	private String password;

	@Column(name = "address_id")
	private long addressId;

	@Column(name = "is_blacklisted")
	private boolean isBlacklisted;

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
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public long getAddressId() {
		return addressId;
	}
	public void setAddressId(long addressId) {
		this.addressId = addressId;
	}
	public boolean isBlacklisted() {
		return isBlacklisted;
	}
	public void setBlacklisted(boolean isBlacklisted) {
		this.isBlacklisted = isBlacklisted;
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
	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}
	 
	@Override
	public String toString() {
		return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", phoneNum=" + phoneNum + ", password=" + password + ", addressId=" + addressId + ", isBlacklisted="
				+ isBlacklisted + ", createdAt=" + createdAt + ", lastUpdated=" + lastUpdated + "]";
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
 
	



}
