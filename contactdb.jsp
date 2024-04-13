
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="bookstore.*"%>
<%@ page import="java.sql.*"%>

<%
	Connection con =Dbconnection.getConnection();
	String sql="insert into contact(name, email, phoneno, msg, date) values(?,?,?,?,curdate())";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, request.getParameter("con_name"));
	ps.setString(2, request.getParameter("con_email"));
	ps.setString(3, request.getParameter("con_phone"));
	ps.setString(4, request.getParameter("con_message"));
	int check=ps.executeUpdate();
	if(check>0)
	{
	%>
		<script>
			alert("Thank You, We will Contact You soon..");
			location.href="contact.jsp";
		</script>
	<%}
	else
	{
	%>
		<script>
			alert("Problem Occurred Try agin..");
			location.href="contact.jsp";
		</script>
	<%} %>
