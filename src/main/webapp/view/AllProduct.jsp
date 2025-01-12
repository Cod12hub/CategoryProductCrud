<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

    <title>Product List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            color: #007bff;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #007bff;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        table td a {
            color: #007bff;
            text-decoration: none;
        }

        table td a:hover {
            text-decoration: underline;
        }

        .action-buttons {
            margin-top: 20px;
        }

        .action-buttons a,
        .action-buttons form button {
            padding: 8px 12px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .action-buttons a:hover,
        .action-buttons form button:hover {
            background-color: #0056b3;
        }

        .pagination {
            text-align: center;
            margin-top: 20px;
        }

        .pagination a {
            padding: 8px 12px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin: 0 5px;
        }

        .pagination a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<a href="/api/categories">Category Crud</a>
    <h1>Product List</h1>
    
    <a href="/api/products/newp">Add Product</a> <!-- Link to add a new product -->
    
   
    
    <table>
        <thead>
            <tr>
                <th>Id</th>
                <th>Product Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>
                        <a href="/api/products/${product.id}">View</a> |
                        <a href="/api/products/${product.id}/update">Update</a>
                        <!-- Delete form -->
                        <form action="/api/products/${product.id}" method="POST" style="display:inline;">
                            <input type="hidden" name="_method" value="DELETE" />  <!-- This simulates the DELETE method -->
                        
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <div class="pagination">
        <c:if test="${page > 0}">
            <a href="/api/products?page=${page - 1}">Previous</a>
        </c:if>
        <a href="/api/products?page=${page + 1}">Next</a>
    </div>

</body>
</html>
