<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	ul {
		text-align:center;
	    list-style-type: none;
	    margin: 0;
	    padding: 0;
	    width: 300px;
	    background-color: #f1f1f1;
	}
	
	li a {
	    display: block;
	    color: #000;
	    padding: 8px 16px;
	    text-decoration: none;
	}

	li a:hover:not(.active) {
	    background-color: #555;
	    color: white;
	}
	
</style>

</head>
<body>

<ul>
	<li><a href ="Home.jsp">HOME</a></li>
	<li><a href ="Calendar.jsp">Calendar</a></li>
	<li><a href ="Plan.jsp">Plan</a></li>
	<li><a href ="MyPage.jsp">Mypage</a></li>
</ul>

</body>
</html>
