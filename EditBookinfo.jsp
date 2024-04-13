<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page  import="java.sql.*"%>
<%@ page  import="bookstore.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<style>

</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="LogCheckAdmin.jsp"></jsp:include>
<%
		Connection con=Dbconnection.getConnection();
		String sql = "select *from bookcategory where action='Active'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		String bid=request.getParameter("bid");
		sql="select *from addbook where bid=?";
		ps=con.prepareStatement(sql);
		ps.setString(1,bid);
		ResultSet rs1=ps.executeQuery();
		String category="";
		while(rs1.next())
			category=rs1.getString(2);
		
		String[] bookCategory=category.split(",");
		List<String> categoryList = new ArrayList<>(Arrays.asList(bookCategory));
		rs1=ps.executeQuery();
	%>
	<form action="EditBookinfodb.jsp" method="post" ENCTYPE="multipart/form-data">
	<input type="hidden" name="bid" value="<%=bid%>">
	
	<section class="breadcrumb-section">
            <h2 class="sr-only">Site Breadcrumb</h2>
            <div class="container">
                <div class="breadcrumb-contents">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item active">Update Book Info</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </section>
        <!-- Cart Page Start -->
        <main class="contact_area inner-page-sec-padding-bottom">
            <div class="container">

                <div class="row mt--60 ">
                <div class="col-lg-12 col-md-12 col-12 mt--30 mt-md--0">
                 	<h3 class="ct_title">Edit Book Details</h3>
                 </div>
                 
                    <div class="col-lg-6 col-md-6 col-12 mt--30 mt-md--0">
         
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                        
                                        	<label>Select Category <span class="required">*:-&nbsp;&nbsp;&nbsp;&nbsp;</span></label>
											<%
												if(rs1.next())
												{
													while(rs.next()){
														if(categoryList.contains(rs.getString(2)))
														{
													%>
														<input type="checkbox" name="bookCategory" value="<%=rs.getString(2) %>" checked><%=rs.getString(2) %>
													<%
														}
														else
														{%>
															<input type="checkbox" name="bookCategory" value="<%=rs.getString(2) %>"><%=rs.getString(2) %>
														<%}
													
														
													} %>
                                           
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                        	<label>Book Title <span class="required">*</span></label>
											<input type="text" name="bookTitle" value="<%=rs1.getString(3)%>" class="form-control" required="required">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                        	<label>Book Subtitle *</label>
											<input type="text" name="bookSubTitle"  value="<%=rs1.getString(4)%>" class="form-control">
                                           
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                           <label>Author Name *</label>
											<input type="text" name="authorName" value="<%=rs1.getString(5)%>" class="form-control">
                                        </div>
                                    </div>
                                    
                               
                                    
                                     <div class="col-lg-12">
                                        <div class="form-group">
                                          	<label>Description *</label>
											<textarea name="Description" class="form-control"><%=rs1.getString(8)%></textarea>
                                        </div>
                                    </div>
                                   
                                  
                                </div>
                        
                           
                    
                    </div>
                 <div class="col-lg-6 col-md-6 col-12 mt--30 mt-md--0">
                 		
                                    <div class="col-lg-12">
                                   		
                                    	<div class="col-lg-12">	
                                        	<div class="form-group">
                                        		<%-- <img alt="<%=rs1.getString(3) %>" style="float:right; width:200px; height:100px;" src="BookImages/<%=rs1.getString(6)%>"> --%>
                                      		    <label>Select Image *</label>
												<input type="file" class="form-control" name="photo">
												  
                                        	</div>
                                     	</div>
                                    </div>
                            
                                    
                                     <div class="col-lg-12">
                                        <div class="form-group">
                                          <label>Book price *</label>
											<input type="number" name="price" value="<%=rs1.getString(9)%>" class="form-control">
                                        </div>
                                    </div>
                                     <div class="col-lg-12">
                                        <div class="form-group">
                                          	<label>Relevant Words(separated by , or -) *</label>
											<textarea name="relevantWords"  required class="form-control"><%=rs1.getString(10)%></textarea>
                                        </div>
                                    </div>
                                     <div class="col-lg-12">
                                        <div class="form-group">
                                          <label>Any Discount *</label>
											<input type="text" name="discount" value="<%=rs1.getString(11)%>" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">	
                                        	<label>Date *</label>
 											<input type="date" name="date" value="<%=rs1.getString(13) %>" required class="form-control">
                                        </div>
                                    </div>
                 </div>
                 
                 		  <div class="col-lg-12 col-md-12 col-12 mt--30 mt-md--0" style="text-align: center;">
                                        <div class="form-btn">
                                            <button type="submit" value="submit" id="submit" class="btn btn-black"
                                                name="submit">Update</button>
                                        </div>
                                        <div class="form__output"></div>
                            </div>
                </div>
            </div>
        </main>
       <%} %>
</form>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>