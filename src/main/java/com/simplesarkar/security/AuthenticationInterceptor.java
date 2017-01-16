package com.simplesarkar.security;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.annotation.Priority;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.core.Cookie;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.SecurityContext;
import javax.ws.rs.ext.Provider;

import org.apache.log4j.spi.Filter;

import javax.ws.rs.Priorities;

import com.simplesarkar.common.ArgumentValidator;
import com.simplesarkar.common.SSConstants;
import com.simplesarkar.common.ValidationToken;

/*
 * Intercepts the request and validates if the user is authorized to use the API...
 */
@Secured
@Provider
@Priority(Priorities.AUTHORIZATION)
public class AuthenticationInterceptor implements  javax.ws.rs.container.ContainerRequestFilter {
	public void filter(ContainerRequestContext requestContext) throws IOException 
	{
		String authToken = null;
		String path = requestContext.getUriInfo().getPath();
		System.out.println("in th Auth Filter tryin to validate the request to endpoint " + path);
		
		//TODO : need to fix this
		//TODO : we shouldnt be whitelisting paths that are unauth allowed... 
		//the annotation "@Secured" should work
		if (!IsPathWhileListedForUnAuthAccess (path))
		{
			//GEt the token first from the auth header... if not there try to get if from a saved cookie 
			String authorizationHeader = 
		            requestContext.getHeaderString(HttpHeaders.AUTHORIZATION);
			
			System.out.println("Auth header found for request : " + authorizationHeader);
		//First try to get the token fro the AuthHeader
		if (!ArgumentValidator.IsStringNullOrEmpty(authorizationHeader))
		{
			if (!(authorizationHeader.length() > SSConstants.MaxTokenLength))
			{
				authToken = (String) authorizationHeader.subSequence(SSConstants.AUTHHEADERTOKENPREFIX.length(), (authorizationHeader.length() -1));
			}
		}
		else
		{
			//Next try to get the token from the cookie
			Cookie cookie = requestContext.getCookies().get(SSConstants.AUTHCOOKIENAME);
			if (cookie != null)
			{
				authToken = cookie.getValue();
			}
		}
		
		System.out.println("Auth token form tha tuh header : " + authToken);

		if (!ArgumentValidator.IsStringNullOrEmpty(authToken))
		{
			System.out.println("Checking if the token is valid");
			final ValidationToken vD = new ValidationToken();
			try{
				//See if the token is valid
				vD.Init(authToken);
				if (vD.IsValid())
				{
					//crerate a security context here and modify the methods important to us...
					SecurityContext sc = new SecurityContext() {
						
						//See if the user had the role being asked for
						public boolean isUserInRole(String role) {
							String[] roles = vD.GetRoles();
							
							for (int i = 0 ; i < roles.length; i++)
							{
								if (roles[i].equals(role))
								{
									return true;
								}
							}
							
							return false;
						}
						
						public boolean isSecure() {
							// TODO Auto-generated method stub
							return true;
						}
						
						//Get the users principal here...
						public Principal getUserPrincipal() {
							return new Principal() {
								
								public String getName() {
									return vD.GetEmailId();
								}
							};
						}
						
						public String getAuthenticationScheme() {
							// TODO Auto-generated method stub
							return null;
						}
					};
					
					//set the security context in the request context
			        requestContext.setSecurityContext(sc);
			        //done here.. lets return
			        return;
				}
				else
				{
					System.out.println("Auth token is invalid...");
				}

			}
			catch (Exception ex)
			{
				System.out.println("Exception in validating token : " + ex.getMessage() + " \n" + ex.toString());
				this.AbourtWithUnAuth(requestContext);
			}
		}
		
		System.out.println("No token found for the request... unauth");
		this.AbourtWithUnAuth(requestContext);
		}
		else
		{
			System.out.print("The specified path " + path + " is whitelisted for unauth access... will let it through as is");
		}
	}
	
	private boolean IsPathWhileListedForUnAuthAccess(String path)
	{
		boolean retVal = false;
		
		if (path.equals("auth/loginPT"))
		{
			retVal = true;
		} else if (path.equals("auth/login"))
		{
			retVal = true;
		}
		
		return retVal;
	}
	
	private void AbourtWithUnAuth(ContainerRequestContext requestContext)
	{
        requestContext.abortWith(Response
                .status(Response.Status.UNAUTHORIZED)
                .entity("User cannot access the resource.")
                .build());
	}
}
