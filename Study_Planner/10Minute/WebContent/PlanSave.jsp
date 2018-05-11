<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.util.Date"%>
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
	
	Date date = new Date();
	Long time = date.getTime();
	
	BufferedReader reader = null;
	PrintWriter writer = null;
	
	String str=null;
	String readfilePath = application.getRealPath("/WEB-INF/plan.txt"); 
	String writefilePath = application.getRealPath("/WEB-INF/textfile/createPlan.txt");
 
	//읽기
 	try{
		reader = new BufferedReader(new FileReader(writefilePath));
		writer = new PrintWriter(writefilePath);
		
		while(true)
		{
			str=reader.readLine();
			if(str==null) break;
			writer.print(str+",");
		}
		
	}catch(Exception e)
	{
		out.println("지정된 파일을 찾을 수 없습니다");
	}
	
	try{
		/* writer.printf("내용 : %s %n", content); */
		
		writer.print(content);		
		writer.flush();
		writer.close();
		
	}catch(Exception e)
	{
		out.println("오류 발생");
	}  
	
/* 	try{
		writer = new PrintWriter(readfilePath);
		writer.print(result);
		writer.print(content);		
		writer.flush();
		
	}catch(Exception e)
	{
		out.println("오류 발생");
	}   */
	
%>
</body>
</html>
