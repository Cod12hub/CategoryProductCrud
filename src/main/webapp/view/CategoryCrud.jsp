<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

    <title>Category Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .form-container {
            margin: 20px 0;
        }
        .form-container input, .form-container button {
            margin-right: 10px;
            padding: 8px;
        }
        .form-container button {
            cursor: pointer;
        }
    </style>
</head>
<body>
<h1>Category Management</h1>

<!-- Add New Category -->
<h2>Add Category</h2>
<form action="/api/categories" method="post">
    <input type="text" name="name" placeholder="Category Name" required>
    <button type="submit">Add Category</button>
</form>

<!-- Update Category -->
<h2>Update Category</h2>
<form action="/api/categories/update" method="post">
    <input type="number" name="id" placeholder="Category ID" required>
    <input type="text" name="name" placeholder="New Category Name">
    <button type="submit">Update Category</button>
</form>

<!-- Delete Category -->
<h2>Delete Category</h2>
<form action="/api/categories/${category.id}" method="post" onsubmit="return confirm('Are you sure you want to delete this category?')">>
   
    <input type="number" name="id" placeholder="Category ID" required>
    <button type="submit">Delete Category</button>
</form>

<!-- Get Category by ID -->
<h2>Get Category by ID</h2>
<form action="/api/categories/{id}" method="get">
    <input type="number" name="id" placeholder="Category ID" required>
    <button type="submit">Get Category</button>
</form>

<!-- Display Categories -->
<h2>All Categories</h2>
 <c:if test="${not empty category}">
        <h2>Category Details</h2>
        <p><strong>Category ID:</strong> ${category.id}</p>
        <p><strong>Category Name:</strong> ${category.name}</p>
    </c:if>
    
<!-- Display Categories -->
<h2>All Categories</h2>
<c:if test="${not empty categories}">
<c:if test="${not empty category}">
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="category" items="${categories}">
            
                <tr>
                    <td>${category.id}</td>
                    <td>${category.name}</td>
                    <td><a href="/api/categories/${category.id}/update">Update</a></td>
                    <td><a href="/api/categories/${category.id}" onclick="return confirm('Are you sure?')">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>
</c:if>
</body></html>
