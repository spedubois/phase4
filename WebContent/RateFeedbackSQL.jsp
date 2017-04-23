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
	class FeedbackRate {
	public FeedbackRate(){
		
	}
	public String get(Statement stmt,String fid, String rating, String login) throws Exception
	{
		String query;
		int parsedScore;
		try{
			parsedScore = Integer.parseInt(rating);
		}catch (Exception e)
   	 	{
			return "Invalid rating";
   	 	}
		if(parsedScore < 0 || parsedScore > 2)
		{
			return "Invalid rating";
		}
		
		query = ("INSERT INTO Rate (fid, login, rating) VALUES ('" + fid + "', '" + login + "', '" + parsedScore + "')");
			
		try{
			int results = stmt.executeUpdate(query);
	    } catch(Exception e) {
	    	if(e.getMessage().contains("Incorrect integer"))
	        {
	            return "Invalid rating";
	        }else if (e.getMessage().contains("Duplicate entry"))
	        {
	        	return "You have already rated this feedback.";
	        }
	        else
	        {
	    		System.err.println("Unable to execute query:"+query+"\n");
	    	    System.err.println(e.getMessage());
	    		throw(e);
	        }
		}
		return "Rating Added.";
	}

}

%>
</body>
<%
	Connector con = new Connector();
	FeedbackRate rate = new FeedbackRate();
	String result = "";
	
	try{
	ResultSet rs = con.stmt.executeQuery("SELECT login FROM Feedback WHERE fid = '" + request.getParameter("fid") + "'");
	ResultSetMetaData rsmd = rs.getMetaData();
			            	 
	if(rs.isBeforeFirst())
	{
		rs.next();
		if(!(rs.getString("login").toLowerCase() == ((String)session.getAttribute("login")).toLowerCase()))
		{            	 
			result = rate.get(con.stmt,request.getParameter("fid"),request.getParameter("rating"),(String)session.getAttribute("login"));
			out.println( result + "</br>"+ "<a href=\"RateFeedbackChoice.jsp\">Back</a> </br> <a href=\"MainScreen.jsp\">Main Screen</a>");
		}else
		{
			out.println( "You cannot rate your own feedback." + "</br>"+ "<a href=\"RateFeedbackChoice.jsp\">Back</a> </br> <a href=\"MainScreen.jsp\">Main Screen</a>");
		}
	}
	else
	{
		out.println( "That feedback does not exist." + "</br>"+ "<a href=\"RateFeedbackChoice.jsp\">Back</a> </br> <a href=\"MainScreen.jsp\">Main Screen</a>");		}	
	}catch(Exception e)
	{
		out.println("ERROR </b>");
		out.println(e.getMessage());
	}
	con.closeConnection();
%>

</html>