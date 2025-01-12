<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

    <title>Product Details</title>
    <style>
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

        .action-buttons {
            margin-top: 20px;
        }

        .action-buttons a,
        .action-buttons form button {
            padding: 10px 15px;
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

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: #007bff;
            text-decoration: none;
            font-size: 1.1em;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <h1>Product Details</h1>

    <!-- Product Table -->
    <table>
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Product Category</th>
            <th>Action</th>
        </tr>
        <tr>
            <!-- Display Product Details -->
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.category.name}</td>
            <td>
                <a href="/api/products/${product.id}/update">Update</a> |
                <form action="/api/products/${product.id}/delete" method="POST" style="display:inline;">
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
    </table>

    <!-- Back Link -->
    <div class="back-link">
        <a href="/api/products">Back to Product List</a>
    </div>

</body>
</html>
