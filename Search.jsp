<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
  <%@ page import="bookstore.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<%
String cid=(String)session.getAttribute("customer");
String search = request.getParameter("search"); 

Connection con=Dbconnection.getConnection();
String sql = "select * from addbook where quantity>0 and bookcategory like '%"+search+"%' or booktitle like '%"+search+"%' or authorname like '%"+search+"%' or booksubtitle like '%"+search+"%' ";
PreparedStatement ps = con.prepareStatement(sql);
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
<main class="inner-page-sec-padding-bottom">
			<div class="container">

				<div class="shop-product-wrap grid with-pagination row space-db--30 shop-border">
				  <%
                                while(rs.next())
                    			{
                    		
                    			int bookPrice=Integer.parseInt(rs.getString(9));
                    			int discount=Integer.parseInt(rs.getString(11));
                    			float dicountPrice = bookPrice - (bookPrice/100*discount);
                   %>
					<div class="col-lg-4 col-sm-6">
						<div class="product-card">
							<div class="product-grid-content">
								<div class="product-header">
									<a href="#" class="author">
                                         <%=rs.getString(5) %>
                                     </a>
									<h3><a href="ViewMoreBookDesc.jsp?bid=<%=rs.getString(1)%>"><%=rs.getString(3) %></a></h3>
								</div>
								<div class="product-card--body">
									<div class="card-image">
										<a href="ViewMoreBookDesc.jsp?bid=<%=rs.getString(1)%>">
                                            <img style="height:300px;" alt="<%=rs.getString(3)%>" src="BookImages/<%=rs.getString(6)%>">
                                      	</a>
										
									</div>
									<div class="price-block">
										 <span class="price"><%=dicountPrice %></span>
                                         <del class="price-old"><%=bookPrice %></del>
                                         <span class="price-discount"><%=discount %>%</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				<%} %>
				</div>


			</div>
		</main>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>