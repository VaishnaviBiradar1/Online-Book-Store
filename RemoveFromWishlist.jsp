<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page  import="java.sql.*"%>
<%@ page  import="bookstore.*"%>

<jsp:include page="LogCheck.jsp"></jsp:include>
<%
	
	Connection con = Dbconnection.getConnection();
	String sql="delete from wishlist where bid=? and cid=?";
	PreparedStatement ps =con.prepareStatement(sql);
	ps.setString(1, request.getParameter("bid"));
	ps.setString(2, request.getParameter("cid"));
	int check = ps.executeUpdate();
	if(check>0){
	%>
		<script>
			alert("Removed Wishlist..");
			location.href="WishList.jsp";
		</script>
	<%}
	else{
	%>
		<script>
			alert("Try Again..");
			location.href="WishList.jsp";
		</script>
	<%}
%>