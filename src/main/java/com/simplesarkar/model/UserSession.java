package com.simplesarkar.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

import org.joda.time.DateTime;

@Entity
@Table(name = "user_session")

@XmlRootElement
public class UserSession {

	@Id 
	@GeneratedValue
	@Column(name = "id")
	private long id;

	
	@Column(name = "technician_id")
	private int technicianId;
	

	@Column(name = "user_id")
	private int userId;
	

	@Column(name = "agreement_signed")
	private boolean agreementSigned;
	

	@Column(name = "is_resolved")
	private boolean isResolved;
	

	@Column(name = "video_url")
	private String videoUrl;
	

	@Column(name = "duration")
	private int duration;
	

	@Column(name = "last_Updated")
	private DateTime lastUpdated;


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


	public boolean isAgreementSigned() {
		return agreementSigned;
	}


	public void setAgreementSigned(boolean agreementSigned) {
		this.agreementSigned = agreementSigned;
	}


	public boolean isResolved() {
		return isResolved;
	}


	public void setResolved(boolean isResolved) {
		this.isResolved = isResolved;
	}


	public String getVideoUrl() {
		return videoUrl;
	}


	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}


	public int getDuration() {
		return duration;
	}


	public void setDuration(int duration) {
		this.duration = duration;
	}


	public DateTime getLastUpdated() {
		return lastUpdated;
	}


	public void setLastUpdated(DateTime lastUpdated) {
		this.lastUpdated = lastUpdated;
	}


	@Override
	public String toString() {
		return "UserSession [id=" + id + ", technicianId=" + technicianId + ", userId=" + userId + ", agreementSigned="
				+ agreementSigned + ", isResolved=" + isResolved + ", videoUrl=" + videoUrl + ", duration=" + duration
				+ ", lastUpdated=" + lastUpdated + "]";
	}
	
	
	
	
	
}
