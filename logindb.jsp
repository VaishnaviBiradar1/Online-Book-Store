<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page  import="java.sql.*"%>
<%@ page  import="bookstore.*"%>

<%
	String userName = request.getParameter("userName");
	String password = request.getParameter("password");
	String sql = "select *from admin where username=? and password=?";
	String sql1 = "select *from customer where mobileno=? and password=?";
	try{
		
		Connection con = Dbconnection.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, userName);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		
		if(rs.next()){
			
			session.setAttribute("admin","admin");
			%>
			<script>
				alert("Login Successfully..");
				location.href="index.jsp";
			</script>
			
		<%
		}
		else{
			ps = con.prepareStatement(sql1);
			ps.setString(1, userName);
			ps.setString(2, password);
			rs=ps.executeQuery();
			
			if(rs.next())
			{
				session.setAttribute("customer",rs.getString(1));
				%>
				<script>
					alert("Login Successfully..");
					location.href="index.jsp";
				</script>
			<%
				
			}
			else{
				%>
				<script>
					alert("Invalid Details..");
					location.href="login.jsp";
				</script>
			<%
			}
		}
		
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>