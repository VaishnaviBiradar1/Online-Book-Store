<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="bookstore.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
.property{
	font-size: 18px;
	font-weight:bold;
	padding:2px 2px 2px 2px;
}
.values{
	font-size: 17px;
	padding:2px 2px 2px 2px;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="LogCheckAdmin.jsp"></jsp:include>
<%
		String bid=request.getParameter("bid");	
	
		Connection con = Dbconnection.getConnection();
		String sql="select *from addbook where bid=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, bid);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
	%>	
	<form action="AddBookQuantitydb.jsp" method="post">
	<section class="breadcrumb-section">
            <h2 class="sr-only">Site Breadcrumb</h2>
            <div class="container">
                <div class="breadcrumb-contents">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item active">Add Book Quantity</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </section>
        <!-- Cart Page Start -->
        <main class="contact_area inner-page-sec-padding-bottom">
            <div class="container">

                <div class="row mt--60 ">
              
                 	<div class="col-lg-4 col-md-4 col-12 mt--30 mt-md--0">
                 	</div>
                    <div class="col-lg-5 col-md-5 col-12 mt--30 mt-md--0" style="border:solid;">
         
                                <div class="row">
										<h3 class="ct_title"><b>Add Book Quantity</b></h3>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                        	<label class="property">Book Title:</label><label class="values"><%=rs.getString(3) %></label>
                                        	
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                        	<label class="property">Book Title:</label><label class="values"><%=rs.getString(3) %></label>
                                           
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                           	<label class="property">Author Name:</label><label class="values"><%=rs.getString(5) %></label>
                                        </div>
                                    </div>
                                    
                                  	 <div class="col-lg-12">
                                        <div class="form-group">
                                         <label class="property">Quantity Present:</label><label class="values"><%=rs.getString(7) %></label>
                                        </div>
                                    </div>
                                    
                                     <div class="col-lg-5">
                                        <div class="form-group">
                                        	<input type="hidden" name="bid" value="<%=bid%>">
											<input type="hidden" name="previousQuantity" value="<%=rs.getString(7)%>">
                                          	<label class="property">Quantity To Add:</label>
                                        </div>
                                    
                                    </div>
                                       <div class="col-lg-7">
                                        <input type="number" name="quantity" class="form-control">
                                    </div>
                                   
                                    <div class="col-lg-12" style="text-align: center;">
                                    	 <br>
                                    	 <div class="form-btn">
                                            <button type="submit" value="submit" id="submit" class="btn btn-black"
                                                name="submit">Submit</button>
                                        </div>
                                            <br>
                                    </div>
                                
       						<%} 
							else{
								%>
									<script>
										alert("try again...");
										location.href="BookList.jsp";
									</script>
								<%
							}
						%>
                        </div>
                        
                           
                    
                    </div>
                	<div class="col-lg-2 col-md-2 col-12 mt--30 mt-md--0">
                 	</div>
                 
       
                </div>
            </div>
        </main>
</form>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>