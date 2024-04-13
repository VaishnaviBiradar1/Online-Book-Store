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
<jsp:include page="LogCheck.jsp"></jsp:include>
<%
		String cid=(String)session.getAttribute("customer");
		Connection con =Dbconnection.getConnection();
		String sql="Select * from customer where cid=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, cid);
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			
%>
	<form action="CustomerUpdatedb.jsp" method="post">
	<section class="breadcrumb-section">
            <h2 class="sr-only">Site Breadcrumb</h2>
            <div class="container">
                <div class="breadcrumb-contents">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item active">Update Profile</li>
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
                 	<h3 class="ct_title">Update Profile</h3>
                 </div>
                 
                    <div class="col-lg-6 col-md-6 col-12 mt--30 mt-md--0">
         
                                <div class="row">
                                   
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                        	<label>First Name *</label><input class="form-control" type="text" value="<%=rs.getString(2) %>" name="fname" id="fname" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                     	  <label>Last Name *</label><input class="form-control" type="text" value="<%=rs.getString(3) %>" name="lname" id="lname" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                       		<label>Mobile No. *</label><input class="form-control" type="text" value="<%=rs.getString(4) %>"  name="mobile" id="mobile" required>
                                        </div>
                                    </div>
                                    
                                  	 <div class="col-lg-12">
                                        <div class="form-group">
                                       		<label>Email-Id *</label><input class="form-control" type="email" value="<%=(rs.getString(6)==null)?" ": rs.getString(6) %>" name="email" id="lname" required>
                                        </div>
                                    </div>
                                   
                                  
                                </div>
                        
                           
                    
                    </div>
                 <div class="col-lg-6 col-md-6 col-12 mt--30 mt-md--0">
                 		 <div class="col-lg-12">
                             <div class="form-group">
                              	<label>Address *</label><input type="text" class="form-control" value="<%=(rs.getString(7)==null)?"": rs.getString(7) %>"  name="address" id="address" required>
                              </div>
                           </div>
                                    
                           <div class="col-lg-12">
	                           <div class="form-group">
                               		<label>State *</label>
									<select name="state" id="state" class="form-control" required>
										<option value="<%=(rs.getString(8)==null)?" ": rs.getString(8) %>"><%=(rs.getString(8)==null)?" ": rs.getString(8) %><option>
										<option value="Andhra Pradesh">Andhra Pradesh</option>
										<option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
										<option value="Arunachal Pradesh">Arunachal Pradesh</option>
										<option value="Assam">Assam</option>
										<option value="Bihar">Bihar</option>
										<option value="Chandigarh">Chandigarh</option>
										<option value="Chhattisgarh">Chhattisgarh</option>
										<option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
										<option value="Daman and Diu">Daman and Diu</option>
										<option value="Delhi">Delhi</option>
										<option value="Lakshadweep">Lakshadweep</option>
										<option value="Puducherry">Puducherry</option>
										<option value="Goa">Goa</option>
										<option value="Gujarat">Gujarat</option>
										<option value="Haryana">Haryana</option>
										<option value="Himachal Pradesh">Himachal Pradesh</option>
										<option value="Jammu and Kashmir">Jammu and Kashmir</option>
										<option value="Jharkhand">Jharkhand</option>
										<option value="Karnataka">Karnataka</option>
										<option value="Kerala">Kerala</option>
										<option value="Madhya Pradesh">Madhya Pradesh</option>
										<option value="Maharashtra">Maharashtra</option>
										<option value="Manipur">Manipur</option>
										<option value="Meghalaya">Meghalaya</option>
										<option value="Mizoram">Mizoram</option>
										<option value="Nagaland">Nagaland</option>
										<option value="Odisha">Odisha</option>
										<option value="Punjab">Punjab</option>
										<option value="Rajasthan">Rajasthan</option>
										<option value="Sikkim">Sikkim</option>
										<option value="Tamil Nadu">Tamil Nadu</option>
										<option value="Telangana">Telangana</option>
										<option value="Tripura">Tripura</option>
										<option value="Uttar Pradesh">Uttar Pradesh</option>
										<option value="Uttarakhand">Uttarakhand</option>
										<option value="West Bengal">West Bengal</option>
									</select>
                                </div>
                           </div>
                           
                            <div class="col-lg-12">
                             <div class="form-group">
                              	<label>city *</label><input class="form-control" type="text" value="<%=(rs.getString(9)==null)?"": rs.getString(9) %>"  name="city" id="city" required>
                              </div>
                           </div>
                           
                            <div class="col-lg-12">
                             <div class="form-group">
                              		<label>Pin code *</label><input class="form-control" type="number" value="<%=(rs.getString(10)==null)?"": rs.getString(10) %>"  name="pincode" id="pincode" required>
                              </div>
                           </div>
                 </div>
                 
                 		  <div class="col-lg-12 col-md-12 col-12 mt--30 mt-md--0" style="text-align: center;">
                                        <div class="form-btn">
                                            <button type="submit" value="submit" id="submit" onclick="return checkMobileno()" class="btn btn-black"
                                                name="submit">Update</button>
                                        </div>
                                        <div class="form__output"></div>
                            </div>
                </div>
           <%}
		else{
			%>
				<script>
					alert("problem occurred Try again..");
					location.href = 'index.jsp';
				</script>
			<%
		}
		%>
            </div>
        </main>
</form>
<jsp:include page="footer.jsp"></jsp:include>

<script>
function checkMobileno()
{

	var mo=$("#mobile").val();
	if(mo.length == 10)
		return true;
	else{
		alert("Enter Correct Mobile No..");
		return false;
	}
		
}
</script>
</body>
</html>