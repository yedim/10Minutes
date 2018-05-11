<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<style>


#h11{
	font-family: 'Open Sans';
	font-weight: 300;
	text-align: center;
	position: absolute;
	top: 45%;
	right: 0;
	left: 0;
}
#h44{
	font-family: 'Open Sans';
	font-weight: 300;
	text-align: center;
	position: absolute;
	top: 55%;
	right: 0;
	left: 0;
}
#btn{
 	background-color: #7cadcd;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 17px;
    margin: 4px 2px;
    cursor: pointer;

}
</style>
<body>
<h1 id="h11">10Minutes</h1>
<h4 id="h44">"10 minutes will bring about enormous changes."</h4>
<center><button id="btn">
 <%
	String checkName=null;
	String checkId=null;
	
	checkName=(String)session.getAttribute("s_Name");
	checkId=(String)session.getAttribute("s_ID");
	
	if(checkId==null || checkId.equals(""))//이름없거나null이면
	{
		%>
		<a href ="Login.jsp">Start</a>
	<%}
	else
	{
		%>
		<a href ="Home.jsp">Start</a>
<%
	}
%>
</button></center>
 </body>	
</html>
