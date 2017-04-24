<% /* stay */ %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*" %>
	<%@page import="cs5530.*" %>
	<%@page import="java.util.*" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stay</title>
</head>
<body>
<%
class VisitSQL 
{
	public VisitSQL()
	{
	}
	
	public void addVisit(Statement stmt, String login, String hid, String pid) throws Exception
	{
		String query;
		query = "insert into Visit(login, hid, pid) values('"+login+"', '"+hid+"', '"+pid+"')";
		try{
			stmt.executeUpdate(query);
        } catch(Exception e) {
			System.err.println("Unable to execute query:"+query+"\n");
	                System.err.println(e.getMessage());
			throw(e);
		}
		System.out.println("You have successfully added your visit!\n");
	}

}
%>
</body>
<%
	Connector con = new Connector();
	VisitSQL visit = new VisitSQL();
	String result = visit.addVisit(con.stmt,(String)session.getAttribute("login"),request.getParameter("hid"),request.getParameter("pid"));

	out.println( result + "</br>"+ "<a href=\"StayChoice.jsp\">Back</a> </br> <a href=\"MainScreen.jsp\">Main Screen</a>");
			
	con.closeConnection();
%>

</html>