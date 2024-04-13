<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*" %>
<%@page import="bookstore.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="LogCheckAdmin.jsp"></jsp:include>
<%
Connection con=Dbconnection.getConnection();
String sql = "select *from contact order by date desc";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
%>
<section class="breadcrumb-section">
            <h2 class="sr-only">Site Breadcrumb</h2>
            <div class="container">
                <div class="breadcrumb-contents">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item active">User Messages</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </section>
        
        <div class="container">
        	<div class="row">
        		<table class="table table-striped">
        			<thead class="thead-dark">
        				<tr>
        					<td>Sr. No.</td>
        					<td>Name</td>
        					<td>E-Mail</td>
        					<td>Mobile No.</td>
        					<td>Message</td>
        					<td>Date</td>
        				<tr>
        			</thead>
        			<tbody>
        			<%
        			int i=0;
        			while(rs.next()){ 
        			%>
        				<tr>
        					<td><%=++i%></td>
        					<td><%=rs.getString(2) %></td>
        					<td><%=rs.getString(3) %></td>
        					<td><%=rs.getString(4) %></td>
        					<td><%=rs.getString(5) %></td>
        					<td><%=rs.getString(6) %></td>
        				</tr>
        			<%} %>
        			</tbody>
        			
        		</table>
        	
        	</div>
        
        </div>
        	<br><br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>