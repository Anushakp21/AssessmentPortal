<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upload Assignment</title>
<style>
body {
    background-color: #ffcccc;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

.container {
    width: 50%;
    margin: 0 auto;
    padding-top: 50px;
}

form {
    background-color: #ffffff;
    border-radius: 10px;
    padding: 20px;
    text-align: center;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    color: #4caf50;
}

input[type="text"],
input[type="file"],
input[type="submit"] {
    width: calc(100% - 40px);
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

input[type="submit"] {
    background-color: #4caf50;
    color: white;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

</style>
</head>
<body>
<div class="container">
    <form action="upload_assignment_process.jsp" method="post">
        <h1>UPLOAD THE ASSIGNMENT FILE</h1>
        <label for="cid">Course ID:</label>
        <input type="text" name="cid" required><br><br>
        <label for="file">Select File:</label>
        <input type="file" name="file" required><br><br>
        <input type="submit" value="Upload">
    </form>
</div>
</body>
</html>
