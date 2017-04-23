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
<title>Search</title>
</head>
<body>
<%
	class THSearching {
	public THSearching(){
		
	}
	public String get(Statement stmt,
			String price,String priceAndOr,int lowPrice,int highPrice,
			String address,String addressAndOr,String cityOrState,String addressSearchTerm,
			String houseName,String nameAndOr,String nameSearchTerm,
			String category,String categorySearchTerm,
			String sortedBy, String login) throws Exception
	{
		String query;
		String result = "";
		
		if(houseName.equalsIgnoreCase("yes"))
   	 	{
			query = "SELECT * FROM TH JOIN (SELECT word, hid FROM Keywords k JOIN HasKeywords hk ON k.wid = hk.wid) k ON TH.hid = k.hid WHERE";
   	 	}else
   	 	{
   			query = "SELECT * FROM TH WHERE";
   	 	}
		
		if(sortedBy.equals("3"))
   	 	{
			query = "SELECT * FROM TH JOIN (SELECT f.hid, AVG(score) AS avgScore FROM Feedback f JOIN (SELECT login2 FROM Trust WHERE login1 = '" 
					+ login + "')k ON k.login2=login GROUP BY f.hid) l ON TH.hid=l.hid WHERE";
   	 	}
		
		
		if(price.equalsIgnoreCase("yes"))
   	 	{
			query += " cost > " + (lowPrice-1) + " AND cost < " + (highPrice+1);
   		 
   		 	if(address.equalsIgnoreCase("yes") || houseName.equalsIgnoreCase("yes") || category.equalsIgnoreCase("yes"))
   		 	{
   		 		query += " " + priceAndOr;
   		 	}
   	 	}
   	 
   	 	if(address.equalsIgnoreCase("yes"))
   	 	{
   	 		query += " " + cityOrState + " = '" + addressSearchTerm + "'";
   		 
   	 		if(houseName.equalsIgnoreCase("yes") || category.equalsIgnoreCase("yes"))
   	 		{
   	 			query += " " + addressAndOr;
   	 		}
   	 	}
   	 
   	 	if(houseName.equalsIgnoreCase("yes"))
   	 	{
   	 		query += " word = '" + nameSearchTerm + "'";
   		 
   	 		if(category.equalsIgnoreCase("yes"))
   	 		{
   	 			query += " " + nameAndOr;
   	 		}
   	 	}
   	 
   	 	if(category.equalsIgnoreCase("yes"))
   	 	{
   	 		query += " category = '" + categorySearchTerm + "'";
   	 	}
   	 	
   	 	if(sortedBy.equals("1"))
   	 	{
   	 		query += " ORDER BY cost DESC";
   	 	}else if(sortedBy.equals("2"))
   	 	{
   	 		query += " JOIN (SELECT f.hid, AVG(score) AS avgScore FROM Feedback f GROUP BY f.hid ORDER BY avgScore DESC) k ON k.hid=f.hid ORDER BY avgScore DESC";
   	 	}else if(sortedBy.equals("3"))
   	 	{
   	 		query += " ORDER BY avgScore DESC";
   	 	}
		
		//query = ("SELECT * FROM TH JOIN (SELECT category,hid FROM TH) t ON t.hid=v.hid GROUP BY t.category,v.hid ORDER BY t.category,visits DESC");
			
		try{
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next())
				{
					result += "hid: " + rs.getString("hid") + " Category: " + rs.getString("category") + " Address: " + rs.getString("address") + " City: " 
				+ rs.getString("city") + " State: " + rs.getString("state") + " URL: " + rs.getString("URL") + " Phone #: " + rs.getString("telephone_number") + 
				" Date built: " + rs.getString("built") + " Cost per person: " + rs.getString("cost") + "</br>";
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
	String address = "";
	String cityOrState = "";
	String price = "";
	String priceAndOr = "";
	String addressAndOr = "";
	String nameAndOr = "";
	String houseName = "";
	String category = "";
	int lowPrice = 0;
	int highPrice = 0;
	String nameSearchTerm = "";
	String addressSearchTerm = "";
	String categorySearchTerm = "";
	
	if(request.getParameter("priceYes") != null)
	{
		price = "yes";
		lowPrice = Integer.parseInt(request.getParameter("lowprice"));
		highPrice = Integer.parseInt(request.getParameter("highprice"));
		
		priceAndOr = request.getParameter("priceAndOr");
		
	}
	
	if(request.getParameter("addressYes") != null)
	{
		address = "yes";
		cityOrState = request.getParameter("address");
		addressSearchTerm = request.getParameter("addressTerm");
		
		addressAndOr = request.getParameter("addressAndOr");
	}
	
	if(request.getParameter("nameYes") != null)
	{
		houseName = "yes";
		nameSearchTerm = request.getParameter("nameTerm");
		
		nameAndOr = request.getParameter("nameAndOr");
	}
	
	if(request.getParameter("categoryYes") != null)
	{
		category = "yes";
		categorySearchTerm = request.getParameter("catTerm");
	}
	
	String searchInput = "You have entered:";
	if(price.equals("yes"))
	{
		searchInput += " price: " + lowPrice + " to " + highPrice;
		if(request.getParameter("addressYes") != null || request.getParameter("nameYes") != null || request.getParameter("categoryYes") != null)
		{
			searchInput += " " + priceAndOr;
		}
	}
	
	if(address.equalsIgnoreCase("yes"))
	{
		searchInput += " " + cityOrState + ": " + addressSearchTerm;
		if(request.getParameter("nameYes") != null || request.getParameter("categoryYes") != null)
		{
			searchInput += " " + addressAndOr;
		}
	}
	
	if(houseName.equalsIgnoreCase("yes"))
	{
		searchInput += " name: " + nameSearchTerm;
		if(request.getParameter("categoryYes") != null)
		{
			searchInput += " " + nameAndOr;
		}
	}
	
	if(category.equalsIgnoreCase("yes"))
	{
		searchInput += " category: " + categorySearchTerm;
	}
	
	if(searchInput.equals("You have entered:"))
	{
		out.println( "No search by selected." + "</br>"+ "<a href=\"SearchChoice.jsp\">Back</a> </br> <a href=\"MainScreen.jsp\">Main Screen</a>");
	}
	
	String userInput = request.getParameter("sort");
	
	THSearching search = new THSearching();
	String result = search.get(con.stmt,price,priceAndOr,lowPrice,highPrice,
			            		address,addressAndOr,cityOrState,addressSearchTerm,
			            		houseName,nameAndOr,nameSearchTerm,
			            		category,categorySearchTerm,userInput,(String)session.getAttribute("login"));

	out.println( searchInput + "</br>");
	out.println( result + "</br>"+ "<a href=\"SearchChoice.jsp\">Back</a> </br> <a href=\"MainScreen.jsp\">Main Screen</a>");
			
	con.closeConnection();
%>

</html>