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
String cid=(String)session.getAttribute("customer");

Connection con=Dbconnection.getConnection();
String sql = "select a.bid,a.booktitle,a.authorname,o.quantity, o.totalprice,o.date,o.deliverydate,o.status,a.photopath,o.oid from ((addbook as a inner join orders as o on a.bid=o.bid) inner join customer as c on c.cid=o.cid) where c.cid=? order by date desc";
PreparedStatement ps = con.prepareStatement(sql);
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
							<li class="breadcrumb-item active">My Orders History</li>
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
											<th>Total Price</th>
											<th>Odered</th>
											<th>Delivered</th>
											<th>Status</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
									<%while(rs.next()){
									%>	
										<tr>
											<td class="pro-thumbnail"><a href="#">
														<img alt="<%=rs.getString(2)%>" src="BookImages/<%=rs.getString(9)%>"></a></td>
												<td><%=rs.getString(2) %></td>
												<td><%=rs.getString(3) %></td>
												<td><%=rs.getString(4) %></td>
												<td><%=rs.getString(5) %></td>
												<td><%=rs.getString(6) %></td>
												<td><%=(rs.getString(7) ==null)?"-":(rs.getString(7)) %></td>
												<td>
													<%
														if(rs.getString(8).equalsIgnoreCase("Pending"))
														{
															%>
															<input type="hidden" id="oid" value="<%=rs.getString(10)%>">
															Pending / <a href="" id="cancel">Cancel</a>
															<%
														}
														else{
															%> 
																<%=rs.getString(8) %>
															<%
														}
													%>
												</td>
												<td><a href="ViewMoreBookDesc.jsp?bid=<%=rs.getString(1)%>">View</a></td>
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
<script>
$("#cancel").click(function(){
	let oid=$("#oid").val();
	if(confirm("Are you Really Want to Cancel..?"))
	{
		$.ajax({
			url:'CancelOrder.jsp?oid='+oid,
			sucess:function(result){
				alert("Order Cancelled");
			}
		});
	}
	
});
</script>
</body>
</html>