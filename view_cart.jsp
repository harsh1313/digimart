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
<table border="1">
<tr>
Welcome <%= session.getAttribute("email").toString() %>
<td>pid</td>

<td>quantity</td>
<td>delete</a></td>
</tr>
<%

try{   
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String email=session.getAttribute("email").toString();
	 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","password");
	 
	PreparedStatement ps2=con.prepareStatement("select * from cart where email=?");
    ps2.setString(1,email);
	  
	 rs=ps2.executeQuery();
	
	while(rs.next()) 
	{
		String pid=rs.getString("pid");
		String dlink="delete_cart.jsp?pid="+pid;
		
%>
		<tr>
		<td><%=rs.getString("pid") %></td>
		<td><%=rs.getString("quantity") %></td>
		<td><a href=<%= dlink %>>delete</a></td>
		</tr>
<%
	}  
	con.close();  
	  
	}catch(Exception e)
	{ 
		//System.out.println(e);
		
	}   

%>
</body>
</html>