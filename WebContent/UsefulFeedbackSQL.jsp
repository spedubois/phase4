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
<title>Statistics</title>
</head>
<body>
<%
class Useful 
{
	public Useful(){
		
	}
	public String get(Statement stmt,String hid, String count) throws Exception
	{
		String query;
		String results = "";
		
		query = ("select * from Feedback f , ( select Rate.fid,AVG(rating) as aR from Rate, Feedback where Rate.fid = Feedback.fid GROUP BY Rate.fid) aF where f.fid = aF.fid and f.hid = '" + hid + "' order by aF.aR DESC");
			
		try{
			ResultSet rs = stmt.executeQuery(query);
			int num = Integer.parseInt(count);
			while(rs.next() && num > 0)
			{
				results += "fid: " + rs.getString("fid") + " Average: " + rs.getString("aR") + " Feedback: " + rs.getString("text") + "</br>";
				num--;
			}
	    } catch(NumberFormatException e)
		{
	    	return "Invalid Feedback amount.";
		}
		catch(Exception e) 
		{
			System.err.println("Unable to execute query:"+query+"\n");
    	    System.err.println(e.getMessage());
    		throw(e);
		}
		if(results == "")
		{
			return "No Feedback ratings for that house.";
		}
		return results;
	}

}
%>
</body>
<%
	Connector con = new Connector();
	Useful use = new Useful();
	String result = use.get(con.stmt,request.getParameter("hid"),request.getParameter("num"));

	out.println( result + "</br>"+ "<a href=\"UsefulFeedbackChoice.jsp\">Back</a> </br> <a href=\"MainScreen.jsp\">Main Screen</a>");
			
	con.closeConnection();
%>

</html>