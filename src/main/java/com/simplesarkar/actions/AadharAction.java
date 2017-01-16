package com.simplesarkar.actions;



import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport; 
import com.simplesarkar.DAO.UserDAO;
import com.simplesarkar.common.SSConstants; 

public class AadharAction extends ActionSupport   {


	final static Logger log = Logger.getLogger(AadharAction.class);

	  

	// aadhar box 1
	private String dob; 
	private String gender;
	private String name;
	private String title;
	private String age;
	private String email;
	private String phone;
	private String cmd;


	// aadhar box 2 
	private String careOf;
	private String careOfName;
	private String houseNo;
	private String streetName;
	private String landmark;
	private String sector;
	private String district;
	private String subDistrict;
	private String state;
	private String pin;


	//aadhar box 3
	private String detailsOf;
	private String detailsOfTitle;
	private String detailsOfName;
	private String detailsOfEID;
	private String verificationType;
	private String introducerAadhar;
	private String hofRelation;
	private String hofEIDNo;

	//aadhar box 4

	private String poiDocs;
	private String porDocs;
	private String poaDocs;
	private String dobDocs;

	public String execute() throws Exception {

		log.info("***** comes in AadharAction with cmd="+cmd);
		log.info("***** comes in AadharAction with cmd="+cmd);
		log.info("***** comes in AadharAction with cmd="+cmd);
		log.info("***** comes in AadharAction with cmd="+cmd);
		 
		Map session = ActionContext.getContext().getSession();
		String token = (String)session.get(SSConstants.AUTHCOOKIENAME);
		boolean isTokenValid = validateToken(token);
		log.info(" inside aadhar action, isTokenValid="+isTokenValid);
		
		if(cmd == null || "".equals(cmd)){
			return "success";
		} 
 
		 
			  

		return "success";
	}


	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	private boolean validateToken(Map session){
		String token = (String)session.get(SSConstants.AUTHCOOKIENAME);
		return UserDAO.validateToken(token);
	}
	public boolean validateToken(String token){
		 
		return UserDAO.validateToken(token);
	}

	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub

	}

	public static Logger getLog() {
		return log;
	}

 

	public String getGender() {
		return gender;
	}

	public String getName() {
		return name;
	}

	public String getTitle() {
		return title;
	}

	public String getAge() {
		return age;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}
 

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCmd() {
		return cmd;
	}

	public void setCmd(String cmd) {
		this.cmd = cmd;
	}

	public String getCareOf() {
		return careOf;
	}

	public String getCareOfName() {
		return careOfName;
	}

	public String getHouseNo() {
		return houseNo;
	}

	public String getStreetName() {
		return streetName;
	}

	public String getLandmark() {
		return landmark;
	}

	public String getSector() {
		return sector;
	}

	public String getDistrict() {
		return district;
	}

	public String getSubDistrict() {
		return subDistrict;
	}

	public String getState() {
		return state;
	}

	public String getPin() {
		return pin;
	}

	public String getDetailsOf() {
		return detailsOf;
	}

	public String getDetailsOfTitle() {
		return detailsOfTitle;
	}

	public String getDetailsOfName() {
		return detailsOfName;
	}

	public String getDetailsOfEID() {
		return detailsOfEID;
	}

	public String getVerificationType() {
		return verificationType;
	}

	public String getIntroducerAadhar() {
		return introducerAadhar;
	}

	public void setCareOf(String careOf) {
		this.careOf = careOf;
	}

	public void setCareOfName(String careOfName) {
		this.careOfName = careOfName;
	}

	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

	public void setSector(String sector) {
		this.sector = sector;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public void setSubDistrict(String subDistrict) {
		this.subDistrict = subDistrict;
	}

	public void setState(String state) {
		this.state = state;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public void setDetailsOf(String detailsOf) {
		this.detailsOf = detailsOf;
	}

	public void setDetailsOfTitle(String detailsOfTitle) {
		this.detailsOfTitle = detailsOfTitle;
	}

	public void setDetailsOfName(String detailsOfName) {
		this.detailsOfName = detailsOfName;
	}

	public void setDetailsOfEID(String detailsOfEID) {
		this.detailsOfEID = detailsOfEID;
	}

	public void setVerificationType(String verificationType) {
		this.verificationType = verificationType;
	}

	public void setIntroducerAadhar(String introducerAadhar) {
		this.introducerAadhar = introducerAadhar;
	}

	public String getPoiDocs() {
		return poiDocs;
	}

	public String getPorDocs() {
		return porDocs;
	}

	public String getPoaDocs() {
		return poaDocs;
	}

	public String getDobDocs() {
		return dobDocs;
	}

	public void setPoiDocs(String poiDocs) {
		this.poiDocs = poiDocs;
	}

	public void setPorDocs(String porDocs) {
		this.porDocs = porDocs;
	}

	public void setPoaDocs(String poaDocs) {
		this.poaDocs = poaDocs;
	}

	public void setDobDocs(String dobDocs) {
		this.dobDocs = dobDocs;
	}



	public String getHofRelation() {
		return hofRelation;
	}

	public void setHofRelation(String hofRelation) {
		this.hofRelation = hofRelation;
	}

	public String getHofEIDNo() {
		return hofEIDNo;
	}

	public void setHofEIDNo(String hofEIDNo) {
		this.hofEIDNo = hofEIDNo;
	}



}
