<%@ page import="org.apache.log4j.Logger" %>
<%
 
Logger logger = Logger.getLogger( "signupResponse.jsp" );
 logger.info("comes in signupResponse.jsp");

 String key = "";

Object resp =  request.getAttribute("response");
 
 if(resp !=null){ 
	 key = (String)resp; 
 }else {
	 
	 key = "invalid";
 }
 
 logger.info("key="+key);
 
%>

<%=key%>