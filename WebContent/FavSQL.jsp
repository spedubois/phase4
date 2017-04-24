<% /* stats */ %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*" %>
	<%@page import="cs5530.*" %>
	<%@page import="java.util.*" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fav</title>
</head>
<body>
<%
	class Favorites {
	public Favorites(){
		
	}
	public String get(Statement stmt,String hid, String login) throws Exception
	{
		String query;
		java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
	
		query = ("INSERT INTO Favorites (hid, login, fvdate) VALUES ('" + hid + "', '" + login + "', '" + sqlDate + "')");
			
		try
		{
			int results = stmt.executeUpdate(query);
	    } 
	    catch(Exception e) 
	    {
	        if(e.getMessage().contains("Duplicate entry"))
	        {
	            return "House already favorited.";
	        }else if(e.getMessage().contains("foreign key"))
	        {
	        	return "House does not exist.";
        	}
	       	else
	       	{
	   			System.err.println("Unable to execute query:"+query+"\n");
	   	        System.err.println(e.getMessage());
	    		throw(e);
	        }
		}
		return "New Favorite Added.";
	}

}
%>
</body>
<%
	Connector con = new Connector();
	Favorites fav = new Favorites();
	String result = fav.get(con.stmt,request.getParameter("hid"),(String)session.getAttribute("login"));

	out.println( result + "</br>"+ "<a href=\"FavChoice.jsp\">Back</a> </br> <a href=\"MainScreen.jsp\">Main Screen</a>");
			
	con.closeConnection();
%>

</html>