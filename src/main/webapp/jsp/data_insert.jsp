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
	//int cid =Integer.parseInt(request.getParameter("cid"));
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	String mobile=request.getParameter("mobile");
	String gender=request.getParameter("gender");
	String course=request.getParameter("course");
	String dob=request.getParameter("Date");
	int aid =Integer.parseInt(request.getParameter("adrid"));
	String address=request.getParameter("address");
	
	out.print("date:"+dob);
	
	
	
	
	
	String URL="jdbc:mysql://localhost:3306/ca";
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
	// String redirectURL = "http://localhost:8081/ASSESMENT_PORTAL/romofyi-html/fashion.html";
	//    response.sendRedirect(redirectURL);
	   
	con.close();
	
	
	
	
}
catch(Exception e)
{%>
</font>
<font size="+4" color="red"></b>
<%
out.print("can not process"+e);
}
finally
{
	   // String redirectURL = "http://localhost:8081/ASSESMENT_PORTAL/romofyi-html/fashion.html";
	   // response.sendRedirect(redirectURL);
	   
	
}
%>
</font>


</body>
</html>