<%@page import="java.sql.*"%>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%! ResultSet rs=null;  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

Welcome <%= session.getAttribute("email").toString() %>

<table border="1">
<tr>
<td>pid</td>
<td>quantity</td>
</tr>

<%
try{   
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String email=session.getAttribute("email").toString();
	String pid=session.getAttribute("pid").toString();
	String quantity=session.getAttribute("quantity").toString();
	 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","password");
	 
	 PreparedStatement ps=con.prepareStatement("insert into cart values(?,?,?)");
	    ps.setString(1,email);
	    ps.setString(2,pid);
	    ps.setString(3,quantity);  
		int c= ps.executeUpdate();
		response.sendRedirect("view_cart.jsp");

}

catch (Exception e)
{
	e.printStackTrace();
}
		

%>
</body>
</html>