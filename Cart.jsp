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
<jsp:include page="LogCheck.jsp"></jsp:include>

<%
String cid=(String) session.getAttribute("customer");

Connection con =Dbconnection.getConnection();
String sql="select ad.bid, ad.booktitle, ad.booksubtitle, ad.authorname, ad.photopath, ad.quantity, ad.description, ad.price, ad.discount, c.bid, c.cid from addbook as ad inner join cartlist as c on ad.bid=c.bid where c.cid=?";
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1, cid);
ResultSet rs=ps.executeQuery();

%>

<section class="breadcrumb-section">
			<h2 class="sr-only">Site Breadcrumb</h2>
			<div class="container">
				<div class="breadcrumb-contents">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active">Shopping Cart</li>
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
											<th class="pro-thumbnail">Image</th>
											<th class="pro-title">Book Title</th>
											<th class="pro-price">Author</th>
											<th class="pro-quantity">Discount</th>
											<th class="pro-quantity">Price</th>
											<th class="pro-remove">Remove</th>
											<th class="pro-subtotal">Action</th>
										</tr>
									</thead>
									<tbody>
									<%while(rs.next()){
										int bookPrice=Integer.parseInt(rs.getString(8));
										int discount=Integer.parseInt(rs.getString(9));
										float discountPrice = bookPrice - (bookPrice/100*discount);
									%>	
										<tr>
											<td class="pro-thumbnail"><a href="#">
														<img alt="<%=rs.getString(2)%>" src="BookImages/<%=rs.getString(5)%>"></a></td>
											<td class="pro-title"><a href="#"><%=rs.getString(2) %></a></td>
											<td class="pro-price"><%=rs.getString(4) %></td>
											<td class="pro-quantity"><%=rs.getString(9) %>%</td>
											<td class="pro-subtotal">
												<span>Rs. <%=discountPrice %></span>
													<span><del><%=bookPrice%></del></span>
												
											</td>
											<td class="pro-remove"><a href="RemoveFromCart.jsp?bid=<%=rs.getString(1)%>&cid=<%=cid%>"><i class="far fa-trash-alt"></i></a></td>
											<td><a href="ViewMoreBookDesc.jsp?bid=<%=rs.getString(1)%>">View Book<br>Details</a></td>
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