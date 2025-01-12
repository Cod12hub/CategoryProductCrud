<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Add New Product</title>
</head>
<body>
    <h1>Add New Product</h1>
    
    <!-- Form to add a new product -->
    <form action="/api/products" method="POST">
        <div>
            <label for="name">Product Name:</label>
            <input type="text" name="name" required>
        </div>
        <div>
        <label for="category">Category:</label>
        <select name="category_id">
            <c:forEach var="category" items="${categories}">
                <option value="${category.id}">${category.name}</option>
            </c:forEach>
        </select>
    </div>
        
        
        <button type="submit">Add Product</button>
    </form>
    
    <!-- Back link to the product list page -->
    <a href="/api/products">Back to Product List</a>
</body>
</html>
