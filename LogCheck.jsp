
<%
String check = (String)session.getAttribute("customer");
try
{
	
	if(check!=null)
	{
	}
	else
	{
		
		out.print("<script>");
		out.print("location.href='login.jsp';");
		out.print("</script>");
	}
}
catch(Exception e)
{
	out.print("<script>");
	out.print("location.href='login.jsp';");
	out.print("</script>");
}
%>