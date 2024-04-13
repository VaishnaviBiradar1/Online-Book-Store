<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page  import="java.sql.*"%>
<%@ page  import="bookstore.*"%>
<jsp:include page="LogCheckAdmin.jsp"></jsp:include>
<%
	int prevQuantity=Integer.parseInt(request.getParameter("previousQuantity"));
	int newQuantity=Integer.parseInt(request.getParameter("quantity"));
	int nowQuantity=prevQuantity+newQuantity;
	
	Connection con = Dbconnection.getConnection();
	String sql="update addbook set quantity=? where bid=?";
	PreparedStatement ps =con.prepareStatement(sql);
	ps.setInt(1, nowQuantity);
	ps.setString(2, request.getParameter("bid"));
	int check = ps.executeUpdate();
	if(check>0){
	%>
		<script type="text/javascript">
			alert("Inserted successfully..");
			location.href="BookList.jsp";
		</script>
	<%}
	else{
	%>	
		<script type="text/javascript">
			alert("Problem Occurred Try Again..");
			location.href="BookList.jsp";
		</script>
	<%}
%>