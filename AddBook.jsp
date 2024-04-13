<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="bookstore.*" %>
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
	%>
	<form action="AddBookdb.jsp" method="post" ENCTYPE="multipart/form-data">
	<section class="breadcrumb-section">
            <h2 class="sr-only">Site Breadcrumb</h2>
            <div class="container">
                <div class="breadcrumb-contents">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item active">Add Book</li>
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
                 	<h3 class="ct_title">Enter Book Details</h3>
                 </div>
                 
                    <div class="col-lg-6 col-md-6 col-12 mt--30 mt-md--0">
         
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                        
                                        	<label>Select Category <span class="required">*:-&nbsp;&nbsp;&nbsp;&nbsp;</span></label>
											<%
												int i=0;
												while(rs.next()){
												
											%>
												<input type="checkbox"  value="<%=rs.getString(2)%>" name="bookCategory"><%=rs.getString(2) %>
												&nbsp;
											<%
												if(++i%3 ==0){
													%>
														<br>
													<%
												}
												}
											%>
                                           
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                        	<label>Book Title <span class="required">*</span></label>
											<input type="text" name="bookTitle" class="form-control" required="required">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                        	<label>Book Subtitle *</label>
											<input type="text" name="bookSubTitle" class="form-control">
                                           
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                           <label>Author Name *</label>
											<input type="text" name="authorName" class="form-control" required>
                                        </div>
                                    </div>
                                    
                                  	 <div class="col-lg-12">
                                        <div class="form-group">
                                          <label>Quantity *</label>
											<input type="number" name="quantity" class="form-control" pattern="[0-9]+">
                                        </div>
                                    </div>
                                    
                                     <div class="col-lg-12">
                                        <div class="form-group">
                                          	<label>Description *</label>
											<textarea name="Description" class="form-control" required="required"></textarea>
                                        </div>
                                    </div>
                                   
                                  
                                </div>
                        
                           
                    
                    </div>
                 <div class="col-lg-6 col-md-6 col-12 mt--30 mt-md--0">
                 		
                 					  <div class="col-lg-12">
                                        <div class="form-group">
                                          <label>Select Image *</label>
											<input type="file" class="form-control" name="photo" required="required">
                                        </div>
                                    </div>
                                    
                                     <div class="col-lg-12">
                                        <div class="form-group">
                                          <label>Book price *</label>
											<input type="number" name="price" pattern="[0-9]+" required="required" class="form-control">
                                        </div>
                                    </div>
                                     <div class="col-lg-12">
                                        <div class="form-group">
                                          	<label>Relevant Words(separated by , or -) *</label>
											<textarea name="relevantWords" required class="form-control"></textarea>
                                        </div>
                                    </div>
                                     <div class="col-lg-12">
                                        <div class="form-group">
                                          <label>Any Discount *</label>
											<input type="number" name="discount" required pattern="[0-9]+" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">	
                                        	<label>Date *</label>
 											<input type="date" name="date" required class="form-control">
                                        </div>
                                    </div>
                 </div>
                 
                 		  <div class="col-lg-12 col-md-12 col-12 mt--30 mt-md--0" style="text-align: center;">
                                        <div class="form-btn">
                                            <button type="submit" value="submit" id="submit" class="btn btn-black"
                                                name="submit">Submit</button>
                                        </div>
                                        <div class="form__output"></div>
                            </div>
                </div>
            </div>
        </main>
</form>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">

	$("#submit").click(function(e){
		var ck_box = $('input[type="checkbox"]:checked').length;

	    if(ck_box < 0){
	      alert("At least Select one Category..");
	      e.preventDefault();
	    } 
	});
</script>

</body>
</html>