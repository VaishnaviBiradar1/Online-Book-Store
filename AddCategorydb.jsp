<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page  import="java.sql.*"%>
<%@ page  import="bookstore.*"%>
<jsp:include page="LogCheckAdmin.jsp"></jsp:include>
<%
	Connection con = Dbconnection.getConnection();
	String sql="insert into bookcategory(category) values(?)";
	PreparedStatement ps =con.prepareStatement(sql);
	ps.setString(1, request.getParameter("add"));
	int check = ps.executeUpdate();
	if(check>0){
	%>
		{"id":1}
	<%}
	else{
	%>
		{"id":0}
	<%}
%>