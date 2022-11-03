<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="get">
<%
String un=request.getParameter("UN");
String pw=request.getParameter("PW");
String pw1=request.getParameter("PW1");
if(pw.equals(pw1))
{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Gokul","root","Root@25");
	PreparedStatement ps = con.prepareStatement("SELECT * FROM Users WHERE UserName=(?)");
    ps.setString(1,un);
    ResultSet rs = ps.executeQuery();
	 if(rs.next()) {
		 PreparedStatement ps1 = con.prepareStatement("UPDATE Users SET Password=(?) WHERE UserName=(?)"); 
	        ps1.setString(1, pw);
	        ps1.setString(2, un);
	        ps1.executeUpdate();
			out.println("<font size=12>Password Changed Successfully !<br>");
			
			out.println("Click here to <a href=index.html>Login</a>");
		 
	}else {
    
	out.println("<font color=red size=18>UserName Doesn't Exist!<br>");
	
	out.println("<a href=Reset.html>Try Again!!</a>");
	}
	}
else {
	out.println("<font color=red size=18>Passwords Dont't Match!!<br>");
    out.println("<a href=Reset.html>Try Again!</a>");
}
%>
</form>
</body>
</html>