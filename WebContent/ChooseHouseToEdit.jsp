<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="p1.Connector" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your housing</title>
<h2>Your Housing</h2>
</head>
<body>
<%
	class EditHouseList {
	public EditHouseList(){}
	
	public ArrayList<String> getList(Statement stmt, String login) throws Exception
	{
		ArrayList<String> result = new ArrayList<String>();
		String query;
		String resultstr="";
		ResultSet results;
		query = "Select * from TH t, (select hid from Lists where login = '"+login+"') as a "
				+"Where t.hid = a.hid";
		try{
			results = stmt.executeQuery(query);
        } catch(Exception e) {
			System.err.println("Unable to execute query:"+query+"\n");
	                System.err.println(e.getMessage());
			throw(e);
		}
		System.out.println("TH:getHousing query = "+query+"\n");
		while (results.next()){
			result.add(""+ results.getString("hid")+ " "+results.getString("category") + " "
		+ results.getString("address"));	
		}
		
		return result;
	}
}
Connector conn = new Connector();
%>
<%
	EditHouseList editList = new EditHouseList();
for(String s:editList.getList(conn.stmt, (String)session.getAttribute("login")))
{
	out.println(s+"<br/>");
}

conn.closeConnection();

%>
<br/>
<br/>
<form action="EditTH.jsp">
	Which house would you like to edit? (hid)<input type="text" name="hid"/><br/>
	Enter the house's new category:<input type="text" name="category"/><br>
	Enter the house's new url:<input type="text" name="url"/><br>
	Enter the house's new phone number:<input type="text" name="phone"/><br>
	Enter the new year built:<input type="text" name="year"/><br>
	Enter the house's new city:<input type="text" name="city"/><br>
	Enter the house's new state:<input type="text" name="state"/><br>
	Enter the house's new address:<input type="text" name="address"/><br>
	Submit your information:<input type = "submit" value="Submit"/>
</form>
<a href="MainScreen.jsp">Go Back</a>
</body>
</html>