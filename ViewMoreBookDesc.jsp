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

<%
int bookPrice=0;
int discount=0;
float dicountPrice = 0;

Connection con=Dbconnection.getConnection();
String sql = null;
PreparedStatement ps = null;
ResultSet rs=null;
%>
  <section class="breadcrumb-section">
            <h2 class="sr-only">Site Breadcrumb</h2>
            <div class="container">
                <div class="breadcrumb-contents">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item active">Product Details</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </section>
        
 <%
 	String cid=(String)session.getAttribute("customer");
	String cartCheck="0";
	String wishCheck="0";

	con=Dbconnection.getConnection();
	sql = "select * from addbook where bid= ?";
	ps = con.prepareStatement(sql);
	ps.setString(1, request.getParameter("bid"));
	rs=ps.executeQuery();
	
	ResultSet rs1=null;
	PreparedStatement ps1=null;
	String sql1;
	ResultSet rs2=null;
	PreparedStatement ps2=null;
	String sql2;
	if(cid!=null)
	{
		sql1="select *from cartlist where bid=? and cid=?";
		ps1=con.prepareStatement(sql1);	
	
		sql2="select *from wishlist where bid=? and cid=?";
		ps2=con.prepareStatement(sql2);
	}
	
	while(rs.next())
	{
		cartCheck="0";
		wishCheck="0";
	
		if(cid!=null){
			ps1.setString(1, rs.getString(1));
			ps1.setString(2, cid);
			rs1=ps1.executeQuery();
			
			
			ps2.setString(1, rs.getString(1));
			ps2.setString(2, cid);
			rs2=ps2.executeQuery();
		
			cart:while(rs1.next())
			{
				if(rs.getString(1).equals(rs1.getString(2)))
				{
					
					cartCheck="1";
					break cart;
				}
			}
			
			wish:while(rs2.next())
			{
				if(rs.getString(1).equals(rs2.getString(2)))
				{
					wishCheck="1";
					break wish;
				}
			}
		}
		
	bookPrice=Integer.parseInt(rs.getString(9));
	discount=Integer.parseInt(rs.getString(11));
	dicountPrice = bookPrice - (bookPrice/100*discount);
 %>
        <main class="inner-page-sec-padding-bottom">
            <div class="container">
                <div class="row  mb--60">
                    <div class="col-lg-5 mb--30">
                        <!-- Product Details Slider Big Image-->
                        <div class="product-details-slider sb-slick-slider arrow-type-two" data-slick-setting='{
              "slidesToShow": 1,
              "arrows": false,
              "fade": true,
              "draggable": false,
              "swipe": false,
              "asNavFor": ".product-slider-nav"
              }'>
                            <div class="single-slide">
                                <img alt="<%=rs.getString(3)%>" src="BookImages/<%=rs.getString(6)%>" style="height:400px; width:400px;">
                            </div>
                         
                        </div>
                        <!-- Product Details Slider Nav -->
                        <div class="mt--30 product-slider-nav sb-slick-slider arrow-type-two" data-slick-setting='{
            "infinite":true,
              "autoplay": true,
              "autoplaySpeed": 8000,
              "slidesToShow": 4,
              "arrows": true,
              "prevArrow":{"buttonClass": "slick-prev","iconClass":"fa fa-chevron-left"},
              "nextArrow":{"buttonClass": "slick-next","iconClass":"fa fa-chevron-right"},
              "asNavFor": ".product-details-slider",
              "focusOnSelect": true
              }'>
                           
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="product-details-info pl-lg--30 ">
                            <!-- <p class="tag-block">Tags: <a href="#">Movado</a>, <a href="#">Omega</a></p> -->
                            <h3 class="product-title"><%=rs.getString(3) %></h3>
                            <ul class="list-unstyled">
                                <li>Subtitle: <span class="list-value"> <%=rs.getString(4) %></span></li>
                                <li>Author: <a href="#" class="list-value font-weight-bold"> <%=rs.getString(5) %></a></li>
                                <li>Available Quantity: <span class="list-value"> <%=rs.getString(7) %></span></li>
                                <li>Discount: <span class="list-value"> <%=rs.getString(11) %>%</span></li>
                               
                            </ul>
                            <div class="price-block">
                                <span class="price-new">Rs. <%=dicountPrice%></span>
                                <del class="price-old"><%=rs.getString(9) %></del>
                            </div>
                            
                              <article class="product-details-article">
                                    <h4 class="sr-only">Product Summery</h4>
                                    <p><%=rs.getString(8) %></p>
                               </article>
                          
                            <div class="add-to-cart-row">
                               
                                
                                <div class="add-cart-btn">
                                	<%
										if(cartCheck=="0"){%>
											<a href="AddToCart.jsp?bid=<%=rs.getString(1)%>&cid=<%=cid%>" class="btn btn-outlined--primary">Add To Cart</a>
										<%}
										else{ %>
											<a href="Cart.jsp?bid=<%=rs.getString(1)%>" class="btn btn-outlined--primary">Go To Cart</a>
										<%} %>
										
										<a href="BuyNow.jsp?bid=<%=rs.getString(1)%>" class="btn btn-outlined--primary">Buy Now</a>
                                </div>
                            </div>
                            <div class="compare-wishlist-row">
                                  
                                <%if(wishCheck=="0"){%>
									<a href="AddToWishlist.jsp?bid=<%=rs.getString(1)%>&cid=<%=cid%>" class="add-link"><i class="fas fa-heart"></i> WishList</a>
								<%}
								else{%>
									<a href="RemoveFromWishList.jsp?bid=<%=rs.getString(1)%>" class="add-link"><i class="fas fa-heart"></i>WishListed</a>
								<%} %>
								
                            </div>
                        </div>
                    </div>
                </div>
              
            </div>
 
            <!--=================================
    RELATED PRODUCTS BOOKS
