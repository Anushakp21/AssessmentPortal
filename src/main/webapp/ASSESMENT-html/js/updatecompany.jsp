<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body{
background-color:yellow;
}
</style>
</head>
<body>
<%
  String emp_id=(request.getParameter("emp_id"));
  out.print("emp_id is:"+emp_id);
  try
 {
	 
	 String dbDriver="com.mysql.cj.jdbc.Driver";
		String dbURL="jdbc:mysql://Localhost:3306/company";
		Class.forName(dbDriver);
		Connection con=DriverManager.getConnection(dbURL,"root","");
		Statement stmt=con.createStatement();
		String sql="select * from employee where emp_id="+emp_id;
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next())
		{
			%>
			<h1>Update data</h1>
			<form method="post" action="update_process_company.jsp">
			EMP_ID:<br>
			<input type="text" name="emp_id" value="<%=rs.getString("emp_id") %>">
			<br>
			F_NAME:<br>
			<input type="text" name="f_name" value="<%=rs.getString("f_name") %>">
			<br>
			I_NAME:<br>
			<input type="text" name="i_name" value="<%=rs.getString("i_name") %>">
			<br>
			J_GRADE:<br>
			<input type="text" name="j_grade" value="<%=rs.getString("j_grade") %>">
			<br>
			DEPT_ID:<br>
			<input type="text" name="dept_d" value="<%=rs.getInt("dept_id") %>">
			<br>
			SALARY:<br>
			<input type="text" name="salary" value="<%=rs.getString("salary") %>">
			<br>
			DEPT_NAME:<br>
			<input type="text" name="dept_name" value="<%=rs.getString("dept_name") %>">
			<br>
			PH_NUM:<br>
			<input type="text" name="ph_num" value="<%=rs.getString("ph_num") %>">
			<br>
			<input type="submit"  value="UPDATE">
			
			</form>
		}
		<%
 }
 con.close();
 }
 catch(Exception e)
 {
	 e.printStackTrace();
 }
%>

</body>
</html>