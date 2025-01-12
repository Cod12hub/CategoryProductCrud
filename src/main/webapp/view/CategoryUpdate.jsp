<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

    <title>Update Category</title>
</head>
<body>
    <h1>Update Category</h1>
    
    <form action="/api/categories/${category.id}" method="POST">
    <input type="hidden" name="_method" value="PUT" />
    
        <label for="name">Category Name:</label>
        
        <input type="text" name="name" id="name" value="${category.name}" required>
        <button type="submit">Update</button>
    </form>

    <br>
    <a href="/api/categories">Back to Category List</a>
</body>
</html>
