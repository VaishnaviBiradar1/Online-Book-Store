<jsp:include page="head.jsp"></jsp:include>
<%@ page  import="java.sql.*"%>
<%@ page  import="bookstore.*"%>
<%
String customerid= (session.getAttribute("customer")!=null)?session.getAttribute("customer").toString():null;
String admin=(String) session.getAttribute("admin");
Connection con=Dbconnection.getConnection();
String sql = "select * from bookcategory";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
%>

<div class="site-wrapper" id="top">
        <div class="site-header header-3  d-none d-lg-block">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        
                    </div>
                    <div class="col-lg-8 flex-lg-right">
                        <ul class="header-top-list">
                            <%if(admin==null){ %>
                            <li class="dropdown-trigger language-dropdown"><a href="WishList.jsp"><i
                                        class="icons-left fas fa-heart"></i>
                                    wishlist</a>
                            </li>
                           <%if(customerid!=null){ %>
	                            <li class="dropdown-trigger language-dropdown"><a href="#"><i
	                                        class="icons-left fas fa-user"></i>
	                                    My Account</a><i class="fas fa-chevron-down dropdown-arrow"></i>
	                                <ul class="dropdown-box">
	                                    <li> <a href="Cart.jsp">Cart</a></li>
	                                    <li> <a href="WishList.jsp">WishList</a></li>
	                                    <li> <a href="MyOrders.jsp">My Orders</a></li>
	                                    <%if(customerid!=null) {%>
		                                    <li> <a href="CustomerUpdate.jsp">Update Profile</a></li>
		                                    <li> <a href="ChangePassword.jsp">Change Password</a></li>
		                                    <li> <a href="Logout.jsp">Logout</a></li>
		                                <%}
	                                    else{
	                                    	%>
	                                    		<li> <a href="login.jsp">Login</a></li>
	                                    	<%
	                                    }
	                                    %>
	                                </ul>
	                            </li>
                            <%} %>
                            <li><a href="Cart.jsp"><i class="icons-left fa fa-shopping-cart"></i> Cart</a>
                            </li>
                           <%} %>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="header-middle pt--10 pb--10">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-3">
                            <a href="index.jsp" class="site-brand">
                               <h1><b>Book Mela</b></h1>
                            </a>
                        </div>
                        <div class="col-lg-5">
                            <div class="header-search-block">
                                <input type="text" name="search" id="searchinput" placeholder="Search entire store here">
                                <button id="search">Search</button>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="main-navigation flex-lg-right">
                            <%if(customerid==null && admin==null){ %>
                                <div class="cart-widget">
                                    <div class="login-block">
                                        <a href="login.jsp" class="font-weight-bold">Login</a> <br>
                                        <span>or</span><a href="CustomerRegistration.jsp">Register</a>
                                    </div>
                                       
                               	</div>
                               <%} %>
                                <!-- @include('menu.htm') -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-bottom">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-3">
                            <nav class="category-nav   ">
                                <div>
                                    <a href="javascript:void(0)" class="category-trigger"><i
                                            class="fa fa-bars"></i>Browse
                                        categories</a>
                                    <ul class="category-menu">
                                        
            		 					<%
            		 					int i=0;
            		 					while(rs.next())
										{
            		 						i++;
            		 						if(i<10)
            		 						{
												%>
												<li class="cat-item">
													<a href="BookByCategory.jsp?category=<%=rs.getString(2)%>"><%=rs.getString(2) %></a><br>
												</li>
												<%
            		 						}
            		 						else
            		 						{
												%>
												 <li class="cat-item hidden-menu-item">
												<a href="BookByCategory.jsp?category=<%=rs.getString(2)%>"><%=rs.getString(2) %></a><br>
												</li>
												<%
            		 						}
										}%>
                                        <li class="cat-item"><a href="#" class="js-expand-hidden-menu">More
                                                Categories</a></li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                        <div class="col-lg-3">
                            <div class="header-phone ">
                                <div class="icon">
                                    <i class="fas fa-headphones-alt"></i>
                                </div>
                                <div class="text">
                                    <p>Free Support 24/7</p>
                                    <p class="font-weight-bold number">+01-234-4-567-89</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="main-navigation flex-lg-right">
                                <ul class="main-menu menu-right li-last-0">
                                    <li class="menu-item">
                                        <a href="index.jsp">Home </a>
                                       
                                    </li>
                                    <!-- Shop -->
                                    <li class="menu-item mega-menu">
                                        <a href="AboutUs.jsp">About Us <i
                                                class=""></i></a>
                                       
                                    </li>
                                    <!-- Pages -->
                                    <li class="menu-item has-children">
                                        <a href="javascript:void(0)">Pages <i
                                                class="fas fa-chevron-down dropdown-arrow"></i></a>
                                        <ul class="sub-menu">
                                        	<%if(admin==null){%>
		                                            <li> <a href="Cart.jsp">Cart</a></li>
				                                    <li> <a href="WishList.jsp">WishList</a></li>
				                                    <li> <a href="MyOrders.jsp">My Orders</a></li>
				                                      <%if(customerid!=null) {%>
				                                    <li> <a href="CustomerUpdate.jsp">Update Profile</a></li>
				                                    <li> <a href="ChangePassword.jsp">Change Password</a></li>
				                                    <li> <a href="Logout.jsp">Logout</a></li>
				                                <%}
			                                    else{
			                                    	%>
			                                    		<li> <a href="login.jsp">Login</a></li>
			                                    	<%
			                                   		 }
				                               }
                                        	else{
                                        		%>
	                                            <li> <a href="AddBook.jsp">Add Book</a></li>
			                                    <li> <a href="BookList.jsp">Book List</a></li>
			                                    <li> <a href="Orders.jsp">Orders</a></li>
			                                    <li> <a href="AddCategory.jsp">Add Category</a></li>
			                                    <li> <a href="UserMessages.jsp">User Messages</a></li>
			                                    <li> <a href="Logout.jsp">Logout</a></li>
			                             <% 
                                        	}
			                                    %>
			                                    
                                        </ul>
                                    </li>
                                    <!-- Blog -->
                                    
                                    <li class="menu-item">
                                        <a href="contact.jsp">Contact</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="site-mobile-menu">
            <header class="mobile-header d-block d-lg-none pt--10 pb-md--10">
                <div class="container">
                    <div class="row align-items-sm-end align-items-center">
                        <div class="col-md-4 col-7">
                            <a href="index.jsp" class="site-brand">
                              <h2><b>Book Mela</b></h2>
                            </a>
                        </div>
                        <div class="col-md-5 order-3 order-md-2">
                            <nav class="category-nav   ">
                                <div>
                                    <a href="javascript:void(0)" class="category-trigger"><i
                                            class="fa fa-bars"></i>Browse
                                        categories</a>
                                    <ul class="category-menu">
                                       <%
                                       rs=ps.executeQuery();
            		 					i=0;
            		 					while(rs.next())
										{
            		 						i++;
            		 						if(i<10)
            		 						{
												%>
												<li class="cat-item">
													<a href="BookByCategory.jsp?category=<%=rs.getString(2)%>"><%=rs.getString(2) %></a><br>
												</li>
												<%
            		 						}
            		 						else
            		 						{
												%>
												 <li class="cat-item hidden-menu-item">
												<a href="BookByCategory.jsp?category=<%=rs.getString(2)%>"><%=rs.getString(2) %></a><br>
												</li>
												<%
            		 						}
										}%>
                                   
                                        <li class="cat-item"><a href="#" class="js-expand-hidden-menu">More
                                                Categories</a></li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                        <div class="col-md-3 col-5  order-md-3 text-right">
                            <div class="mobile-header-btns header-top-widget">
                                <ul class="header-links">
                                    <li class="sin-link">
                                        <a href="cart.html" class="cart-link link-icon"><i class="ion-bag"></i></a>
                                    </li>
                                    <li class="sin-link">
                                        <a href="javascript:" class="link-icon hamburgur-icon off-canvas-btn"><i
                                                class="ion-navicon"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!--Off Canvas Navigation Start-->
            <aside class="off-canvas-wrapper">
                <div class="btn-close-off-canvas">
                    <i class="ion-android-close"></i>
                </div>
                <div class="off-canvas-inner">
                    <!-- search box start -->
                    <div class="search-box offcanvas">
                        <form>
                            <input type="text" placeholder="Search Here">
                            <button class="search-btn"><i class="ion-ios-search-strong"></i></button>
                        </form>
                    </div>
                    <!-- search box end -->
                    <!-- mobile menu start -->
                    <div class="mobile-navigation">
                        <!-- mobile menu navigation start -->
                        <nav class="off-canvas-nav">
                            <ul class="mobile-menu main-mobile-menu">
                                <li class="menu-item">
                                    <a href="index.jsp">Home</a>
                                                                  </li>
                                
                                <li class="menu-item  mega-menu">
                                        <a href="AboutUs.jsp">About Us <i
                                                class=""></i></a>
                                       
                                    </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Pages</a>
                                    <ul class="sub-menu">
                                         <%if(admin==null){%>
		                                            <li> <a href="Cart.jsp">Cart</a></li>
				                                    <li> <a href="WishList.jsp">WishList</a></li>
				                                    <li> <a href="MyOrders.jsp">My Orders</a></li>
				                                      <%if(customerid!=null) {%>
				                                    <li> <a href="CustomerUpdate.jsp">Update Profile</a></li>
				                                    <li> <a href="ChangePassword.jsp">Change Password</a></li>
				                                    <li> <a href="Logout.jsp">Logout</a></li>
				                                <%}
			                                    else{
			                                    	%>
			                                    		<li> <a href="login.jsp">Login</a></li>
			                                    	<%
			                                   		 }
				                               }
                                        	else{
                                        		%>
	                                            <li> <a href="AddBook.jsp">Add Book</a></li>
			                                    <li> <a href="BookList.jsp">Book List</a></li>
			                                    <li> <a href="Orders.jsp">Orders</a></li>
			                                    <li> <a href="AddCategory.jsp">Add Category</a></li>
			                                    <li> <a href="UserMessages.jsp">User Messages</a></li>
			                                    <li> <a href="Logout.jsp">Logout</a></li>
			                             <% 
                                        	}
			                                    %>
			                                    
                                    </ul>
                                </li>
                                <li><a href="contact.jsp">Contact</a></li>
                            </ul>
                        </nav>
                        <!-- mobile menu navigation end -->
                    </div>
                    <!-- mobile menu end -->
                    <nav class="off-canvas-nav">
                        <ul class="mobile-menu menu-block-2">
                            
                            <li class="menu-item-has-children">
                                <a href="#">My Account <i class="fas fa-angle-down"></i></a>
                                <ul class="sub-menu">
                                    <%if(admin==null){%>
		                                            <li> <a href="Cart.jsp">Cart</a></li>
				                                    <li> <a href="WishList.jsp">WishList</a></li>
				                                    <li> <a href="MyOrders.jsp">My Orders</a></li>
				                                      <%if(customerid!=null) {%>
				                                    <li> <a href="CustomerUpdate.jsp">Update Profile</a></li>
				                                    <li> <a href="ChangePassword.jsp">Change Password</a></li>
				                                    <li> <a href="Logout.jsp">Logout</a></li>
				                                <%}
			                                    else{
			                                    	%>
			                                    		<li> <a href="login.jsp">Login</a></li>
			                                    	<%
			                                   		 }
				                               }
                                        	else{
                                        		%>
	                                            <li> <a href="AddBook.jsp">Add Book</a></li>
			                                    <li> <a href="BookList.jsp">Book List</a></li>
			                                    <li> <a href="Orders.jsp">Orders</a></li>
			                                    <li> <a href="AddCategory.jsp">Add Category</a></li>
			                                    <li> <a href="UserMessages.jsp">User Messages</a></li>
			                                    <li> <a href="Logout.jsp">Logout</a></li>
			                             <% 
                                        	}
			                                    %>
			                                    
                                </ul>
                            </li>
                        </ul>
                    </nav>
                  
                </div>
            </aside>
            <!--Off Canvas Navigation End-->
        </div>
        <div class="sticky-init fixed-header common-sticky">
            <div class="container d-none d-lg-block">
                <div class="row align-items-center">
                    <div class="col-lg-4">
                        <a href="index.jsp" class="site-brand">
                          	<h2><b>Book Mela</b></h2>
                        </a>
                    </div>
                    <div class="col-lg-8">
                        <div class="main-navigation flex-lg-right">
                            <ul class="main-menu menu-right ">
                                <li class="menu-item">
                                    <a href="index.jsp">Home</a>
                                   
                                </li>
                                <!-- Shop -->
                                 <li class="menu-item  mega-menu">
                                        <a href="AboutUs.jsp">About Us <i
                                                class=""></i></a>
                                       
                                    </li>
                                <!-- Pages -->
                                <li class="menu-item has-children">
                                    <a href="javascript:void(0)">Pages <i
                                            class="fas fa-chevron-down dropdown-arrow"></i></a>
                                    <ul class="sub-menu">
                                      <%if(admin==null){%>
		                                            <li> <a href="Cart.jsp">Cart</a></li>
				                                    <li> <a href="WishList.jsp">WishList</a></li>
				                                    <li> <a href="MyOrders.jsp">My Orders</a></li>
				                                      <%if(customerid!=null) {%>
				                                    <li> <a href="CustomerUpdate.jsp">Update Profile</a></li>
				                                    <li> <a href="ChangePassword.jsp">Change Password</a></li>
				                                    <li> <a href="Logout.jsp">Logout</a></li>
				                                <%}
			                                    else{
			                                    	%>
			                                    		<li> <a href="login.jsp">Login</a></li>
			                                    	<%
			                                   		 }
				                               }
                                        	else{
                                        		%>
	                                            <li> <a href="AddBook.jsp">Add Book</a></li>
			                                    <li> <a href="BookList.jsp">Book List</a></li>
			                                    <li> <a href="Orders.jsp">Orders</a></li>
			                                    <li> <a href="AddCategory.jsp">Add Category</a></li>
			                                    <li> <a href="UserMessages.jsp">User Messages</a></li>
			                                    <li> <a href="Logout.jsp">Logout</a></li>
			                             <% 
                                        	}
			                                    %>
			                                    
                                    </ul>
                                </li>
                                <!-- Blog -->
                                
                                <li class="menu-item">
                                    <a href="contact.jsp">Contact</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    