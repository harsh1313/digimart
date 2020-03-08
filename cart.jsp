<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<%
String email=request.getParameter("email");
String pid=request.getParameter("pid");
String quantity=request.getParameter("quantity");

session.setAttribute("email",email);
session.setAttribute("pid",pid);
session.setAttribute("quantity",quantity);
response.sendRedirect("addcart.jsp");
%>