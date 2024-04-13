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

	<form action="CustomerRegistrationdb.jsp" method="post">
	<section class="breadcrumb-section">
            <h2 class="sr-only">Site Breadcrumb</h2>
            <div class="container">
                <div class="breadcrumb-contents">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item active">Registration</li>
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
                 	<h3 class="ct_title">Registration Form</h3>
                 </div>
                 
                    <div class="col-lg-6 col-md-6 col-12 mt--30 mt-md--0">
         
                                <div class="row">
                                   
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                        	<label>First Name *</label>
                                        	<input type="text" name="fname" id="fname" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                     	   <label>Last Name</label><input type="text" name="lname" id="lname" class="form-control" required>
                                           
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                          	<label>Mobile No.</label><input type="number" name="mobile" id="mobile" class="form-control" required>
                                        </div>
                                    </div>
                                    
                                  	
                                   
                                  
                                </div>
                        
                           
                    
                    </div>
                 <div class="col-lg-6 col-md-6 col-12 mt--30 mt-md--0">
                 		 <div class="col-lg-12">
                             <div class="form-group">
                              	<label>Password</label><input type="password" name="pass" id="pass" class="form-control" required>
                              </div>
                           </div>
                                    
                           <div class="col-lg-12">
	                           <div class="form-group">
                               		<label>Confirm Password</label>
                                    		<input type="password" name="cpass" id="cpass" class="form-control" required><br>
                                </div>
                           </div>
                 </div>
                 
                 		  <div class="col-lg-12 col-md-12 col-12 mt--30 mt-md--0" style="text-align: center;">
                                        <div class="form-btn">
                                            <button type="submit" value="submit" onclick="return checkdetails()" id="submit" class="btn btn-black"
                                                name="submit">Submit</button>
                                        </div>
                                        <div class="form__output"></div>
                            </div>
                </div>
            </div>
        </main>
</form>
<jsp:include page="footer.jsp"></jsp:include>
<script>
	function checkdetails(){
		var mobile=$("#mobile").val();
		var pass=$("#pass").val();
		var cpass=$("#cpass").val();
		if(mobile.length == 10 )
		{
			if(pass==cpass)
				return true;
			else{
				alert("password and Confrirm password not match");
				$("#pass").val('');
				$("#cpass").val('');
			}
		}
		else 
		{
		
			alert("Enter Correct Mobile No.");
			$("#mobile").val('');
		}
	}
</script>
</body>
</html>