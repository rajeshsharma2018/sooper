package com.simplesarkar.model;

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
public class Technician {
	
	public Technician() {}

	 public Technician(ResultSet rs) {
	 try {
		this.id =   rs.getLong("id") ;
		this.firstName = rs.getString("first_name");
		this.lastName = rs.getString("last_name");
		this.email = rs.getString("email");
		this.country = rs.getString("country");
		this.city = rs.getString("city");
		this.state = rs.getString("state");
		this.password = rs.getString("password");
		this.isBlackListed = rs.getBoolean("is_blacklisted");
		this.isEnabled =  rs.getBoolean("is_enabled");;
		this.createdAt = rs.getTimestamp("created_at");
		this.updatedAt = rs.getTimestamp("last_updated");
		
	 } catch(Exception e){
		 System.out.println("error "+e);
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

	@Column(name = "country")
	private String country;
	
	@Column(name = "state")
	private String state;
	
	@Column(name = "city")
	private String city;
	
	@Column(name = "email")
	private String email;
	
	
	@Column(name = "password")
	private String password;
	

	@Column(name = "about_me")
	private String aboutMe;
	

	@Column(name = "rate")
	private double rate;
	

	@Column(name = "pic_url")
	private String picUrl;
	
 
 
	
	@Column(name = "is_blacklisted")
	private boolean isBlackListed;
	
	@Column(name = "is_enable")
	private boolean isEnabled;



	@Column(name = "created_at")
	private Timestamp createdAt;
	


	@Column(name = "updated_at")
	private Timestamp updatedAt;
	
	

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


	public String getCountry() {
		return country;
	}


	public void setCountry(String country) {
		this.country = country;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
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


	public String getAboutMe() {
		return aboutMe;
	}


	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}


	public double getRate() {
		return rate;
	}


	public void setRate(double rate) {
		this.rate = rate;
	}


	public String getPicUrl() {
		return picUrl;
	}


	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}


	 


	@Override
	public String toString() {
		return "Technician [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", country=" + country
				+ ", state=" + state + ", city=" + city + ", email=" + email + ", password=" + password + ", aboutMe="
				+ aboutMe + ", rate=" + rate + ", picUrl=" + picUrl + ", isBlackListed=" + isBlackListed
				+ ", isEnabled=" + isEnabled + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + "]";
	}

	public boolean isBlackListed() {
		return isBlackListed;
	}

	public void setBlackListed(boolean isBlackListed) {
		this.isBlackListed = isBlackListed;
	}

	public boolean isEnabled() {
		return isEnabled;
	}

	public void setEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}
 





}
