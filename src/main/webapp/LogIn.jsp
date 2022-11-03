<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>log in</title>
<style>
table, th, td{
        margin-left: 40%;
        border: 1px solid black;
        border-radius: 5px;
</style>
</head>
<body>
<form method="get">
<table>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Gokul","root","Root@25");
String un=request.getParameter("UN");
String pw=request.getParameter("PW");
PreparedStatement ps=con.prepareStatement("SELECT * FROM users WHERE UserName = (?) AND Password=(?)");
ps.setString(1, un);
ps.setString(2, pw);
ResultSet rs = ps.executeQuery();

if(rs.next())
{
	out.println("<h2 align=center>Hello "+rs.getString(1)+"</h2>");
	out.println("<h3 align=center>You've Successfully Logged in :)</h3>");
	out.println("<center><a href=Delete.html>Delete Profile</a></center><hr>");
	out.println("<h1 align=center>Profile Details:</h1>");
	out.println("<tr><th>NAME:</th><td>"+rs.getString(1)+"</td></tr><tr><th>USERNAME:</th><td>"+rs.getString(2)+"</td></tr><tr><th>EMAIL:</th><td>"+rs.getString(4)+"</td></tr><tr><th>MOBILE NO:</th><td>"+rs.getString(5)+"</td></tr><tr><th>GENDER:</th><td>"+rs.getString(6)+"</td></tr>");
    
}else
{
  out.println("<h1 align=center >Invalid Login credentials!!</h1>");
}
%>
</table>
<br>
<center><a href="index.html">Exit</a></center><br>

</form>
</body>
</html>