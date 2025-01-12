<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Create Category</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .form-container {
            margin-bottom: 20px;
        }
        .form-container input, .form-container button {
            padding: 8px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <h1>Create New Category</h1>

    <!-- Form for creating a new category -->
    <div class="form-container">
        <form action="/api/categories" method="post">
            <input type="text" name="name" id="name" placeholder="Enter category name" required>
            <button type="submit">Create Category</button>
        </form>
    </div>
</body>
</html>
