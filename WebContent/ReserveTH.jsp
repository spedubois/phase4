<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="p1.Connector" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Dates</title>
<h2>Available Dates</h2>
</head>
<body>
<%
class THDetails {
private String choice;
public THDetails(){}
	
	public ArrayList<String> get(Statement stmt, String i) throws Exception
	{
		choice = i;
		String query;
		String resultstr="";
		ResultSet results;
		ArrayList<String> result = new ArrayList<String>();
		query="Select t.pid, t.from_date, t.to_date, a.cost_per_night from Available a,"
				+ "(Select p.pid, s.hid, p.from_date, p.to_date from Period p, "
				+ "(select pid, hid from Available where (pid, hid) not in (select pid, hid from Reserve) union all "
				+ "select pid, hid from Reserve where (pid, hid) not in (select pid, hid from Available)) as s "
				+ "where hid = "+i+" and p.pid = s.pid) as t "
				+ "where a.hid = t.hid and a.pid = t.pid;";
		try{
			results = stmt.executeQuery(query);
        } catch(Exception e) {
			System.err.println("Unable to execute query:"+query+"\n");
	                System.err.println(e.getMessage());
			throw(e);
		}
		System.out.println("TH:getHousing query = "+query+"\n");
		while (results.next()){
			result.add(results.getString("pid") + "      " + results.getString("from_date") + "      " + results.getString("to_date") + 
					"      " + results.getString("cost_per_night") + "\n");	
		}
		
		return result;
	}
}
Connector conn = new Connector();
%>
<%
THDetails THD = new THDetails();
String select = ""+request.getParameter("selection");
for(String s:THD.get(conn.stmt, select)){out.println("<p>"+s+"</p>");}
%>
</body>
<form action="Confirm.jsp">
Which date would you like?: <input type="text" name="selection"/>
<input type="submit" value="Submit"/>
</form>


<a href="GetTH.jsp">Go Back</a>
</html>