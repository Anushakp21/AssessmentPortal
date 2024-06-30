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
try
{ 

	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	String mobile=request.getParameter("mobile");
	String gender=request.getParameter("gender");
	String course=request.getParameter("course");
	String dob=request.getParameter("Date");
	int aid =Integer.parseInt(request.getParameter("adrid"));
	String address=request.getParameter("address");
	
	
	
	
	String URL="jdbc:mysql://localhost:3306/assessment_portal";
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con=DriverManager.getConnection(URL,"root","");
	%>
	<font size="+3" color="green"></b>
	<%
	out.print("Succesfully connected");
	
	PreparedStatement ps=con.prepareStatement("insert into register(name,email,password,mobile,gender,course,dob,aid,address) value(?,?,?,?,?,?,?,?,?)");

	ps.setString(1,name);
	ps.setString(2,email);
	ps.setString(3,password);
	ps.setString(4,mobile);
	ps.setString(5,gender);
	ps.setString(6,course);
	ps.setString(7,dob);
	ps.setInt(8,aid);
	ps.setString(9,address);
	
	ps.executeUpdate();
	 
	out.print("data inserted successfully");
    
	con.close();
	String redirectURL = "http://localhost:8081/ASSESMENT_PORTAL/ASSESMENT-html/std_login.html";
    response.sendRedirect(redirectURL);

	
	
	
	
}
catch(Exception e)
{%>
</font>
<font size="+4" color="red"></b>
<%
out.print("can not process:"+e);
}
%>
</font>



</body>
</html>