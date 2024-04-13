<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="LogCheck.jsp"></jsp:include>
<form action="ChangePassworddb.jsp" method ="post">
	<div class="container">
		<div class="row" style="padding:120px; text-align: center;">
			<div class="col-md-2"></div>
			<div class="col-md-3" style="text-align: center;">
				<h5><b>Current Password : </b></h5><br><br>
				<h5><b>New Password : </b></h5><br><br>
				<h5><b>Confirm Password : </b></h5>
			</div>
			<div class="col-md-6">
				<input type="password" class="form-control" name="oldpass"><br><br>
				<input type="password" class="form-control" name="password" id="pass"><br><br>
				<input type="password" class="form-control" name="cpass" id="cpass">
				<br><br>
			</div>
			<div class="col-md-2"></div>
			
			
			 <div class="col text-center">
				<button class="btn btn-primary" onclick="return checkPassword()">Submit</button>
			</div>
		</div>
	</div>
</form>
<jsp:include page="footer.jsp"></jsp:include>

<script>
function checkPassword(){
	if($("#pass").val()==$("#cpass").val())
		return true;
	else{
		alert("New Password and confirm Password not Matched...");
		return false;
	}
}
</script>
</body>
</html>