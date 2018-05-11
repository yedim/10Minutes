<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>PLAN</title>
<style type="text/css">
#hidden
{
	width:1px;
	height:1px;
	border:0;
}
.close {
	border:none;
  padding: 0px;
}

.close:hover {
  background-color: #7cadcd;
  color: white;
}

</style>

<script type="text/javascript">

 /* 할일 추가 */
function createPlan()
{
  	var para = document.createElement("li");
  	var ss= document.getElementById("addText").value;//input text에 적은 할일 가져오고
  	var t = document.createTextNode(ss);
  	var subjectName = document.getElementById("selectPlan").value;
  	para.className="w3-padding-16";
  	para.setAttribute('id',"plan"+ss); 
  	para.appendChild(t);
  	document.getElementById("subjectUl"+subjectName).appendChild(para);
	
	 var deletebtn = document.createElement("button");
	 var txt = document.createTextNode("x");
	 deletebtn.className = "close";
	 deletebtn.setAttribute('id',"deleteplan"+subjectName+ss);
	 deletebtn.appendChild(txt);
	 deletebtn.onclick=function(){deletePlan(subjectName,ss)};
	 document.getElementById("plan"+ss).appendChild(deletebtn);
  	
  	form = document.fileSend;
  	form.subject.value= subjectName;//일단 임의로 과목명 가져오고
  	form.isSubjectSave.value="false";
	form.content.value = ss;
	form.isContentSave.value="true";
	form.deleteSubjectFile.value=null;
	form.target = "hiddenifr";                                                
	form.submit();                                                             

	alert(subjectName+"계획이 추가 되었습니다.");
}
 /* 파일에 있는 기존 과목추가 */
 function createExistSubject(subjectName)
 {
	 //div
	 var Div = document.createElement("div");
	 Div.className="w3-third w3-margin-bottom";
	 Div.setAttribute('id',"subject"+subjectName);
	 document.getElementById("divSubject").appendChild(Div);
	 
	//ul
	 var childUl=document.createElement("ul");
	 childUl.className="w3-ul w3-border w3-center w3-hover-shadow";
	 childUl.setAttribute('id',"subjectUl"+subjectName); 
	 document.getElementById("subject"+subjectName).appendChild(childUl);
	
	 //li(과목명)	 
	 var childSubjectLi = document.createElement("li");
	 var childSubjectLi_text = document.createTextNode(subjectName);
	 childSubjectLi.className="w3-blue-grey w3-xlarge w3-padding-32"
	 childSubjectLi.setAttribute('id',"subjectName"+subjectName); 
	 childSubjectLi.appendChild(childSubjectLi_text);
	 document.getElementById("subjectUl"+subjectName).appendChild(childSubjectLi);
	
	 var deletebtn = document.createElement("button");
	 var txt = document.createTextNode("x");
	 deletebtn.className = "close";
	 deletebtn.setAttribute('id',"deletesubject"+subjectName);
	 deletebtn.appendChild(txt);
	 deletebtn.onclick=function(){deleteSubject(subjectName)};
	 document.getElementById("subjectName"+subjectName).appendChild(deletebtn); 
	 
}
 
