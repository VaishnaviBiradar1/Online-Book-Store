<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
<%@ page import="bookstore.*" %>

<!DOCTYPE html>
<html>
<head>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<jsp:include page="LogCheckAdmin.jsp"></jsp:include>
<%
Connection con = Dbconnection.getConnection();
String sql="select a.bid,a.booktitle,a.authorname,o.quantity,c.address, c.city,c.state,c.pincode,c.mobileno,o.date,o.status,a.photopath,o.oid from ((addbook as a inner join orders as o on a.bid=o.bid) inner join customer as c on c.cid=o.cid) where o.status!='Cancelled' order by o.status";
PreparedStatement ps=con.prepareStatement(sql);
ResultSet rs=ps.executeQuery();

%>

<section class="breadcrumb-section">
			<h2 class="sr-only">Site Breadcrumb</h2>
			<div class="container">
				<div class="breadcrumb-contents">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active">Orders</li>
						</ol>
					</nav>
				</div>
			</div>
</section>

<div class="cart_area inner-page-sec-padding-bottom">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<form action="https://demo.hasthemes.com/pustok-preview/pustok/">
							<!-- Cart Table -->
							<div class="cart-table table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>Image</th>
											<th>Book Title</th>
											<th>Author Name</th>
											<th>Quantity</th>
											<th>Address</th>
											<th>Mobile no.</th>
											<th>date</th>
											<th>Status</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
									<%while(rs.next()){
									%>	
										<tr>
											<td class="pro-thumbnail"><a href="#">
														<img alt="<%=rs.getString(2)%>" src="BookImages/<%=rs.getString(12)%>"></a></td>
									
										<td><%=rs.getString(2) %></td>
										<td><%=rs.getString(3) %></td>
										<td><%=rs.getString(4) %></td>
										<td><%=rs.getString(5) %>,<br><%=rs.getString(6) %>- <%=rs.getString(8) %>, <%=rs.getString(7) %></td>
										<td><%=rs.getString(9) %></td>
										<td><%=rs.getString(10) %></td>
										<td>
											<a href="ChangeOrderStatus.jsp?oid=<%=rs.getString(13)%>&status=<%=rs.getString(11)%>">
											<%=rs.getString(11) %></a></td>
										<td><a href="ViewMoreBookDesc.jsp?bid=<%=rs.getString(1)%>">View Book info</a></td>
										</tr>
										<%} %>
									</tbody>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>