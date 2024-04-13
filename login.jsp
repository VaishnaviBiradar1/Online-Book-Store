<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<form action="logindb.jsp" method ="post">
	<div class="container">
		<div class="row" style="padding:120px; text-align: center;">
			<div class="col-md-2"></div>
			<div class="col-md-2" style="text-align: center;">
				<h5><b>Username :</b></h5><br><br>
				<h5><b>Password :</b></h5>
			</div>
			<div class="col-md-6">
				<input type="text" class="form-control" name="userName"><br><br>
				<input type="password" class="form-control" name="password">
				<br><br>
			</div>
			<div class="col-md-2"></div>
			
			
			 <div class="col text-center">
				<button class="btn btn-primary">Submit</button>
			</div>
		</div>
	</div>
</form>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>