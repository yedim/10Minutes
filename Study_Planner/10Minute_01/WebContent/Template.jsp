<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 
<title>10Minute</title>
<style>
	* { margin: 0; padding: 0; } 
	
	.gradient {
	width: 100%;
	height: 50px;
	color: #fff;
	background: linear-gradient(-45deg, #668dcc,#7cadcd, #c7def6);
	background-size: 400% 400%;
	-webkit-animation: Gradient 15s ease infinite;
	-moz-animation: Gradient 15s ease infinite;
	animation: Gradient 15s ease infinite;
}

@-webkit-keyframes Gradient {
	0% {background-position: 0% 50%}
	50% {background-position: 100% 50%}
	100% {background-position: 0% 50%}
}

@-moz-keyframes Gradient {
	0% {background-position: 0% 50%}
	50% {background-position: 100% 50%}
	100% {background-position: 0% 50%}
}

@keyframes Gradient {
	0% {background-position: 0% 50%}
	50% {background-position: 100% 50%}
	100% {background-position: 0% 50%}
}
	
</style>
</head>
<body>
<%
	String contentpage=request.getParameter("CONTENTPAGE");

%>
<center><table width=1260px cellpadding=2 cellspacing=0></center>
<tr>
	<td colspan="3"><div class="gradient"></td>
</tr>
 <tr>
 	<td width=170px height=150px >
 	<%
	String checkName=null;
	String checkId=null;
	
	checkName=(String)session.getAttribute("s_Name");
	checkId=(String)session.getAttribute("s_ID");
	
	if(checkId==null || checkId.equals(""))//이름없거나null이면
	{
		%>
		<center><a href ="Login.jsp">Login</a></center>
	<%}
	else
	{
		%>
		<center><h6><%=checkName%>님 안녕하세요.</h6></center>
		<center><a href ="Logout.jsp">LogOut</a></center>
<%
	}
%>
 	</td>
 	
 	<td rowspan="2" class="w3-light-grey">
	<jsp:include page="<%=contentpage %>"></jsp:include> <!-- contentpage -->
	</td>
	
	<td rowspan="2" width=15%>
	<jsp:include page="SideBar.jsp"></jsp:include> 
	</td>
 </tr>
 <tr>
 	<td width=170px height=610px valign="top">
 	<jsp:include page="Menu.jsp" flush="false"></jsp:include>
 	</td>
 <tr>
 <tr>
 	<td colspan="3" height=50 style="background-color:#34495e"> 
	<jsp:include page="Footer.jsp" flush="false"></jsp:include>
	</td>
 </tr>
 </table>
</body>
</html>
