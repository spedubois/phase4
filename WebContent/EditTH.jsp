<% /* User edits a house*/ %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="p1.Connector" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit House</title>
</head>
<body>
<%
	class EditTHSQL {
	public EditTHSQL(){
		
	}
	public void update(Statement stmt, String category, String address, String url, String tele, String built, String hid, String city, String state) throws Exception
	{
		String query;
		query = "update TH set category='"+category+"', address='"+address+"', URL='"
				+url+"' , telephone_number='"+tele+"' , built='"+built+"', city='"+city+"', state='"+state+"' where hid ="+hid;
		try{
			stmt.executeUpdate(query);
        } catch(Exception e) {
			System.err.println("Unable to execute query:"+query+"\n");
	                System.err.println(e.getMessage());
			throw(e);
		}
		System.out.println("You have sucessfully updated your house!\n");
	}

}
%>
</body>
<%
	Connector con = new Connector();
	EditTHSQL editHouse = new EditTHSQL();
	editHouse.update(con.stmt, request.getParameter("category"), request.getParameter("address")
			, request.getParameter("url"), request.getParameter("phone"), request.getParameter("year")
			, request.getParameter("hid"), request.getParameter("city"), request.getParameter("state"));
			
			out.println("You have edited the house.\n"+
			"<a href=\"MainScreen.jsp\">Continue</a>");
			
			con.closeConnection();
			%>

</html>