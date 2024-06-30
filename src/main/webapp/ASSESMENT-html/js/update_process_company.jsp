<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   String emp_id=(request.getParameter("emp_id"));
   String ph_num=(request.getParameter("ph_num"));
   
   
 try
 {
	 
	   String dbDriver="com.mysql.cj.jdbc.Driver";
		String dbURL="jdbc:mysql://Localhost:3306/company";
		Class.forName(dbDriver);
		Connection con=DriverManager.getConnection(dbURL,"root","");
		
		
		String sql="delete from employee where emp_id=? ";
	
		PreparedStatement ps=con.prepareStatement(sql);

		//ps.setString(1,ph_num);
		ps.setString(1,emp_id);
		
		int i=ps.executeUpdate();
		if(i>0)
		{
			%> 
			<h1><%=i%> record deleted successfully</h1>
			
			<% 
		}
		else
		{
			%> 
			<h1> there is problem in updating the record</h1>
			
			<% 
		}
	   
 }
 catch(Exception e)
 {
	 out.print("can not process"+e);
 }
 
 %>


</body>
</html>