<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ page  import="java.sql.*"%>
<%@ page  import="bookstore.*"%>
   
   <jsp:include page="LogCheck.jsp"></jsp:include> 
<%	

	String cid=(String) session.getAttribute("customer");
	String bid=request.getParameter("bid");
	int presentQuantity=Integer.parseInt(request.getParameter("presentQuantity"));
	int quantity=Integer.parseInt(request.getParameter("quantity"));
	int remQuantity=presentQuantity-quantity;
	
	Connection con=Dbconnection.getConnection();
	String sql="insert into orders(bid, cid, quantity,totalprice,date) values(?,?,?,?,CURDATE())";
	String sql1="update addbook set quantity=? where bid=?";
	PreparedStatement ps= con.prepareStatement(sql);
	ps.setString(1, bid);
	ps.setString(2, cid);
	ps.setInt(3, quantity);
	ps.setString(4, request.getParameter("totalPrice"));
	
	PreparedStatement ps1= con.prepareStatement(sql1);
	ps1.setInt(1, remQuantity);
	ps1.setString(2, bid);
	
	int check = ps1.executeUpdate();
	int check1=ps.executeUpdate();
	if(check>0 && check1>0){
		%>
			<script>
				alert("Payment done Successfully...");
				location.href="index.jsp";
			</script>
		<%
	}
	else{
		%>
		<script>
			alert("Problem Occured try again..");
			location.href = 'BuyNow.jsp?bid='+<%=bid%>;
		</script>
	<%
	}
	
%>                                                                                                                                                                               