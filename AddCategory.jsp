<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
tr{
	text-align: center;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="LogCheckAdmin.jsp"></jsp:include>
<section class="breadcrumb-section">
            <h2 class="sr-only">Site Breadcrumb</h2>
            <div class="container">
                <div class="breadcrumb-contents">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item active">Add Category</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </section>
  <main class="contact_area inner-page-sec-padding-bottom">
            <div class="container">
            	<div class="row">
            		<div class="col-md-12"><label style="font-size: 18px"><b>Enter Category Name:</b></label></div>
            		<div class="col-md-8"><input type="text" name="category" id="category" class="form-control"></div>
            		<div class="col-md-4"><button id="add" class="btn btn-primary">Add</button></div>
            		
            		<br>
            		<div class="col-md-12">
            			<br>
            			<br>
            			<table class="table">
							<thead class="thead-dark">
								<tr>
									<th>Sr No.</th>
									<th>Category</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody id="categoryTable">	
							</tbody>
						</table>
            		</div>
            	</div>
   			</div>
  </main>
<jsp:include page="footer.jsp"></jsp:include>

<script>
	loadCategory();
	$('#add').click(function(){
		var category=$('#category').val();
		if(category=="")
			alert("Enter Category");
		else{
			$.ajax({
				url : 'AddCategorydb.jsp',
				data : "add="+category,
				success : function(result){
					 
			    	var obj = JSON.parse(result.trim());
					
					if(obj.id=='1')
						alert("inserted Successfully..");
					else
						alert("problem ocurred try again..");
					$('#category').val('');
					loadCategory();
				}
			});
		}
		
	});
	
	function loadCategory(){
		$.ajax({
			url : 'LoadCategory.jsp',
			success : function(result){
				$('#categoryTable').html(result);
			}
		});
	}
</script>
</body>
</html>