<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page  import="java.sql.*"%>
<%@ page  import="bookstore.*"%>

<jsp:include page="LogCheck.jsp"></jsp:include>
<%
	try{
		String cid=(String) session.getAttribute("customer");
		Connection con = Dbconnection.getConnection();
		String sql = "update customer set fname=?, lname=?, mobileNo=?, email=?, address=?, state=?, city=?, pincode=? where cid=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, request.getParameter("fname"));
		ps.setString(2, request.getParameter("lname"));
		ps.setString(3, request.getParameter("mobile"));
		ps.setString(4, request.getParameter("email"));
		ps.setString(5, request.getParameter("address"));
		ps.setString(6, request.getParameter("state"));
		ps.setString(7, request.getParameter("city"));
		ps.setString(8, request.getParameter("pincode"));
		ps.setString(9, cid);
		
		int check = ps.executeUpdate();
		if(check>0){
			%>
				<script>
					alert("Updated Successfully..");
					location.href = 'CustomerUpdate.jsp';
				</script>
			<%
		}
		else{
			%>
			<script>
				alert("Problem Occured try again..");
				location.href = 'CustomerUpdate.jsp';
			</script>
		<%
	}
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>