 <!--=================================
    Footer Area
===================================== -->

        
        <div class="footer-bottom">
            <div class="container">
                <p class="copyright-heading">We Provides The best Quality of books within 7-days after order.</p>
         		<h4 style="color:white;">Government Residential Women's Polytechnic, Latur-413512</h4>
                <p class="copyright-text">Copyright © 2021 <a href="#" class="author">Book Mela</a>. All Right Reserved.
                    <br>
                    Designed By Aditi and Group</p>
            </div>
        </div>
    </footer>
    <!-- Use Minified Plugins Version For Fast Page Load -->
    <script src="js/plugins.js"></script>
    <script src="js/ajax-mail.js"></script>
    <script src="js/custom.js"></script>
    
    <script>
    	$("#search").click(function(){
    		var value=$('#searchinput').val();
    		$.ajax({
    			url:'Search.jsp?search='+value,
    			success:function(result){
    				$('body').html(result);
    			}
    		});
    	});
    </script>