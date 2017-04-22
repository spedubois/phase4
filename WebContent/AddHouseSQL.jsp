<% /* User adds a new house*/ %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="p1.Connector" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add House</title>
</head>
<body>
<%
	class AddHouseSQL {
	public AddHouseSQL(){
		
	}
	public String addNew(Statement stmt, String category, String address, String url, String tele, String built, String city, String state) throws Exception
	{
		String query;
		query = "insert into TH (category, address, URL, telephone_number, built, city, state)"
				+ "values ('"+category+"', '"+address+"', '"+url+"', '"+tele+"', '"+built+"', '"+city+"' ,'"+state+"')";
		try{
			stmt.executeUpdate(query);
        } catch(Exception e) {
			System.err.println("Unable to execute query:"+query+"\n");
	                System.err.println(e.getMessage());
			throw(e);
		}
		
		return "New house added.";
	}

}
%>
</body>
<%
	Connector con = new Connector();
	AddHouseSQL addHouse = new AddHouseSQL();
	String res = addHouse.addNew(con.stmt, request.getParameter("category"), request.getParameter("address")
			, request.getParameter("url"), request.getParameter("phone"), request.getParameter("year")
			, request.getParameter("city"), request.getParameter("state"));
	
			out.println("You have added a new house.\n"+
			"<a href=\"MainScreen.jsp\">Continue</a>");
			
			con.closeConnection();
			%>

</html>