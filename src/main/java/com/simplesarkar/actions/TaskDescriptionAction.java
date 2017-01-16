package com.simplesarkar.actions;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.simplesarkar.DAO.TaskDescriptionDAO;
import com.simplesarkar.model.TaskDescription;
import com.simplesarkar.utils.Constants;


public class TaskDescriptionAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String cmd;
	private String taskText;
	private String taskId;

	final static Logger log = Logger.getLogger(TaskDescriptionAction.class);

	public String execute() throws Exception {

		log.info("comes in TaskDescriptionAction");  

		HttpServletRequest req = ServletActionContext.getRequest();
		ServletContext context = ServletActionContext.getServletContext();
		log.info( "context path="+context.getContextPath());

		log.info("#########");  
		log.info("#########");   
		log.info("cmd="+cmd);
		log.info("taskId="+taskId);
		log.info("this is articleText"+taskText);

		if(cmd.equalsIgnoreCase("save")){

			StringBuffer stb = new StringBuffer();

		  	stb.append(taskText);

			 
			TaskDescriptionDAO aDAO = new TaskDescriptionDAO() ;
			TaskDescription td = new TaskDescription();
			td.setTaskText(stb.toString());

			long taskIdL = 0L;
			if(!StringUtils.isBlank(taskId)){
				taskIdL = Long.parseLong(taskId);
			}


			td.setId(taskIdL);
			td = aDAO.upsertTaskDescription(td);
			req.setAttribute("tdId", td.getId());

			System.out.println("In TaskDescriptionAction Save () - now going to forward");

			return "view";  

		} else if(cmd.equalsIgnoreCase("new")){
			req.setAttribute("article", Constants.EDITOR_STUB_PREFIX + Constants.EDITOR_STUB_SUFFIX);

			System.out.println("In TaskDescriptionAction NEW() - snow going to forward");


			return "success";  

		} else if(cmd.equalsIgnoreCase("populate")){
			TaskDescriptionDAO td = new TaskDescriptionDAO();

			long taskIdL = 0L;
			if(!StringUtils.isBlank(taskId)){
				taskIdL = Long.parseLong(taskId);
			}

			System.out.println(" this is the taslId="+taskIdL);
			TaskDescription a =	td.getTaskDescription(taskIdL).get(0);

			req.setAttribute("taskDescription",a);

		}

		return "success";

	}

	public String getCmd() {
		return cmd;
	}

	public void setCmd(String cmd) {
		this.cmd = cmd;
	}

	public String getTaskId(){
		return taskId;
	}
	public void setTaskId(String taskId){
		this.taskId = taskId;
	}

	public String getTaskText() {
		return taskText;
	}

	public void setTaskText(String taskText) {
		this.taskText = taskText;
	}

}
