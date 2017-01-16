package com.simplesarkar.actions;
 
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.simplesarkar.DAO.TaskDAO;
import com.simplesarkar.DAO.TaskDescriptionDAO;
import com.simplesarkar.model.Task;
import com.simplesarkar.model.TaskDescription;
import com.simplesarkar.model.TaskSummary;

public class IndexAction {
 
	final static Logger log = Logger.getLogger(IndexAction.class); 
	String cmd ;
	Long taskId;
	
	public String execute() throws Exception {

		log.info(" ########## comes in IndexAction  ");  
		log.info(" ########## comes in IndexAction cmd= "+cmd);   
		
		HttpServletRequest req = ServletActionContext.getRequest();
		ServletContext context = ServletActionContext.getServletContext();
		log.info( "context path="+context.getContextPath()); 
		
		TaskDAO td =  new TaskDAO();
		
		if(taskId == null ) {
		
		List<TaskSummary> tl = td.getAllTasksSummary(); 
		log.info("this is task list"+tl);
		
		req.setAttribute("taskSummary", tl);
		
		} else{
			List<Task> tl = td.getAllTasks(taskId);
			req.setAttribute("task", tl.get(0));
			
			TaskDescriptionDAO tdd = new TaskDescriptionDAO();
			
			List<TaskDescription> tdList = tdd.getTaskDescription(taskId);
			req.setAttribute("taskDescription", tdList.get(0));
			
			return "detail";
		}
		
       
		return "success";      
	}

	public String getCmd() {
		return cmd;
	}

	public void setCmd(String cmd) {
		this.cmd = cmd;
	}

	public long getTaskId() {
		return taskId;
	}

	public void setTaskId(long taskId) {
		this.taskId = taskId;
	}

	 
}
