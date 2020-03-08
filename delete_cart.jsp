<%@page import="java.sql.*"%>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{   
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
     String pid=request.getParameter("pid");
	 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","password");
	 
	 PreparedStatement ps=con.prepareStatement("delete from cart where pid=?");
	    ps.setString(1,pid);  
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