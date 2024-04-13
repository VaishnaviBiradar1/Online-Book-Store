<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page  import="java.sql.*"%>
<%@ page  import="bookstore.*"%>
<jsp:include page="LogCheckAdmin.jsp"></jsp:include>
<%
	String status= request.getParameter("status");
	if(status.equalsIgnoreCase("Active"))
		status="Deactive";
	else
		status="Active";
	
	Connection con = Dbconnection.getConnection();
	String sql="update bookcategory set action=? where bcid=?";
	PreparedStatement ps =con.prepareStatement(sql);
	ps.setString(1, status);
	ps.setString(2, request.getParameter("bcid"));
	int check = ps.executeUpdate();
	if(check>0){
	%>
		<script type="text/javascript">
			alert("Status Updated");	
			location.href="AddCategory.jsp";
		</script>
	<%}
	else{
	%>
		<script type="text/javascript">
			alert("Error Occurred Try again...");	
			location.href="AddCategory.jsp";
		</script>
	<%}
%>