<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page  import="java.sql.*"%>
<%@ page  import="bookstore.*"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="LogCheckAdmin.jsp"></jsp:include>
<%
		
		Connection con = Dbconnection.getConnection();
		String sql="SELECT * FROM  addbook order by bid desc";
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
							<li class="breadcrumb-item active">Books</li>
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
											<th>Sr. No.</th>
											<th>Image</th>
											<th>Book Title</th>
											<th>Author Name</th>
											<th>Quantity</th>
											<th>Price</th>
											<th>Discount</th>
											<th>Action</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
										<%
										int i=0;
										while(rs.next())
										{%>
											<tr>
												<td><%=++i %></td>
												<td class="pro-thumbnail"><img alt="<%=rs.getString(3) %>" src="BookImages/<%=rs.getString(6)%>"></td>
												<td><%=rs.getString(3) %></td>
												<td><%=rs.getString(5) %></td>
												<td><%=rs.getString(7) %></td>
												<td><%=rs.getString(9) %></td>
												<td><%=rs.getString(11) %></td>
												<td><a href="EditBookinfo.jsp?bid=<%=rs.getString(1)%>">Update</a>/<a href="AddBookQuantity.jsp?bid=<%=rs.getString(1)%>">Add Qnty.</a></td>
												<td><a href="ActiveDeactiveBook.jsp?bid=<%=rs.getString(1)%>&status=<%=rs.getString(12)%>"><%=rs.getString(12) %></a></td>
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