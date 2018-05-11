<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>

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
	String subject= request.getParameter("subject");
	String isSubjectSave=request.getParameter("isSubjectSave");
	String content = request.getParameter("content");
	String isContentSave = request.getParameter("isContentSave");
	String deleteSubjectFile=request.getParameter("deleteSubjectFile");
	
	BufferedWriter bw=null;
	PrintWriter writer = null;
	PrintWriter coverWriter=null;
	
	String str=null;
 	String plansFilePath = application.getRealPath("/WEB-INF/txtfile/plan.txt");//과목명만 저장
 	boolean isExists=false;
 	
 	String fileName = "/WEB-INF/txtfile/"+subject+".txt";
	String filePath = application.getRealPath(fileName);
	File f;
	
	if(subject!=null)
	{
		if(deleteSubjectFile!=null && deleteSubjectFile.contains("true"))
		{
			bw = new BufferedWriter(new FileWriter(plansFilePath,true));
	 		writer = new PrintWriter(bw,true);
	 		
	 		try{
					BufferedReader reader = new BufferedReader(new FileReader(plansFilePath));
					String result="";
				
					while(true){
						str=reader.readLine();
						if(str==null) break;
						String[] words = str.split(",");
						for(String wo:words){
							if(wo.equals(subject)){
								continue;
							}
							result+=wo+",";
						}
					}
					coverWriter=new PrintWriter(plansFilePath);
					coverWriter.print(result);
					coverWriter.flush();
					coverWriter.close();	
					reader.close();
				}
				catch(Exception e){
					e.printStackTrace();
				}			
		}
		else
		{
	 		 if(isSubjectSave.contains("true"))
	 		 {
	 			BufferedWriter planBw = new BufferedWriter(new FileWriter(plansFilePath,true));//과목명만 이어쓰기
	 		 	PrintWriter planWriter=new PrintWriter(planBw,true);
	 		 	planWriter.print(subject+",");
	 		 	planWriter.flush();
	 		 	planWriter.close();
	 		 	
	 		 	f= new File(filePath);
	 		 	isExists=f.exists();
	 		 	if(isExists==false)
	 				f.createNewFile();
	 		 }
	 		 else
	 		 {

	 	 		try{
	 	 	 		bw = new BufferedWriter(new FileWriter(filePath,true));
	 	 			writer = new PrintWriter(bw,true);
	 	 			
	 				if(isContentSave.contains("true") && isSubjectSave.contains("false"))//이어쓰기 저장
	 			 	{	
	 					if(content!=null){
	 						writer.print(content+",");		
	 						writer.flush();
	 						writer.close();
	 					}
	 			 	}
	 				else //그 단어 제외하고 삭제하기 (덮어쓰기)
	 				{
	 					try{
	 						BufferedReader reader = new BufferedReader(new FileReader(filePath));
	 						
	 						String result="";
	 					
	 						while(true){
	 							str=reader.readLine();
	 							if(str==null) break;
	 							String[] words = str.split(",");
	 							for(String wo:words){
	 								if(wo.equals(content)){
	 									continue;
	 								}
	 								result+=wo+",";
	 							}
	 						}
	 						coverWriter=new PrintWriter(filePath);
	 						coverWriter.print(result);
	 						coverWriter.flush();
	 						coverWriter.close();
	 						reader.close();
	 					}
	 					catch(Exception e){
	 						e.printStackTrace();
	 					} 
	 				}
	 			}catch(Exception e){
	 				out.println("지정된 파일을 찾을 수 없습니다");
	 			}	
	 		 }
		}
 		 

 		
	}
 	
 		
 %>	
</body>
</html>
