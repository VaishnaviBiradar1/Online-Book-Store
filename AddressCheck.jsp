<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="bookstore.*"%>
<jsp:include page="LogCheck.jsp"></jsp:include>
<%
	String cid= (String)session.getAttribute("customer");
	Connection con=Dbconnection.getConnection();
	String sql = "select pincode from customer where cid=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, cid);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		if(rs.getString(1)==null)
		{
			%>
		<script>
			alert("your Address is Incomplete..");
			location.href="CustomerUpdate.jsp"
		</script>
		<%
		}
	}
	else{
		%>
			<script>
				location.href="CustomerUpdate.jsp"
			</script>
		<%
	}
%>