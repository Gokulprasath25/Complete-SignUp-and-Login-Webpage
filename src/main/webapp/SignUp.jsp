<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign up</title>
</head>
<body>
<form method="get">
<%
String name=request.getParameter("FN");
String un=request.getParameter("UN");
String mail=request.getParameter("MAIL");
String no=request.getParameter("NUM");
String pw=request.getParameter("PW");
String pw1=request.getParameter("PW1");
String gen=request.getParameter("gender");
if(pw.equals(pw1))
{
  pw=pw1;
  
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Gokul","root","Root@25");
	PreparedStatement ps = con.prepareStatement("SELECT * FROM Users WHERE UserName=(?)");

    ps.setString(1,un);
    ResultSet rs = ps.executeQuery();
	 if(rs.next()) {
		 out.println("<h1 align=center>This User Name has been taken already!!</h1>");
		    out.println("<center><a href=SignUp.html>Try Again!</a></center>");
	 }else {
    PreparedStatement ps1 = con.prepareStatement("INSERT INTO Users(Name,UserName,Password,Email,Mobile,Gender) VALUES(?,?,?,?,?,?)"); 
    ps1.setString(1, name);
    ps1.setString(2, un);
    ps1.setString(3, pw);
    ps1.setString(4, mail);
    ps1.setString(5, no);
    ps1.setString(6, gen);
    ps1.executeUpdate();
    
	out.println("<h1 align=center>Your Account has been Successfully Regitered !</h2>");
	out.println("<center><a href=index.html>Login</a></center>");
	}
	
}else {
	out.println("<h1 align=center>Passwords Dont't Match!!</h1>");
    out.println("<center><a href=SignUp.html>Try Again!</a></center>");
}
%>
</form>
</body>
</html>