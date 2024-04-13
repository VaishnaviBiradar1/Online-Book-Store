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
Connection con=Dbconnection.getConnection();
String sql = null;
PreparedStatement ps = null;
ResultSet rs=null;
%>

  <section class="pt--30 section-margin">
            <h2 class="sr-only">Category Gallery Section</h2>
            <div class="container">
                <div class="category-gallery-block">
                    <a href="BookByCategory.jsp?category=comics" class="single-block hr-large">
                        <img src="image/others/cat-gal-large.png" alt="">
                    </a>
                    <div class="single-block inner-block-wrapper">
                        <a href="BookByCategory.jsp?category=arts" class="single-image mid-image">
                            <img src="image/others/cat-gal-mid.png" alt="">
                        </a>
                        <a href="BookByCategory.jsp?category=Business" class="single-image small-image">
                            <img src="image/others/cat-gal-small.png" alt="">
                        </a>
                        <a href="BookByCategory.jsp?category=children" class="single-image small-image">
                            <img src="image/others/cat-gal-small-2.jpg" alt="">
                        </a>
                        <a href="BookByCategory.jsp?category=Travel" class="single-image mid-image">
                            <img src="image/others/cat-gal-mid-2.png" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </section>
     <section class="section-margin">
            <div class="container">
                <div class="section-title section-title--bordered">
                    <h2>BIOGRAPHIES BOOKS</h2>
                </div>
                <div class="product-slider sb-slick-slider slider-border-single-row" data-slick-setting='{
                        "autoplay": true,
                        "autoplaySpeed": 8000,
                        "slidesToShow": 5,
                        "dots":true
                    }' data-slick-responsive='[
                        {"breakpoint":1200, "settings": {"slidesToShow": 4} },
                        {"breakpoint":992, "settings": {"slidesToShow": 3} },
                        {"breakpoint":768, "settings": {"slidesToShow": 2} },
                        {"breakpoint":480, "settings": {"slidesToShow": 1} },
                        {"breakpoint":320, "settings": {"slidesToShow": 1} }
                    ]'>
                    
 <%
	con=Dbconnection.getConnection();
	sql = "select * from addbook where quantity>0 and bookcategory like '%BIOGRAPHIES%'";
	ps = con.prepareStatement(sql);
	rs=ps.executeQuery();
	while(rs.next())
	{
		
		int bookPrice=Integer.parseInt(rs.getString(9));
		int discount=Integer.parseInt(rs.getString(11));
		float dicountPrice = bookPrice - (bookPrice/100*discount);
 %>
                    <div class="single-slide" style="padding:4px;">
                        <div class="product-card">
                            <div class="product-header">
                                <a href="#" class="author">
                                  	<%=rs.getString(5) %>
                                </a>
                                <h3><a href="ViewMoreBookDesc.jsp?bid=<%=rs.getString(1)%>"><%=rs.getString(3) %></a></h3>
                            </div>
                            <div class="product-card--body">
                                <div class="card-image">
                                      <a href="ViewMoreBookDesc.jsp?bid=<%=rs.getString(1)%>" class="hover-image">
                                           <img alt="<%=rs.getString(3)%>" src="BookImages/<%=rs.getString(6)%>" style="height:250px; width:300px;">       
                                      </a>
                                </div>
                                <div class="price-block">
                                    <span class="price">Rs. <%=dicountPrice%></span>
                                    <del class="price-old"><%=rs.getString(9) %></del>
                                    <span class="price-discount"><%=rs.getString(11) %>%</span>
                                </div>
                            </div>
                        </div>
                    </div>
  <%}%>
                </div>
            </div>
        </section>
        
        
         <section class="section-margin">
            <div class="container">
                <div class="section-title section-title--bordered">
                    <h2>Comics BOOKS</h2>
                </div>
                <div class="product-slider sb-slick-slider slider-border-single-row" data-slick-setting='{
                        "autoplay": true,
                        "autoplaySpeed": 8000,
                        "slidesToShow": 5,
                        "dots":true
                    }' data-slick-responsive='[
                        {"breakpoint":1200, "settings": {"slidesToShow": 4} },
                        {"breakpoint":992, "settings": {"slidesToShow": 3} },
                        {"breakpoint":768, "settings": {"slidesToShow": 2} },
                        {"breakpoint":480, "settings": {"slidesToShow": 1} },
                        {"breakpoint":320, "settings": {"slidesToShow": 1} }
                    ]'>
                    
 <%
	con=Dbconnection.getConnection();
	sql = "select * from addbook where quantity>0 and bookcategory like '%Comics%'";
	ps = con.prepareStatement(sql);
	rs=ps.executeQuery();
	while(rs.next())
	{
		
		int bookPrice=Integer.parseInt(rs.getString(9));
		int discount=Integer.parseInt(rs.getString(11));
		float dicountPrice = bookPrice - (bookPrice/100*discount);
 %>
                    <div class="single-slide" style="padding:4px;">
                        <div class="product-card">
                            <div class="product-header">
                                <a href="#" class="author">
                                  	<%=rs.getString(5) %>
                                </a>
                                <h3><a href="ViewMoreBookDesc.jsp?bid=<%=rs.getString(1)%>"><%=rs.getString(3) %></a></h3>
                            </div>
                            <div class="product-card--body">
                                <div class="card-image">
                                      <a href="ViewMoreBookDesc.jsp?bid=<%=rs.getString(1)%>" class="hover-image">
                                           <img alt="<%=rs.getString(3)%>" src="BookImages/<%=rs.getString(6)%>" style="height:250px; width:300px;">       
                                      </a>
                                </div>
                                <div class="price-block">
                                    <span class="price">Rs. <%=dicountPrice%></span>
                                    <del class="price-old"><%=rs.getString(9) %></del>
                                    <span class="price-discount"><%=rs.getString(11) %>%</span>
                                </div>
                            </div>
                        </div>
                    </div>
  <%}%>
                </div>
            </div>
        </section>
        
         <section class="mb--30 space-dt--30">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-md-6 mt--30">
                        <div class="feature-box h-100">
                            <div class="icon">
                                <i class="fas fa-shipping-fast"></i>
                            </div>
                            <div class="text">
                                <h5>Free Shipping Item</h5>
                                <p> Orders over Rs.500</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mt--30">
                        <div class="feature-box h-100">
                            <div class="icon">
                                <i class="fas fa-redo-alt"></i>
                            </div>
                            <div class="text">
                                <h5>Money Back Guarantee</h5>
                                <p>100% money back</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mt--30">
                        <div class="feature-box h-100">
                            <div class="icon">
                                <i class="fas fa-piggy-bank"></i>
                            </div>
                            <div class="text">
                                <h5>Cash On Delivery</h5>
                                <p>Available</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mt--30">
                        <div class="feature-box h-100">
                            <div class="icon">
                                <i class="fas fa-life-ring"></i>
                            </div>
                            <div class="text">
                                <h5>Help & Support</h5>
                                <p>Call us : + 0123.4567.89</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--=================================
        Promotion Section One
    ===================================== -->
    
  
        <section class="section-margin">
            <h1 class="sr-only">Promotion Section</h1>
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <a href="#" class="promo-image promo-overlay">
                            <img src="image/bg-images/promo-banner-with-text.jpg" alt="" style="height:200px; width:700px;">
                        </a>
                    </div>
                    <div class="col-lg-6">
                        <a href="SaleUpto.jsp" class="promo-image promo-overlay">
                            <img src="image/saleupto30Off.jpg" alt="" style="height:200px; width:700px;">
                        </a>
                    </div>
                </div>
            </div>
        </section>
        
        
        
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>