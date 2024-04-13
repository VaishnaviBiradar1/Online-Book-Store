<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File" %>
<%@ page  import="java.sql.*"%>
<%@ page  import="bookstore.*"%>
    
<jsp:include page="LogCheckAdmin.jsp"></jsp:include>
<%

String newpath="E:/studproj/OnlineBookStore/WebContent/BookImages/";
String temppath="E:/studproj/OnlineBookStore/WebContent/TempBookImages/";
String setpath="0";

MultipartRequest m=new MultipartRequest(request,temppath,10024*1024);
String bookTitle = m.getParameter("bookTitle");

String photo=m.getFilesystemName("photo");
if(photo!=null)
{
	
	String mvdPath=newpath+"/"+bookTitle;
	File mvd=new File(mvdPath);
	
	File  imagelocation=new File(mvdPath+"/"+photo);
	if(!imagelocation.exists())
	{
     	mvd.mkdirs();	
     	if(!imagelocation.exists())
     	{
     		
     		String mvimage=temppath+photo;
     		File temporary=new File(mvimage);
     		if(temporary.renameTo(imagelocation))
     		{
     			setpath=bookTitle+"/"+photo;
     		}
     		
     	} 
	}
	else
	{
		
		if(imagelocation.exists())
     	{
			
     		String mvimage=temppath+photo;
     		File temporary=new File(mvimage);
     		if(temporary.renameTo(imagelocation))
     		{
     			setpath=bookTitle+"/"+photo;
     		}
     		
     	} 
	}
}
	String[] category=m.getParameterValues("bookCategory");
	String bookCategory="";
	for(int i=0;i<category.length;i++)
	{
		bookCategory +=category[i]+",";	
	}
	Connection con=Dbconnection.getConnection();
	String sql="insert into addbook(bookcategory, booktitle, booksubtitle, authorname, photopath, quantity, description, price, relevantwords, discount,date) values(?,?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps= con.prepareStatement(sql);
	ps.setString(1,bookCategory);
	ps.setString(2,m.getParameter("bookTitle"));
	ps.setString(3,m.getParameter("bookSubTitle"));
	ps.setString(4,m.getParameter("authorName"));
	ps.setString(5,setpath);
	ps.setString(6,m.getParameter("quantity"));
	ps.setString(7,m.getParameter("Description").trim());
	ps.setString(8,m.getParameter("price"));
	ps.setString(9,m.getParameter("relevantWords").trim());
	ps.setString(10,m.getParameter("discount"));
	ps.setString(11,m.getParameter("date"));
	
	int check = ps.executeUpdate();
	if(check>0){
		%>
			<script>
				alert("Inserted Successfully..");
				location.href = 'AddBook.jsp';
			</script>
		<%
	}
	else{
		%>
		<script>
			alert("Problem Occured try again..");
			location.href = 'AddBook.jsp';
		</script>
	<%
	}
	
%>