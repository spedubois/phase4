<% /* This will be the screen where the user will be able to do everything such as reserving a TH 
and adding a new house.*/ %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main</title>
</head>
<h2>Welcome to the Uotel system</h2>
<body>
	<form action="GetTH.jsp">
		<input type = "submit" value="Reserve a house"/>
	</form>
	<form action="AddHouseInput.jsp">
		<input type = "submit" value="Add new house"/>
	</form>
	<form action="ChooseHouseToEdit.jsp">
		<input type = "submit" value="Edit existing house"/>
	</form>
	<form action="StayChoice.jsp">
		<input type = "submit" value="Record a stay/stays at a house/houses TODO"/>
	</form>
	<form action="todo.jsp">
		<input type = "submit" value="Record a favorite house TODO"/>
	</form>
	<form action="AddFeedbackChoice.jsp">
		<input type = "submit" value="Record feedback for a house"/>
	</form>
	<form action="RateFeedbackChoice.jsp">
		<input type = "submit" value="Record usefulness of feedback"/>
	</form>
	<form action="UsefulFeedbackChoice.jsp">
		<input type = "submit" value="Get useful feedbacks"/>
	</form>
	<form action="TrustChoice.jsp">
		<input type = "submit" value="Trust other users"/>
	</form>
	<form action="SearchChoice.jsp">
		<input type = "submit" value="Search for a house"/>
	</form>
	<form action="StatsChoice.jsp">
		<input type = "submit" value="View statistics"/>
	</form>
</body>
</html>