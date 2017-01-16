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
@Table(name = "Invoice_line")

@XmlRootElement

public class InvoiceLine {
	
	public InvoiceLine() {}

	 public InvoiceLine(ResultSet rs) {
	 try {
		this.id =   rs.getLong("id") ;
		this.createdAt = rs.getTimestamp("created_at");
		this.lastUpdated = rs.getTimestamp("last_updated_at");
		this.status = rs.getInt("status");
		this.desc = rs.getString("description");
		this.amount = rs.getInt("amount");
		 
	 } catch(Exception e){
		 System.out.println("error "+e);
		 e.printStackTrace();
	 }
	}
	 

	@Id 
	@GeneratedValue
	@Column(name = "id")
	private long id;


	@Column(name = "invoice_id")
	private int invoiceId;
	
	@Column(name = "amount")
	private double amount;
	
	@Column(name = "description")
	private String desc;
	
	
	@Column(name = "status")
	private int status;
	
	
	@Column(name = "last_updated")
	private Timestamp lastUpdated;
	
	@Column(name = "created_at")
	private Timestamp createdAt;
	
	
	
	

	@Override
	public String toString() {
		return "InvoiceLine [id=" + id + ", invoiceId=" + invoiceId + ", amount=" + amount + ", desc=" + desc
				+ ", status=" + status + ", lastUpdated=" + lastUpdated + ", createdAt=" + createdAt + "]";
	}


 
	public long getId() {
		return id;
	}

 

	public void setId(long id) {
		this.id = id;
	} 

	public int getInvoiceId() {
		return invoiceId;
	}
 

	public void setInvoiceId(int invoiceId) {
		this.invoiceId = invoiceId;
	}
 

	public double getAmount() {
		return amount;
	}

 
	public void setAmount(double amount) {
		this.amount = amount;
	}
 


	public String getDesc() {
		return desc;
	}
 

	public void setDesc(String desc) {
		this.desc = desc;
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
 


	public Timestamp getCreatedAt() {
		return createdAt;
	}

 

}
