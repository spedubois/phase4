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
<title>Feedback</title>
</head>
<body>
<%
	class Feedback {
	public Feedback(){
		
	}
	public String get(Statement stmt,String hid, String score, String text,String login) throws Exception
	{
		String query;
		int parsedScore;
		java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
		try{
			parsedScore = Integer.parseInt(score);
		}catch (Exception e)
   	 	{
			return "Invalid score";
   	 	}
		
		query = ("INSERT INTO Feedback (hid, login, fbdate, text, score, fid) VALUES ('" + hid + "', '" + login + "', '" + sqlDate + "', '" + text + "', '" + score + "', '" + 0 + "')");
			
		try{
			int results = stmt.executeUpdate(query);
	    } catch(Exception e) {
	    	if(e.getMessage().contains("Incorrect integer"))
	        {
	            return "Invalid score";
	        }
	        else
	        {
	    		System.err.println("Unable to execute query:"+query+"\n");
	    	    System.err.println(e.getMessage());
	    		throw(e);
	        }
		}
		return "Feedback Added.";
	}

}

%>
</body>
<%
	Connector con = new Connector();
	Feedback feed = new Feedback();
	String result = "";
	
	try{
	ResultSet rs = con.stmt.executeQuery("SELECT hid FROM TH WHERE hid = '" + request.getParameter("hid") + "'");
	ResultSetMetaData rsmd = rs.getMetaData();
			            	 
	if(rs.isBeforeFirst())
	{
		result = feed.get(con.stmt,request.getParameter("hid"),request.getParameter("score"),request.getParameter("feedback"),(String)session.getAttribute("login"));
		out.println( result + "</br>"+ "<a href=\"AddFeedbackChoice.jsp\">Back</a> </br> <a href=\"MainScreen.jsp\">Main Screen</a>");
	}
	else
	{
		out.println( "That house does not exist." + "</br>"+ "<a href=\"AddFeedbackChoice.jsp\">Back</a> </br> <a href=\"MainScreen.jsp\">Main Screen</a>");		}	
	}catch(Exception e)
	{
		out.println("ERROR </b>");
		out.println(e.getMessage());
	}
	con.closeConnection();
%>

</html>