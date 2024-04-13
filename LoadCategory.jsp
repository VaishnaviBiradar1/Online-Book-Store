<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page  import="java.sql.*"%>
<%@ page  import="bookstore.*"%>

<%
	Connection con = Dbconnection.getConnection();
	String sql="select * from bookcategory";
	PreparedStatement ps =con.prepareStatement(sql);
	ResultSet rs= ps.executeQuery();
	int i=0;
	while(rs.next()){
	%>
		<tr>
			<td><%=++i %></td>
			<td><%=rs.getString(2)%></td>
			<td>
				<a href="ActiveDeactiveCategory.jsp?bcid=<%=rs.getString(1)%>&status=<%=rs.getString(3)%>" id="activeDeactive"><%=rs.getString(3)%></a>
			</td>
		</tr>
	<%}%>