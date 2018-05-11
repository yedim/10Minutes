<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String plan = request.getParameter("plan");
	String startMonth = request.getParameter("startMonth");
	String startDay = request.getParameter("startDay");
	String timeHour = request.getParameter("timeHour");
	String timeMin = request.getParameter("timeMin");
	String studyTime = request.getParameter("studyTime");
	
	BufferedWriter bw=null;
	PrintWriter writer = null;
	
	String str=null;
	String filePath = application.getRealPath("/WEB-INF/txtfile/calendar.txt");
 
 	try{
		bw = new BufferedWriter(new FileWriter(filePath,true));
		writer = new PrintWriter(bw,true);
		
		if(plan!=null && startMonth!=null && startDay!=null && timeHour!=null && timeMin!=null && studyTime!=null)
		{
			writer.println(plan+","+startMonth+","+startDay+","+timeHour+","+timeMin+","+studyTime);
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
