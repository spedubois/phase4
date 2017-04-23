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
<h2>Statistics</h2>
<body>
	<form action="SearchSQL.jsp">
		Search by:
		</br>
		Price: <input type = "checkbox" name="priceYes" value="price" checked/>
		
		</br>
		And: <input type = "radio" name="priceAndOr" value="and" checked/>
		Or: <input type = "radio" name="priceAndOr" value="or"/>
		</br>
		
		Address :<input type = "checkbox" name="addressYes" value="address"/>
		
		</br>
		And: <input type = "radio" name="addressAndOr" value="and" checked/>
		Or: <input type = "radio" name="addressAndOr" value="or"/>
		</br>
		
		Name: <input type = "checkbox" name="nameYes" value="name"/>
		
		</br>
		And: <input type = "radio" name="nameAndOr" value="and" checked/>
		Or: <input type = "radio" name="nameAndOr" value="or"/>
		</br>
		
		Category: <input type = "checkbox" name="categoryYes" value="category"/>
		
		</br>
		</br>
		Low Price: <input type = "number" name="lowprice" min="0" value="0"/>
		High Price:  <input type = "number" name="highprice" min="1" value="5000"/>
		</br>
		City: <input type = "radio" name="address" value="city" checked/>
		State: <input type = "radio" name="address" value="state"/>
		</br>
		Address search term: 
		<input type = "text" name="addressTerm" value="Address"/>
		</br>
		Name search term: 
		<input type = "text" name="nameTerm" value="Name"/>
		</br>
		Category search term: 
		<input type = "text" name="catTerm" value="Category"/>
		</br>
		</br>
		Sort by:
		</br>
		Price: <input type = "radio" name="sort" value="1" checked/>
		</br>
		Average Feedback: <input type = "radio" name="sort" value="2"/>
		</br>
		Average Feedback from Trusted Users: <input type = "radio" name="sort" value="3"/>
		</br>
		</br>
		<input type = "submit" value="Submit"/>
	</form>
</body>
</html>