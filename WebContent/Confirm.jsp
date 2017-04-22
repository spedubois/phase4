<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="p1.Connector" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
class THDetails {
private String choice;
public THDetails(){}
	
	public ArrayList<String> Confirm(Statement stmt, String i) throws Exception
	{
		String query;
		String resultstr="";
		ResultSet results;
		query = "Select t.* From (Select p.pid, from_date, to_date, cost_per_night From Period p, (Select pid, cost_per_night from Available Where hid = "+choice+") as s "
				+ "WHere p.pid = s.pid) as t where t.pid = " + i;
		try{
			results = stmt.executeQuery(query);
        } catch(Exception e) {
			System.err.println("Unable to execute query:"+query+"\n");
	                System.err.println(e.getMessage());
			throw(e);
		}
		System.out.println("TH:confirmHousing query = "+query+"\n");
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
for(String s:THD.Confirm(conn.stmt, select)){out.println("<p>"+s+"</p>");}
%>
<form action="ResMade.jsp">
Are you sure this is the date you would like?<input type="submit" value="Yes"/>
</form>
<a href="GetTH.jsp">Go Back</a>
</body>

</html>