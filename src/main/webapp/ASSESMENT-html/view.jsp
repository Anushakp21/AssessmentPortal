<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Image Display</title>
<style>
body
{
	background-color:skyblue;
}
table{
		border-collapse: collapse;
		border: 3px solid black;
		width: 50%;
	}

</style>
</head>
<body>

<%
try {
    String dbDriver = "com.mysql.cj.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/assessment_portal";
    Class.forName(dbDriver);
    Connection con = DriverManager.getConnection(dbURL, "root", "");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from register");

    // Display candidate details
    out.println("<h1 style='color:green'> uploaded files </h1>");
    out.println("<table border='1'>");
    out.println("<tr><th>cid</th><th>name</th><th>a_doc</th></tr>");

    while (rs.next()) {
        int cid = rs.getInt(1);
        String name = rs.getString(2);
        Blob imageBlob = rs.getBlob(3);

        // Convert Blob to byte array
        byte[] imageData = imageBlob.getBytes(1, (int) imageBlob.length());

        // Convert byte array to Base64 encoded string (for inline display)
        String base64Image = java.util.Base64.getEncoder().encodeToString(imageData);

        // Display candidate details with image
        out.println("<tr><td>" + cid + "</td><td>" + name + "</td><td><img src='data:image/png;base64," + base64Image + "'/></td></tr>");
    }

    out.println("</table>");
    con.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

</body>
</html>
