<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
<style>
body {
    background-color: #87CEEB;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

.container {
    width: 50%;
    margin: 0 auto;
    padding-top: 50px;
    text-align: center;
}

form {
    background-color: #ffffff;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    color: #4caf50;
    margin-bottom: 30px;
}

a {
    color: #4caf50;
    text-decoration: none;
    font-weight: bold;
    font-size: 18px;
    margin-top: 20px;
    display: block;
}

a:hover {
    text-decoration: underline;
}

</style>
</head>
<body>
<div class="container">
<%
try {
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    
    String URL="jdbc:mysql://localhost:3306/assessment_portal";
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    Connection con=DriverManager.getConnection(URL,"root","");
    %>
    <font size="+3" color="green"></b>
    <%

    PreparedStatement stmt = con.prepareStatement("SELECT * FROM register WHERE email=? AND password=?");
    stmt.setString(1, email);
    stmt.setString(2, password);
    ResultSet rs = stmt.executeQuery();
    out.print("Successfully logged in");
    %>
    <form action="" >
    <a href="upload_assignment.jsp">Click here for uploading the Assignment File</a><br><br>
    <a href="upload_project.jsp">Click here for uploading the Project File</a>
    
    </form>
    <% 
    rs.close();
    con.close();    
}
catch(Exception e)
{
%>
</font>
<font size="+4" color="red"></b>
<%
out.print("Unable to connect to the database: "+e);
}
%>
</div>
</body>
</html>
