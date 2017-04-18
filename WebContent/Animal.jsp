<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@ page import="p1.Animal" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Animal</title>
</head>
<% Animal newAnimal = new Animal("Meowzers", "Cat", "Tuna" ); %>
<body>
	<h1>Animal</h1>
	<p>Hello! My name is <%= newAnimal.name %> and I am a <%= newAnimal.species %>! 
		My favorite food is <%= newAnimal.food %>! </p>
</body>
</html>