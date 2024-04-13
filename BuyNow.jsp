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
<jsp:include page="AddressCheck.jsp"></jsp:include>
<form action="Payment.jsp" method="post">
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
 	String bid = request.getParameter("bid");
	String cartCheck="0";
	String wishCheck="0";

	con=Dbconnection.getConnection();
	sql = "select * from addbook where bid= ?";
	ps = con.prepareStatement(sql);
	ps.setString(1, request.getParameter("bid"));
	rs=ps.executeQuery();
	
	while(rs.next())
	{
	
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
                            			 <div class="count-input-block">
                                                <span class="widget-label">Qty</span>
                                                	<input type="hidden" name="presentQuantity" id="presentQuantity" value="<%=rs.getString(7)%>">
													<input type="hidden" name="bid" id="bid" value="<%=bid%>">
                                                <input type="number" name="quantity" id="quantity" pattern="[0-9]+" required class="form-control text-center" value="1">
                                            </div>
                                         
                                           <label><b>Amount to pay(Rs.): </b></label>
                                           <label id="totalPricelabel"><%= dicountPrice%></label>
											<input type="hidden" readonly id="totalPrice" name="totalPrice" value="<%= dicountPrice%>">
											<br>
											<button onclick="return confirmToBuy()" class="btn btn-outlined--primary">Confirm and Pay</button>
									
                                </div>
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
										 <div class="count-input-block">
                                                <span class="widget-label">Qty</span>
                                                	<input type="hidden" name="presentQuantity" id="presentQuantity" value="<%=rs.getString(7)%>">
													<input type="hidden" name="bid" id="bid" value="<%=bid%>">
                                                <input type="number" name="quantity" id="quantity" pattern="[0-9]+" required class="form-control text-center" value="1">
                                            </div>
                                         
                                           <label><b>Amount to pay(Rs.): </b></label>
                                           <label id="totalPricelabel"><%= dicountPrice%></label>
											<input type="hidden" readonly id="totalPrice" name="totalPrice" value="<%= dicountPrice%>">
											<br>
											<button onclick="return confirmToBuy()" class="btn btn-outlined--primary">Confirm and Pay</button>
                                </div>
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
</form>
<jsp:include page="footer.jsp"></jsp:include>

<script>
	var totalPrice=$('#totalPrice').val();
	$("#quantity").keyup(function(){
		
		var quantity=$("#quantity").val();
		var presentQuantity=$("#presentQuantity").val();
		var total=Number(quantity)*Number(totalPrice);
		$('#totalPrice').val(total);
		$("#totalPricelabel").text(total);
		if(Number(presentQuantity)>Number(quantity))
		{}
		else{
			alert("Quantity Not Avilable.. Enter low Quantity");
			$("#quantity").val('1');
			$("#totalPrice").val(totalPrice);
			$("#totalPricelabel").text(totalPrice);
		}
			
	});
	
	function confirmToBuy(){
		var result=confirm("Confirm to pay");
		return result;
	}
</script>
</body>
</html>