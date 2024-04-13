<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page  import="java.sql.*"%>
<%@ page  import="bookstore.*"%>

<%
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String mobile = request.getParameter("mobile");
	String pass = request.getParameter("pass");
	
	try{
		
		Connection con = Dbconnection.getConnection();
		String sql = "insert into customer(fname,lname,mobileNo,password) values(?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, fname);
		ps.setString(2, lname);
		ps.setString(3, mobile);
		ps.setString(4, pass);
		
		int check = ps.executeUpdate();
		if(check>0){
			%>
				<script>
					alert("Registered Successfully..");
					location.href = 'login.jsp';
				</script>
			<%
		}
		else{
			%>
			<script>
				alert("Problem Occured try again..");
				location.href = 'CustomerRegistration.jsp';
			</script>
		<%
	}
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>