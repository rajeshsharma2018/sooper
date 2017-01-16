<%@ page import="org.apache.log4j.Logger" %>
<%
 
Logger logger = Logger.getLogger( "TaskDescResponse.jsp" );
 logger.info("comes in TaskDescResponse.jsp");

 String key = "";

Long resp =  (Long)request.getAttribute("tdId");
 


 if(resp !=null){ 
	 key =  resp+""; 
 }else {
	 
	 key = "invalid";
 }
 
 logger.info("key="+key);
 
%>

<%=key%>