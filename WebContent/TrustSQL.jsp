<% /* stats */ %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="p1.Connector" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Trust</title>
</head>
<body>
<%
	class Trust {
	public Trust(){
		
	}
	public String get(Statement stmt,String login1, String login2, String trust) throws Exception
	{
		String query;
		int parsedTrust;
		try{
			parsedTrust = Integer.parseInt(trust);
		}catch (Exception e)
   	 	{
			return "Invalid value, must be 0 or 1.";
   	 	}
		if(parsedTrust < 0 || parsedTrust > 1)
		{
			return "Invalid value, must be 0 or 1.";
		}
		
		query = ("INSERT INTO Trust (login1, login2, isTrusted) VALUES ('" + login1 + "', '" + login2 + "', '" + parsedTrust + "')");
			
		try{
			int results = stmt.executeUpdate(query);
	    } catch(Exception e) {
	    	if (e.getMessage().contains("Duplicate entry"))
	        {
	    		if(parsedTrust == 0)
	    		{
	    			parsedTrust = 1;
	    		}else
	    		{
	    			parsedTrust = 0;
	    		}
	    		query = ("INSERT INTO Trust (login1, login2, isTrusted) VALUES ('" + login1 + "', '" + login2 + "', '" + parsedTrust + "')");
	    		return "Trust changed.";
	        }
	        else
	        {
	    		System.err.println("Unable to execute query:"+query+"\n");
	    	    System.err.println(e.getMessage());
	    		throw(e);
	        }
		}
		return "Trust/Distrust Added.";
	}

}
%>
</body>
<%
	Connector con = new Connector();
	Trust trusted = new Trust();
	String result = trusted.get(con.stmt,(String)session.getAttribute("login"),request.getParameter("login2"),request.getParameter("trust"));

	out.println( result + "</br>"+ "<a href=\"TrustChoice.jsp\">Back</a> </br> <a href=\"MainScreen.jsp\">Main Screen</a>");
			
	con.closeConnection();
%>

</html>