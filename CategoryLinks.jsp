
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page  import="java.sql.*"%>
<%@ page  import="bookstore.*"%>
    
<%
	try{
		
			Connection con=Dbconnection.getConnection();
			String sql = "select * from bookcategory";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
			%>
				<a href="BookByCategory.jsp?category=<%=rs.getString(2)%>"><%=rs.getString(2) %></a><br>
			<%
			}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
%>