/* 과목 추가 */
function createSubject()
{
	var subjectName= document.getElementById("modalInputText").value;
	
	//div
	 var Div = document.createElement("div");
	 Div.className="w3-third w3-margin-bottom";
	 Div.setAttribute('id',"subject"+subjectName); /* subject+cnt */
	 document.getElementById("divSubject").appendChild(Div);
	 
	 //ul
	 var childUl=document.createElement("ul");
	 childUl.className="w3-ul w3-border w3-center w3-hover-shadow";
	 childUl.setAttribute('id',"subjectUl"+subjectName); 
	 document.getElementById("subject"+subjectName).appendChild(childUl);
	
	 //li(과목명)	 
	 var childSubjectLi = document.createElement("li");
	 var childSubjectLi_text = document.createTextNode(subjectName);
	 childSubjectLi.className="w3-blue-grey w3-xlarge w3-padding-32"
	 childSubjectLi.setAttribute('id',"subjectName"+subjectName); 
	 childSubjectLi.appendChild(childSubjectLi_text);
	 document.getElementById("subjectUl"+subjectName).appendChild(childSubjectLi);
	
	form = document.fileSend;
	form.subject.value= document.getElementById("subjectName"+subjectName).innerHTML;
	form.isSubjectSave.value="true";
	form.content.value =null;
	form.isContentSave.value="true";
	form.deleteSubjectFile.value=null;
	form.target = "hiddenifr";                                                
	form.submit();                        
	
	//할일 추가할 때 모달에 넣음
	var optionsubject = document.createElement("option");
	var optionsubject_text=document.createTextNode(subjectName);
	optionsubject.setAttribute("value",subjectName);
	optionsubject.appendChild(optionsubject_text);
	document.getElementById("selectPlan").appendChild(optionsubject);
	
	 var deletebtn = document.createElement("button");
	 var txt = document.createTextNode("x");
	 deletebtn.className = "close";
	 deletebtn.setAttribute('id',"deleteplan"+subjectName+planWo);
	 deletebtn.appendChild(txt);
	 deletebtn.onclick=function(){deletePlan(subjectName,planWo)};
	 document.getElementById("plan"+planWo).appendChild(deletebtn);

	alert(subjectName+"과목이 추가 되었습니다.");
	
}
function createExistPlan(subjectName,planWo)
{
	var existli=document.createElement("li");
	var existli_text = document.createTextNode(planWo);
	existli.className="w3-light-grey w3-padding-24";
	existli.setAttribute('id',"plan"+planWo);
	existli.appendChild(existli_text);
	document.getElementById("subjectUl"+subjectName).appendChild(existli);
	
 	 var deletebtn = document.createElement("button");
	 var txt = document.createTextNode("x");
	 deletebtn.className = "close";
	 deletebtn.setAttribute('id',"deleteplan"+subjectName+planWo);
	 deletebtn.appendChild(txt);
	 deletebtn.onclick=function(){deletePlan(subjectName,planWo)};
	 document.getElementById("plan"+planWo).appendChild(deletebtn);

}
function deletePlan(subjectName,planWo)
{
	var li =document.getElementById("plan"+planWo);
	document.getElementById("subjectUl"+subjectName).removeChild(li); 
	
	form = document.fileSend;
	form.subject.value=subjectName;
	form.isSubjectSave.value=null;
	form.content.value = planWo;
	form.isContentSave.value="false";
	form.deleteSubjectFile.value=null;
	form.target = "hiddenifr";                                                
	form.submit();
	
	alert(planWo+"삭제");	
}

function deleteSubject(subjectName)
{
	var div =document.getElementById("subject"+subjectName);
	document.getElementById("divSubject").removeChild(div); 
	
	form = document.fileSend;
	form.subject.value=subjectName;
	form.isSubjectSave.value=null;
	form.content.value = null;
	form.isContentSave.value="false";
	form.deleteSubjectFile.value="true";
	form.target = "hiddenifr";                                                
	form.submit();
}


</script>
</head>
<body>
<%
	String checkName=null;
	String checkId=null;
	
	checkName=(String)session.getAttribute("s_Name");
	checkId=(String)session.getAttribute("s_ID");
	
	if(checkId==null || checkId.equals(""))//이름없거나null이면
	{
		%>
		<script>
		location.href="Login.jsp";
		</script>
	<%}
%>
<form method="post" name="fileSend" action="PlanSave.jsp">
	<input type="hidden" name="subject" value="">
	<input type="hidden" name="isSubjectSave" value="">
	
	<input type="hidden" name="content" value="">
	<input type="hidden" name="isContentSave" value="">
	<input type="hidden" name="deleteSubjectFile" value="">
</form>

<iframe id="hidden" name="hiddenifr" src="PlanSave.jsp"></iframe>

