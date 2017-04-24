<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
	<%@page import="cs5530.*" %>
	<%@page import="java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Available housing</title>
<h2>Record Stay</h2>
</head>
<body>
<%
	class SetVisitSQL {
	public SetVisitSQL(){}
	
	public String setVisit(Statement stmt, String login) throws SQLException
	{
		String query;
		String resultstr="";
		ResultSet results;
		query = "Select hid, pid from"+
			"(select login, pid, hid from Reserve where (login, pid, hid) not in (select login, pid, hid from Visit) union all "+
			"select login, pid, hid from Visit where (login, pid, hid) not in (select login, pid, hid from Reserve)) as a "+
			"where login = '"+login+"';";
		try{
			results = stmt.executeQuery(query);
        } catch(Exception e) {
			System.err.println("Unable to execute query:"+query+"\n");
	                System.err.println(e.getMessage());
			throw(e);
		}
		System.out.println("TH:Visit query = "+query+"\n");
		while (results.next()){
			resultstr += results.getString("hid") + "         " + results.getString("pid")+"\n";	
		}
		return "hid: &nbsp;&nbsp;&nbsp;&nbsp; pid:<br>" + resultstr + "<br>";
	}

}
%>
<%
	Connector conn = new Connector();
	SetVisitSQL visit = new SetVisitSQL();
	String result = visit.setVisit(conn.stmt, (String)session.getAttribute("login"));
	
	out.println("<p>" + result + "</p>");
	conn.closeConnection();
%>
	<form action="StaySQL.jsp">
		Select the house(hid):<input type="text" name="hid"/><br>
		Select the period(pid):<input type="text" name="pid"/><br>
		<input type="submit" value="Submit"/>
	</form>
	<a href="MainScreen.jsp">Go Back</a>
</body>
</html>