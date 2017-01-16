package com.simplesarkar.actions;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.simplesarkar.DAO.TechnicianDAO;
import com.simplesarkar.common.SSConstants;
import com.simplesarkar.model.Technician;

public class TechnicianAction extends ActionSupport {
 
	/**
	 * 
	 */
	private static final long serialVersionUID = -2892465507274460253L;
	
	private String fName;
	private String lName;
	private String email;
	private String pwd;
	private String phoneNum; 
	private String isTechnician;
	private String linkedInProfile;
	private String title;
	private String certifications;
	private String country;
	private String aboutMe;
	private String english;
	private String rate;
	private String tktrRate;
	 
	
	
	
	final static Logger log = Logger.getLogger(TechnicianAction.class);
	
	public String execute() throws Exception {
		log.info("comes in TechnicianAction");
		log.info("test");
		log.info("test");
		log.info("test");
		log.info("test");
		
		log.info("fName="+fName+" lName="+lName+" email="+email+" phoneNum="+phoneNum+" ");
		
		
		String token = "";
		HttpServletRequest req = ServletActionContext.getRequest(); 
		HttpSession session = req.getSession();
		token = (String)session.getAttribute(SSConstants.AUTHCOOKIENAME);
		if(token == null){
			log.info("token is null");
		}
		
		Technician tech = getTechnicianObj();
		log.info("created Technician Object: "+tech.toString());
		
		TechnicianDAO tDAO = new TechnicianDAO();
		tDAO.insertTechnician(tech);
		
		req.setAttribute("response","success");
		 
		 
		
		return "success";
	}

	private Technician getTechnicianObj(){
		Technician tech = new Technician();
		tech.setAboutMe(aboutMe);
		 
		tech.setCountry(country);
		tech.setCreatedAt(new Timestamp(new Date().getTime()));
		tech.setUpdatedAt(new Timestamp(new Date().getTime()));
		tech.setEmail(email);
		tech.setEnabled(false); 
		tech.setFirstName(fName);
		tech.setLastName(lName);
		
		int rateI = Integer.valueOf(rate); 
		
		log.info("this is getTechnician");
		log.info("this is getTechnician");
		log.info("this is getTechnician");
		log.info("this is getTechnician");
		log.info("this is getTechnician");
		
		
		tech.setRate(rateI);
	 	
		return tech;
	}

	public String getFName() {
		return fName;
	}

	public void setFName(String fName) {
		this.fName = fName;
	}

	public String getLName() {
		return lName;
	}

	public void setLName(String lName) {
		this.lName = lName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getIsTechnician() {
		return isTechnician;
	}

	public void setIsTechnician(String isTechnician) {
		this.isTechnician = isTechnician;
	}

	public String getLinkedInProfile() {
		return linkedInProfile;
	}

	public void setLinkedInProfile(String linkedInProfile) {
		this.linkedInProfile = linkedInProfile;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCertifications() {
		return certifications;
	}

	public void setCertifications(String certifications) {
		this.certifications = certifications;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	public String getEnglish() {
		return english;
	}

	public void setEnglish(String english) {
		this.english = english;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getTktrRate() {
		return tktrRate;
	}

	public void setTktrRate(String tktrRate) {
		this.tktrRate = tktrRate;
	}
	
	
	 
}
