<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Category List</title>
    <style>
    
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
         .button {
            padding: 5px 10px;
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            margin-right: 10px; 
        }
        .button:hover {
            background-color: #45a049;
        }
        form, a {
            display: inline-block;
        }
    
    </style>
</head>
<body>
<a href="/api/products">Product Crud</a>
<h2>Get Category by ID</h2>
<form action="/api/categories/{id}" method="get">
    <input type="number" name="id" placeholder="Category ID" required>
    <button type="submit">Get Category</button>
</form>
 <c:if test="${not empty category}">
        <h2>Category Details</h2>
        <h2><strong>Category ID:</strong> ${category.id}</h2>
        <h2><strong>Category Name:</strong> ${category.name}</h2>
    </c:if>
    
     <c:if test="${not empty categories}">
    
    <h1>Category List</h1>
        <a href="/api/categories/new">Add Category</a>
    
     <table>
        <thead>
            <tr>
                <th>Id</th>
                <th>Category Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="category" items="${categories}">
                <tr>  
                    <td>${category.id}</td>
                    <td>${category.name}</td>
                    <td>
                            <a href="/api/categories/${category.id}/update" class="button">Update</a>
                            
<form action="/api/categories/${category.id}" method="POST" onsubmit="return confirm('Are you sure you want to delete this category?')">
    <!-- Hidden field to simulate DELETE method -->
    <input type="hidden" name="_method" value="DELETE" />
    <button type="submit" class="button">Delete</button>
</form>
                          
                        </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    </c:if>
</body>
</html>
