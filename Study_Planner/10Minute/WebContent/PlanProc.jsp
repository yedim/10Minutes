<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
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
</style>
<script type="text/javascript">
function createPlan()
{
	
  var para = document.createElement("li");
  var ss= document.getElementById("addText").value;
  var t = document.createTextNode(ss);
  para.appendChild(t);
  document.getElementById("basic").appendChild(para);
  
  	form = document.fileSend;
	form.content.value = ss;                                            
	form.target = "hiddenifr";                                                
	form.submit();                                                             

	alert("추가 되었습니다."); 
}

function send()
{
	form = document.fileSend;
	form.content.value = "dd";                                            
	form.target = "hiddenifr";                                                
	form.submit();                                                             

	alert("추가 되었습니다."); 

}




</script>
</head>
<body>
<!-- <form action="PlanSave.jsp" method="post">
내용 : <input type= "text" name="content"><br>
	<input type="submit" value="저장">
</form>
 -->
<form method="post" name="fileSend" action="PlanSave.jsp">
	<input type="hidden" name="content" value="">
	<input type="button" value="send" onclick="send()">
	
</form>

<iframe id="hidden" name="hiddenifr" src="PlanSave.jsp"></iframe>


<div class="w3-row-padding">

<div  class="w3-third w3-margin-bottom">
  <ul id="basic" class="w3-ul w3-border w3-center w3-hover-shadow">
    <li class="w3-black w3-xlarge w3-padding-32">Basic</li>
    <li class="w3-padding-16"><b>10GB</b> Storage</li>
   

  </ul>
  <ul  class="w3-ul w3-border w3-center w3-hover-shadow">
    <li class="w3-light-grey w3-padding-24">
      <input type="text" id="addText"> <!-- text -->
      <button id="createPlan" onclick="createPlan()" class="w3-button w3-green w3-padding-large">추가</button>
    </li>
  </ul>
</div>

<div class="w3-third w3-margin-bottom">

  <ul class="w3-ul w3-border w3-center w3-hover-shadow">
    <li class="w3-green w3-xlarge w3-padding-32">Pro</li>
    <li class="w3-padding-16"><b>25GB</b> Storage</li>
    <li class="w3-light-grey w3-padding-24">
    
      <button class="w3-button w3-green w3-padding-large">추가</button>
    </li>
  </ul>
</div>

<div class="w3-third w3-margin-bottom">
  <ul class="w3-ul w3-border w3-center w3-hover-shadow">
    <li class="w3-black w3-xlarge w3-padding-32">Premium</li>
    <li class="w3-padding-16"><b>50GB</b> Storage</li>
    <li class="w3-light-grey w3-padding-24">
      <button class="w3-button w3-green w3-padding-large">추가</button>
    </li>
  </ul>
</div>

</div>
</body>
</html>
