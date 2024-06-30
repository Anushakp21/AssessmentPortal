<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>File ID Example</title>
</head>
<body>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Establish a database connection (configure your database connection details)
        String jdbcUrl = "jdbc:mysql://localhost:3306/assessment_portal";
        String dbUser = "root";
        String dbPassword = "";
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        // Define the file name for which you want to retrieve the file ID
        String fileName = "Intership Letter-2020-21.gk.pdf";

        // Create a SQL query to retrieve the file ID based on the file name
        String query = "SELECT file_id FROM assignment WHERE assignmnet_file = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, fileName);

        // Execute the query
        rs = pstmt.executeQuery();

        if (rs.next()) {
            int fileId = rs.getInt("file_id");
            out.println("File ID for " + fileName + ": " + fileId);
        } else {
            out.println("File not found in the database.");
        }
    } catch (SQLException e) {
        out.println("Error: " + e.getMessage());
    } finally {
        // Close database resources
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>  
</body>
</html>
