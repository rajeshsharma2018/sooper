package com.simplesarkar.REST;


import java.util.Set;
import java.util.HashSet;
import java.util.LinkedHashSet;

import javax.naming.AuthenticationNotSupportedException;
import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;

import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.server.filter.RolesAllowedDynamicFeature;

import com.simplesarkar.security.AuthenticationInterceptor;

@ApplicationPath("/rest")
public class RestController extends Application {
	private final HashSet<Object> singletons = new LinkedHashSet<Object>();
	
	public RestController() {
		final ResourceConfig resourceConfig = new ResourceConfig(RestController.class);
		resourceConfig.register(RolesAllowedDynamicFeature.class);
		singletons.add(resourceConfig);
	}
	
	@Override
	public Set<Object> getSingletons() {
	    return singletons;
	}
	
	@Override
	public Set getClasses(){
		
		Set set = new HashSet();
		//Add the authentication interceptor filter here...
		set.add(AuthenticationInterceptor.class);

		 
		set.add(Authorization.class);
		
		
		
		return set;
	}
}
