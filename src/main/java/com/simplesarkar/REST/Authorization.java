package com.simplesarkar.REST;

import java.io.IOException;
import java.io.Serializable;

import javax.annotation.security.PermitAll;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Cookie;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.NewCookie;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

import com.simplesarkar.common.ArgumentValidator;
import com.simplesarkar.common.SSConstants;
import com.simplesarkar.common.SimpleUtils;
import com.simplesarkar.common.UserCredentialsBasic;
import com.simplesarkar.security.AuthProvider;
import com.simplesarkar.security.Secured;

 	 @Path("auth")
	 @PermitAll
	public class Authorization {
		 
		 private class Temp implements Serializable {

			 public Temp(String value)
			 {
				 val = value;
			 }
			/**
			 * 
			 */
			private static final long serialVersionUID = 4094418730036623842L;
			private String val;
			public String getVal() {
				return val;
			}
			public void setVal(String val) {
				this.val = val;
			}
			
				
		 }
		 
		 //Logs out the user, resets the cookie n all
		 @Secured
		 @POST
		 @Path("logout")
		 @Produces({MediaType.APPLICATION_JSON})
		 public Response logoutUser()
		 {
	            //Save a cookie here as well...
	            Cookie authCookie = new Cookie(SSConstants.AUTHCOOKIENAME, "", SSConstants.AUTHCOOKIEPATH, null);
	            ResponseBuilder res = Response.ok("");
	            NewCookie newCookie = new NewCookie(authCookie);
	            NewCookie[] newCookies = new NewCookie[1];
	            newCookies[0] = newCookie;
	            res.cookie(newCookies);
	            
	            // Return the token on the response
	            return res.build();
		 }

		 //Checks if the users session is valid or not...
		 @Secured
		 @GET
		 @Path("verifySession")
		 @Produces({MediaType.APPLICATION_JSON})
		 public Response isSessionValid()
		 {
			 ResponseBuilder res = Response.ok("");
			 return res.build();
		 }
		 
		 //Auth method.. returns a token for the user and sets a cookie as well.. 
		    @POST
		    @Path("login")
		    @Produces({MediaType.APPLICATION_JSON})
		    @Consumes({MediaType.APPLICATION_JSON})
		    public Response authenticateUser(UserCredentialsBasic ucB) 
		    {
		        try {
		        	String username = ucB.getUsername();
		        	String password = ucB.getPassword();
		        	System.out.println("LoginService Got User : " + username + " and password : " + password);
		            
		            // Authenticate the user using the credentials provided
		            String token = authenticate(username, password);
		            
		            if (ArgumentValidator.IsStringNullOrEmpty(token))
		            {
		            	return Response.status(Response.Status.UNAUTHORIZED).build();
		            }
		            
		            //Save a cookie here as well...
		            Cookie authCookie = new Cookie(SSConstants.AUTHCOOKIENAME, token, SSConstants.AUTHCOOKIEPATH, null);
		            ResponseBuilder res = Response.ok(token);
		            NewCookie newCookie = new NewCookie(authCookie);
		            NewCookie[] newCookies = new NewCookie[1];
		            newCookies[0] = newCookie;
		            res.cookie(newCookies);
		            
		            // Return the token on the response
		            return res.build();

		        } catch (Exception e) {
		            return Response.status(Response.Status.UNAUTHORIZED).build();
		        }      
		    }
		    
		    @POST
		    @Path("loginPT")
		    @Produces({MediaType.APPLICATION_JSON})
		    @Consumes({MediaType.APPLICATION_FORM_URLENCODED})
		    public Response authenticateUser(@FormParam("username") String username, 
		                                     @FormParam("password") String password) {
		        try {
		        	System.out.println("LoginService Got User : " + username + " and password : " + password);
		            
		            // Authenticate the user using the credentials provided
		            String token = authenticate(username, password);
		            
		            if (ArgumentValidator.IsStringNullOrEmpty(token))
		            {
		            	return Response.status(Response.Status.UNAUTHORIZED).build();
		            }
		            
		            //Save a cookie here as well...
		            Cookie authCookie = new Cookie(SSConstants.AUTHCOOKIENAME, token, SSConstants.AUTHCOOKIEPATH, null);
		            ResponseBuilder res = Response.ok(token);
		            NewCookie newCookie = new NewCookie(authCookie);
		            NewCookie[] newCookies = new NewCookie[1];
		            newCookies[0] = newCookie;
		            res.cookie(newCookies);
		            
		            // Return the token on the response
		            return res.build();

		        } catch (Exception e) {
		            return Response.status(Response.Status.UNAUTHORIZED).build();
		        }      
		    }


		    private String authenticate(String userName, String password) throws Exception {
		        // Authenticate against a database, LDAP, file or whatever
		        return AuthProvider.AuthenticateUser(userName, password);
		    }
		
	}
