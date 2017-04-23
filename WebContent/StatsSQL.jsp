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
	class StatsSQL {
	public StatsSQL(){
		
	}
	public String getMostPopular(Statement stmt, String input) throws Exception
	{
		String query;
		String result = "";
		
		int count;
		try
		{
			count = Integer.parseInt(input);
		}catch (Exception e)
		{
			return "Invalid number";
   	 	}
		
		query = ("SELECT t.category,v.hid, COUNT(v.hid) AS visits FROM Visit v JOIN (SELECT category,hid FROM TH) t ON t.hid=v.hid GROUP BY t.category,v.hid ORDER BY t.category,visits DESC");
			
		try{
				ResultSet rs = stmt.executeQuery(query);
				String category = "";
				int num = count-1;
				
				rs.next();
				category = rs.getString("category");
				result += "category: " + rs.getString("category") + " hid: " + rs.getString("hid") + " Number of visits: " + rs.getString("visits") + "</br>";
				
				while(rs.next())
				{
					if(category.equalsIgnoreCase(rs.getString("category")))
					{
						num--;
					}
					else
					{
						num = count;
					}
					if(num > 0)
					{
						result += "category: " + rs.getString("category") + " hid: " + rs.getString("hid") + " Number of visits: " + rs.getString("visits") + "</br>";
					}
					category = rs.getString("category");
				}
	    } catch(Exception e) 
		{
	        System.err.println("Unable to execute query:"+query+"</br>");
	    	System.err.println(e.getMessage());
	    	throw(e);
		}
		return result;
	}
	
	public String getMostExpensive(Statement stmt, String input) throws Exception
	{
		String query;
		String result = "";
		
		int count;
		try
		{
			count = Integer.parseInt(input);
		}catch (Exception e)
		{
			return "Invalid number";
   	 	}
		
		query = ("SELECT t.category,v.hid, AVG(cost) AS avgCost FROM Visit v JOIN (SELECT category,hid FROM TH) t ON t.hid=v.hid GROUP BY t.category,v.hid ORDER BY t.category,avgCost DESC");
			
		try{
				ResultSet rs = stmt.executeQuery(query);
				String category;
				int num = count;
				
				rs.next();
				category = rs.getString("category");
				result += "category: " + rs.getString("category") + " hid: " + rs.getString("hid") + " Average cost: " + rs.getString("avgCost") + "</br>";
				
				while(rs.next())
				{
					if(category.equalsIgnoreCase(rs.getString("category")))
					{
						num--;
					}
					else
					{
						num = count;
					}
					if(num > 0)
					{
						result += "category: " + rs.getString("category") + " hid: " + rs.getString("hid") + " Average cost: " + rs.getString("avgCost") + "</br>";
					}
					category = rs.getString("category");
				}
	    } catch(Exception e) 
		{
	        System.err.println("Unable to execute query:"+query+"</br>");
	    	System.err.println(e.getMessage());
	    	throw(e);
		}
		return result;
	}
	
	public String getHighestRated(Statement stmt, String input) throws Exception
	{
		String query;
		String result = "";
		
		int count;
		try
		{
			count = Integer.parseInt(input);
		}catch (Exception e)
		{
			return "Invalid number";
   	 	}
		
		query = ("SELECT t.category,f.hid, AVG(score) AS avgScore FROM Feedback f JOIN (SELECT category,hid FROM TH) t ON t.hid=f.hid GROUP BY t.category,f.hid ORDER BY t.category,avgScore DESC");
			
		try{
				ResultSet rs = stmt.executeQuery(query);
				String category;
				int num = count;
				
				rs.next();
				category = rs.getString("category");
				result += "category: " + rs.getString("category") + " hid: " + rs.getString("hid") + " Average feedback score: " + rs.getString("avgScore") + "</br>";
				
				while(rs.next())
				{
					if(category.equalsIgnoreCase(rs.getString("category")))
					{
						num--;
					}
					else
					{
						num = count;
					}
					if(num > 0)
					{
						result += "category: " + rs.getString("category") + " hid: " + rs.getString("hid") + " Average feedback score: " + rs.getString("avgScore" + "") + "</br>";
					}
					category = rs.getString("category");
				}
	    } catch(Exception e) 
		{
	        System.err.println("Unable to execute query:"+query+"\n");
	    	System.err.println(e.getMessage());
	    	throw(e);
		}
		return result;
	}

}
%>
</body>
<%
	Connector con = new Connector();
	StatsSQL stats = new StatsSQL();
	String result = "";
	
	if(((String)request.getParameter("stats")).contains("popular"))
	{
		result += stats.getMostPopular(con.stmt,(String)request.getParameter("limit"));
	}
	else if(((String)request.getParameter("stats")).contains("rating"))
	{
		result += stats.getHighestRated(con.stmt,(String)request.getParameter("limit"));
	}
	else if(((String)request.getParameter("stats")).contains("expensive"))
	{
		result += stats.getMostExpensive(con.stmt,(String)request.getParameter("limit"));
	}

	out.println( result + "</br>"+ "<a href=\"StatsChoice.jsp\">Back</a> </br> <a href=\"MainScreen.jsp\">Main Screen</a>");
			
	con.closeConnection();
%>

</html>