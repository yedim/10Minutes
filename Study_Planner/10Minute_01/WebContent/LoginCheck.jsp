<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	String userID="id";
	String userPW="pw";
	String userName="예림";
	
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	
	if(userID.equals(id) && userPW.equals(pw))
	{
		session.setAttribute("s_Name", userName);
		session.setAttribute("s_ID", userID);
		response.sendRedirect("Home.jsp");//로그인성공
		
	}
	else
	{%>
		<script>
			alert("로그인 실패");
			history.go(-1);//이전페이지로
		</script>
	<%}
%>
</body>
</html>
