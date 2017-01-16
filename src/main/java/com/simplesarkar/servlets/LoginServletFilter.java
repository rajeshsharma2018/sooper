package com.simplesarkar.servlets;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public  class LoginServletFilter implements javax.servlet.Filter {
	    protected ServletContext servletContext;
	 
	    public void init(FilterConfig filterConfig) {
	        servletContext = filterConfig.getServletContext();
	    }
	 
	    public void doFilter(ServletRequest request, ServletResponse response, FilterChain
	        chain)
	        throws IOException, ServletException {
	    	
	    	
	    	System.out.println("comes in loginServletFIlter");
    		
	        HttpServletRequest req = (HttpServletRequest)request;
	        HttpServletResponse resp = (HttpServletResponse)response;
	     
	        if (!isAuth()) {
	        	System.out.println("Login failed");  
	            resp.sendError(HttpServletResponse.SC_UNAUTHORIZED);
	            return; //break filter chain, requested JSP/servlet will not be executed
	        }
	     
	        
	        System.out.println("Login passed");  
	        //propagate to next element in the filter chain, ultimately JSP/ servlet gets executed
	        chain.doFilter(request, response);        
	    }
	 
	    /**
	     * logic to accept or reject access to the page, check log in status
	     * @return true when authentication is deemed valid
	     */
	    protected  boolean isAuth() {
	    	
	    	return false;
	    }

		public void destroy() {
			// TODO Auto-generated method stub
			
		}
	 
	}