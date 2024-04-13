<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="bookstore.*"%>

<jsp:include page="LogCheck.jsp"></jsp:include>
<%

String cid=(String)session.getAttribute("customer");

Connection con =Dbconnection.getConnection();
String sql="select * from customer where cid=? and password=?";
PreparedStatement ps= con.prepareStatement(sql);
ps.setString(1,cid);
ps.setString(2, request.getParameter("oldpass"));
ResultSet rs=ps.executeQuery();
if(rs.next()){
	sql="update customer set password=? where cid=?";
	ps=con.prepareStatement(sql);
	ps.setString(1, request.getParameter("password"));
	ps.setString(2, cid);
	int check=ps.executeUpdate();
	if(check>0)
	{
		%>
			<script>
				alert("Password Changed Successfully");
				location.href="index.jsp";
			</script>
		<%
	}
	else
	{
		%>
			<script>
				alert("Problem Occurred Try again..");
				location.href="index.jsp";
			</script>
		<%
	}
}
else{
	%>
		<script>
				alert("Current Password is Wrong.. try again");
				location.href="index.jsp";
		</script>
	<%
}

%>