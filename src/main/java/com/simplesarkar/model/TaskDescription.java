package com.simplesarkar.model;

import java.sql.ResultSet;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

 
@Entity
@Table(name = "task_description")

@XmlRootElement
public class TaskDescription { 
	
	public TaskDescription(){};
	
	 public TaskDescription(ResultSet rs) {
		 try {
			 
			this.id =   rs.getLong("id") ;
			this.createdAt = rs.getDate("created_at");
			this.lastUpdatedAt = rs.getDate("last_updated_at");
			this.taskText = rs.getString("task_text"); 
			this.taskId = rs.getInt("task_id");
			this.category = rs.getString("category");
			this.active = rs.getString("active");
			this.heading = rs.getString("heading");
			 
		 } catch(Exception e){
			 System.out.println("error "+e);
			 e.printStackTrace();
		 }
		}
	
	 
	 
	private long id;
	private long taskId;
	private String taskText;
	private String category;
	private String heading;
	private String active;
	private Date createdAt;
	private Date lastUpdatedAt; 
	
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getTaskId() {
		return taskId;
	}

	public void setTaskId(long taskId) {
		this.taskId = taskId;
	}

	public String getTaskText() {
		return taskText;
	}

	public void setTaskText(String taskText) {
		this.taskText = taskText;
	}

	public Date getCreatedAt() {
		return createdAt;
	} 
 

	public Date getLastUpdatedAt() {
		return lastUpdatedAt;
	}

	@Override
	public String toString() {
		return "Task [id=" + id + ", taskId=" + taskId + ", taskText=" + taskText + ", category=" + category
				+ ", heading=" + heading + ", active=" + active + ", createdAt=" + createdAt + ", lastUpdatedAt="
				+ lastUpdatedAt + "]";
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getHeading() {
		return heading;
	}

	public void setHeading(String heading) {
		this.heading = heading;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public void setLastUpdatedAt(Date lastUpdatedAt) {
		this.lastUpdatedAt = lastUpdatedAt;
	}

	 
	
	
}