<!-- 과목/주제들 -->
<div class="w3-row-padding" id="divSubject" >
	
    <!-- 파일 읽기 -->
    <%
		String readfilePath = application.getRealPath("/WEB-INF/txtfile/plan.txt");
		BufferedReader reader = new BufferedReader(new FileReader(readfilePath));
		String str=null;
		ArrayList<String> subjectList = new ArrayList<String>();
		
		while(true)
		{
			str=reader.readLine();
			if(str==null) break;
			if(str.equals(" ")) break;
			String[] words = str.split(",");
			for(String wo:words)
			{
			%>
				<script type="text/javascript">
				createExistSubject('<%=wo %>');
				/*과목들 적고 있음*/
				</script> 
			<%
			subjectList.add(wo);
			}
		}
			
			for(int i=0; i<subjectList.size();i++)
			{
			   String planfilePath= application.getRealPath("/WEB-INF/txtfile/"+subjectList.get(i)+".txt");//파일 안에 들어있는 할일목록 불러오기
			   BufferedReader planReader = new BufferedReader(new FileReader(planfilePath));
			   String planStr=null;
			   
			   while(true)
			   {
				   planStr=planReader.readLine();
				   if(planStr==null) break;
				   String[] planWords = planStr.split(",");
					for(String planWo:planWords)
					{
					%>
					<script type="text/javascript">
					createExistPlan('<%=subjectList.get(i)%>','<%=planWo%>');
					/*파일에 있는 아이들*/
					</script>
					<%	
					}
		   	   } 
			}
		
	%> 	
  </ul>
</div>

</div>

<!-- 모달(과목 추가창) -->
<div class="w3-container">
<button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-medium w3-black w3-margin">과목추가</button>
<div id="id01" class="w3-modal">
 <div class="w3-modal-content w3-card-4 w3-animate-zoom">
  <header class="w3-container w3-sand"> 
   <span onclick="document.getElementById('id01').style.display='none'" 
   class="w3-button w3-sand w3-xlarge w3-display-topright">&times;</span>
   <h3>과목추가</h3>
  </header>

  <div class="w3-container">
  <h5>과목을 입력하세요</h5>
  <input class="w3-input" type="text" id="modalInputText">
  <br>
   </div>

	
  <div class="w3-container w3-light-grey w3-padding">
   <button class="w3-button w3-bar w3-white w3-border" 
   onclick="document.getElementById('id01').style.display='none'; createSubject()" >추가</button>
  </div>
 </div>
</div>
</div>

<!-- 모달(할일 추가창) -->
<div class="w3-container">
<button onclick="document.getElementById('id02').style.display='block'" class="w3-button w3-medium w3-black w3-margin" >할일추가</button>
<div id="id02" class="w3-modal">
 <div class="w3-modal-content w3-card-4 w3-animate-zoom">
  <header class="w3-container w3-sand"> 
   <span onclick="document.getElementById('id02').style.display='none'" 
   class="w3-button w3-sand w3-xlarge w3-display-topright">&times;</span>
   <h3>할일추가</h3>
  </header>

	
  <div class="w3-container">
  	<h4>계획목록</h4>
  	
  <select class="w3-select" name="option" id="selectPlan" style="margin-bottom:30px">
  	<%
		BufferedReader br = new BufferedReader(new FileReader(readfilePath));
		String ss=null;

		%>
		<option value="" disabled selected>Choose your subject</option>
		<%
		while(true)
		{
			ss=br.readLine();
			if(ss==null) break;
			if(ss.equals(" ")) break;
			String[] words = ss.split(",");
			for(String wo:words)
			{
			%>
				 <option value=<%=wo%>><%=wo%></option>		 
			<% 
			}
		}
  	%>    
   
  </select>
  
  	<h5>할 일을 입력하세요</h5>
  	<input class="w3-input" type="text" id="addText">
  	<br>
   </div>
	
  <div class="w3-container w3-light-grey w3-padding">
   <button id="createPlan" class="w3-button w3-bar w3-white w3-border" 
   onclick="document.getElementById('id02').style.display='none'; createPlan()" >추가</button>
  </div>
 </div>
</div>
</div>

</body>
</html>