===================================== -->
 <%
 }
 rs=ps.executeQuery();
 while(rs.next())
	{
		cartCheck="0";
		wishCheck="0";
	
		if(cid!=null){
			ps1.setString(1, rs.getString(1));
			ps1.setString(2, cid);
			rs1=ps1.executeQuery();
			
			
			ps2.setString(1, rs.getString(1));
			ps2.setString(2, cid);
			rs2=ps2.executeQuery();
		
			cart:while(rs1.next())
			{
				if(rs.getString(1).equals(rs1.getString(2)))
				{
					
					cartCheck="1";
					break cart;
				}
			}
			
			wish:while(rs2.next())
			{
				if(rs.getString(1).equals(rs2.getString(2)))
				{
					wishCheck="1";
					break wish;
				}
			}
		}
		
	bookPrice=Integer.parseInt(rs.getString(9));
	discount=Integer.parseInt(rs.getString(11));
	dicountPrice = bookPrice - (bookPrice/100*discount);
%>
   
            <!-- Modal -->
            <div class="modal fade modal-quick-view" id="quickModal" tabindex="-1" role="dialog"
                aria-labelledby="quickModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <button type="button" class="close modal-close-btn ml-auto" data-dismiss="modal"
                            aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <div class="product-details-modal">
                            <div class="row">
                                <div class="col-lg-5">
                                    <!-- Product Details Slider Big Image-->
                                    <div class="product-details-slider sb-slick-slider arrow-type-two"
                                        data-slick-setting='{
              "slidesToShow": 1,
              "arrows": false,
              "fade": true,
              "draggable": false,
              "swipe": false,
              "asNavFor": ".product-slider-nav"
              }'>
                                        <div class="single-slide">
                                <img alt="<%=rs.getString(3)%>" src="BookImages/<%=rs.getString(6)%>" style="height:400px; width:400px;">
                            </div>
                                    </div>
                                    <!-- Product Details Slider Nav -->
                                    <div class="mt--30 product-slider-nav sb-slick-slider arrow-type-two"
                                        data-slick-setting='{
            "infinite":true,
              "autoplay": true,
              "autoplaySpeed": 8000,
              "slidesToShow": 4,
              "arrows": true,
              "prevArrow":{"buttonClass": "slick-prev","iconClass":"fa fa-chevron-left"},
              "nextArrow":{"buttonClass": "slick-next","iconClass":"fa fa-chevron-right"},
              "asNavFor": ".product-details-slider",
              "focusOnSelect": true
              }'>
                                       
                                    </div>
                                </div>
                                <div class="col-lg-7 mt--30 mt-lg--30">
                                     <div class="product-details-info pl-lg--30 ">
                            <!-- <p class="tag-block">Tags: <a href="#">Movado</a>, <a href="#">Omega</a></p> -->
                            <h3 class="product-title"><%=rs.getString(3) %></h3>
                            <ul class="list-unstyled">
                                <li>Subtitle: <span class="list-value"> <%=rs.getString(4) %></span></li>
                                <li>Author: <a href="#" class="list-value font-weight-bold"> <%=rs.getString(5) %></a></li>
                                <li>Available Quantity: <span class="list-value"> <%=rs.getString(7) %></span></li>
                                <li>Discount: <span class="list-value"> <%=rs.getString(11) %>%</span></li>
                               
                            </ul>
                            <div class="price-block">
                                <span class="price-new">Rs. <%=dicountPrice%></span>
                                <del class="price-old"><%=rs.getString(9) %></del>
                            </div>
                            
                              <article class="product-details-article">
                                    <h4 class="sr-only">Product Summery</h4>
                                    <p><%=rs.getString(8) %></p>
                               </article>
                          
                            <div class="add-to-cart-row">
                               
                                
                                <div class="add-cart-btn">
                                	<%
										if(cartCheck=="0"){%>
											<a href="AddToCart.jsp?bid=<%=rs.getString(1)%>&cid=<%=cid%>" class="btn btn-outlined--primary">Add To Cart</a>
										<%}
										else{ %>
											<a href="Cart.jsp?bid=<%=rs.getString(1)%>" class="btn btn-outlined--primary">Go To Cart</a>
										<%} %>
										
										<a href="BuyNow.jsp?bid=<%=rs.getString(1)%>" class="btn btn-outlined--primary">Buy Now</a>
                                </div>
                            </div>
                            <div class="compare-wishlist-row">
                                  
                                <%if(wishCheck=="0"){%>
									<a href="AddToWishlist.jsp?bid=<%=rs.getString(1)%>&cid=<%=cid%>" class="add-link"><i class="fas fa-heart"></i> WishList</a>
								<%}
								else{%>
									<a href="RemoveFromWishList.jsp?bid=<%=rs.getString(1)%>" class="add-link"><i class="fas fa-heart"></i>WishListed</a>
								<%} %>
								
                            </div>
                        </div>
                                </div>
                            </div>
                        </div>
               
                    </div>
                </div>
            </div>
        </main>
<%} %>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>