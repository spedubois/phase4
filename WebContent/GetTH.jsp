<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="p1.Connector" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Available housing</title>
<h2>Available Housing</h2>
</head>
<body>
<%
	class GetTH {
	public GetTH(){}
	
	public ArrayList<String> get(Statement stmt) throws Exception
	{
		String query;
		ArrayList<String> result = new ArrayList<String>();
		String resultstr="";
		ResultSet results;
		query="Select * from TH";
		try{
			results = stmt.executeQuery(query);
        } catch(Exception e) {
			System.err.println("Unable to execute query:"+query+"\n");
	                System.err.println(e.getMessage());
			throw(e);
		}
		System.out.println("TH:getHousing query = "+query+"\n");
		while (results.next()){
			result.add("<b>HID: </b>"+results.getString("hid") + " " + "<b>CATEGORY: </b>"+results.getString("category") + " " + "<b>ADDRESS: </b>"+results.getString("address") + 
					" " + "<b>CITY: </b>"+results.getString("city") + " " + "<b>STATE: </b>"+results.getString("state") + " " + "<b>URL: </b>"+ results.getString("URL") + " " + "<b>PHONE #: </b>"+results.getString("telephone_number") + 
					" " + "<b>BUILT: </b>"+results.getString("built") + "\n\n");	
		}
		
		return result;
	}
}
Connector conn = new Connector();
%>
<%
	GetTH getSQL = new GetTH();
for(String s:getSQL.get(conn.stmt)){out.println("<p>"+s+"</p>");
conn.closeConnection();
}
%>
<form action="ReserveTH.jsp">
	Which house would you like?:<input type="text" name="selection"/>
	<input type="submit" value="Submit"/>
</form>
<a href="MainScreen.jsp">Go Back</a>
</body>
</html>