package com.simplesarkar.model;

import java.util.Date;

public class Tracking {

	private long id;
	private Date createdAt;
	private int pageNum;
	private int isDirectHere;
	
	private String ip;
	private String path;
	
	
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int isDirectHere() {
		return isDirectHere;
	}
	public void setDirectHere(int isDirectHere) {
		this.isDirectHere = isDirectHere;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
	
	@Override
	public String toString() {
		return "Tracking [id=" + id + ", createdAt=" + createdAt + ", pageNum=" + pageNum + ", isDirectHere="
				+ isDirectHere + ", ip=" + ip + ", path=" + path + "]";
	}
	
}
