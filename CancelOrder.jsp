<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page  import="java.sql.*"%>
<%@ page  import="bookstore.*"%>

<jsp:include page="LogCheck.jsp"></jsp:include>
<%
	String oid= request.getParameter("oid");
	

	Connection con = Dbconnection.getConnection();
	String sql="update orders set status=? where oid=?";
	PreparedStatement ps =con.prepareStatement(sql);
	ps.setString(1, "Canceled");
	ps.setString(2, oid);
	int check = ps.executeUpdate();
	if(check>0){
	%>
		<script type="text/javascript">
			alert("Status Updated");	
			location.href="MyOrders.jsp";
		</script>
	<%}
	else{
	%>
		<script type="text/javascript">
			alert("Error Occurred Try again...");	
			location.href="MyOrders.jsp";
		</script>
	<%}
%>