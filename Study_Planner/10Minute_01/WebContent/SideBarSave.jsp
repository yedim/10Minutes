<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
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
	request.setCharacterEncoding("UTF-8");
	String content = request.getParameter("content");
	

	BufferedWriter bw=null;
	PrintWriter writer = null;
	
	String str=null;
	String filePath = application.getRealPath("/WEB-INF/txtfile/dday.txt");
 
 	try{
		bw = new BufferedWriter(new FileWriter(filePath,true));
		writer = new PrintWriter(bw,true);
		
		if(content!=null)
		{
			writer.print(content+",");	/* 뮴뮤뮤뮤 */	
			writer.flush();
			writer.close();
		}
		
	}catch(Exception e)
	{
		out.println("지정된 파일을 찾을 수 없습니다");
	}
	
	
%>
</body>
</html>
