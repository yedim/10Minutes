<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10Minute</title>
<style>
	* { margin: 0; padding: 0; } 
</style>
</head>
<body>
<%
	String contentpage=request.getParameter("CONTENTPAGE");

%>
<table width=100% border=1 cellpadding=2 cellspacing=0>
 <tr>
 	<td width=300 height=200>
 	<a href ="Home.jsp">LOGO</a> <br>
 	</td>
 	
 	<td rowspan="2">
	<jsp:include page="<%=contentpage %>"></jsp:include> <!-- contentpage -->
	</td>
	
	<td rowspan="2" width=15%>
	<jsp:include page="SideBar.jsp"></jsp:include> 
	</td>
 </tr>
 <tr>
 	<td width=300px height=700px valign="top" style="background-color: #f1f1f1;">
 	<jsp:include page="Menu.jsp" flush="false"></jsp:include>
 	</td>
 <tr>
 <tr>
 	<td colspan="3" height=50> 
	<jsp:include page="Footer.jsp" flush="false"></jsp:include>
	</td>
 </tr>
 </table>
</body>
</html>
