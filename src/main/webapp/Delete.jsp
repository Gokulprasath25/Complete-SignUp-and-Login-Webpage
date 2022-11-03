<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deleted</title>
</head>
<body>
<form method="get">
<%
String un = request.getParameter("UN");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Gokul","root","Root@25");
PreparedStatement ps = con.prepareStatement("DELETE FROM Users WHERE UserName=(?)");
ps.setString(1, un);
int i = ps.executeUpdate();
if(i>0){
	out.println("<h3 align=center>Account Deleted!</h3>");
}else{
	out.println("<h3 align=center>User name doesn't exist!</h3>");
}
%>
<center><a href="index.html">Exit</a></center><br>
</form>
</body>
</html>