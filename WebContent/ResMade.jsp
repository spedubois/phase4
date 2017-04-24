<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="cs5530.Connector" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Object login = session.getAttribute((String)"login");
Object choice = session.getAttribute((String)"choice");
Object choice1 = session.getAttribute((String)"choice1");
Connector con = new Connector();
String query = "Insert into Reserve(login, hid, pid)"
		 +" values('"+login+"', "+choice+", "+choice1+");";
con.stmt.executeUpdate(query);
ArrayList<String> result = new ArrayList<String>();
query = "select t.hid, t.category from TH t, "
		+ "(select distinct hid from Reserve r, (select login from Reserve where hid = "+choice+" and login != '"+login+"') as a "
		+ "where r.login = a.login and r.hid != 1) as b where t.hid = b.hid;";
		ResultSet results = con.stmt.executeQuery(query);
		while(results.next())
		{	
			result.add("<b>HID: </b>"+results.getString("hid") + "     " + "<b>CATEGORY: </b>"+results.getString("category")+"\n");
		}
out.println("You have reserved the house!<br />Here are some suggested houses for you.<br /><br/>");
		for(String s:result)
		{
			out.println(s+"<br/>");
		}
		out.println("<a href=\"MainScreen.jsp\">Continue</a>");
%>
</body>
</html>