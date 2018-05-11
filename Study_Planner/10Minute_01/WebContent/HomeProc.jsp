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
<title>HOME</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <link rel="stylesheet" href="Home.css">

</head>
<script type="text/javascript">
window.onload=function()
{
  timetableDiv();
}

function todayDate()
{
	var d = new Date();
	
	var h2= document.createElement("h2");
	var h2_text = document.createTextNode(d.getFullYear()+"."+(d.getMonth()+1)+"."+d.getDate());
	h2.appendChild(h2_text);
	document.getElementById("todayDate").appendChild(h2);
}
function timetableDiv(){
  var hour=7;
  var idValue;
  var printValue;

  var childDiv;
  var childDiv_text;
  for(i=0; i<20;i++){
    for(j=10; j<=60; j+=10){
      idValue=hour+'-'+j;
      printValue=hour+'-'+j;
      // document.write("<div class='class' id='class'+hour+'-'+j onmousedown='testfunc(this)'>"+printValue+"</div>");
      childDiv=document.createElement("div");
      //childDiv_text=document.createTextNode(printValue);
      childDiv.className="class";
      childDiv.setAttribute('id',idValue);
       //childDiv.appendChild(childDiv_text);
      document.getElementById("ex").appendChild(childDiv);
    }
    hour++;
  }
}

function finish()
{
  var i;
  var j;
  var selectedDiv;
  var selectedId=document.getElementById("selectedDiv");
  var studyTime=0;
  
  selectedId.innerHTML="";
  for(i=7; i<=24;i++)
  {
    for(j=10; j<=60;j+=10)
    {
      selectedDiv = document.getElementById(i+"-"+j);
      if(selectedDiv.style.color=="white")//색상비교
      {
    	  studyTime+=10;
      }
    }
  }
  selectedId.innerHTML+="나의 총 공부시간 : "+studyTime+"분";

}

function createTodayPlan(subjectText1,startDaytext3,startTime4,startTime5,studyTime6)
{
	var d = new Date();
    var n = d.getDate();
    
	if(startDaytext3==n)//오늘 것만 가져오기
	{
		var plan = document.createElement("INPUT");
		var planlabel=document.createElement("label");//여기에 글쓰기
		var s;
		var subjectText;
		var startDaytext;
		var startTime;
		var studyTime;
		subjectText=subjectText1;
		startDaytext=startDaytext3;
		startTime=startTime4+":"+startTime5;
		studyTime=studyTime6;
		
		var plan_text=document.createTextNode(startTime+" "+subjectText+" "+studyTime+"분");
		plan.className="w3-radio";
		plan.setAttribute('type','radio');
		plan.setAttribute('value',startTime4+"-"+startTime5+"-"+studyTime);//시-분-공부시간
		plan.setAttribute('name','radioplan');
		plan.setAttribute('id',startTime4+"-"+startTime5+"-"+subjectText+"-"+studyTime);//시-분-과목-공부시간
		
		plan.style.color="black";
		document.getElementById("taskId").appendChild(plan);
		
		planlabel.setAttribute('id',startTime4+"-"+startTime5+"-"+studyTime);
		planlabel.appendChild(plan_text);
		document.getElementById("taskId").appendChild(planlabel);
		  	
		var br = document.createElement("br");
		document.getElementById("taskId").appendChild(br);
		
	}
}
function completePlan()
{
	var radioplan = document.getElementsByName("radioplan");//체크된 라디오 값 가져오기
	var radioString;
	var radioSplit;
	var radiolabel;
	
	var hour;
	var minute;
	var studyTime;
	for(var i=0; i<radioplan.length;i++)
	{
		if(radioplan[i].checked==true)
		{
			radioString=radioplan[i].value;
			radioSplit=radioString.split('-');
			 for ( var i in radioSplit ) {
				 if(i==0){hour=radioSplit[i];}
				 else if(i==1){minute=radioSplit[i];}
				 else if(i==2){studyTime=radioSplit[i];}
			 }
		}
	}
	radiolabel=document.getElementById(hour+"-"+minute+"-"+studyTime);
	radiolabel.style.backgroundColor="#7cadcd";
	
	var timetable;
	var i;
	 for(i=parseInt(minute)+10; i<=parseInt(minute)+parseInt(studyTime);i+=10)
	{ 
		if(i%60==0)
		{
			timetable = document.getElementById(hour+"-"+60);
			timetable.style.backgroundColor="#7cadcd";
			timetable.style.color="white";
			hour++;
		}
		else
		{
			timetable = document.getElementById(hour+"-"+(i%60));
			timetable.style.backgroundColor="#7cadcd"; 
			timetable.style.color="white";
		} 
	}   
}

</script>
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

<div class="w3-container w3-margin-bottom"  >
	<div class="w3-card-4" style="background-color: white;">
		<div class="w3-container" id="todayDate">
		
		</div>
		<script>
		todayDate();
		</script>
		  <div class="w3-row">
	  		<div class="w3-col w3-left" style="width:45%;color:black">
		      <div class="w3-container">
		  		 <h3>Today's Point</h3>
		  		 <h5>"너는 왜 평범하게 노력하는가. 시시하게 살기를 원치 않으면서" -존 F.케네디</h5>
			 </div>
			 <div class="w3-container w3-padding-32" id="taskId">
			  <h3>Task</h3>
			  			  
 			   
 				<%
				String calendarFilePath = application.getRealPath("/WEB-INF/txtfile/calendar.txt");
				BufferedReader calendarReader = new BufferedReader(new FileReader(calendarFilePath));
				String ss=null;
				String calendarStr=null;
			 	ArrayList<String> calendarlist = new ArrayList<String>();
			 
			 	int nn=1;
			 	while(true)
				{
					ss=calendarReader.readLine();
					if(ss==null) break;
					if(ss.equals(" ")) break;
					String[] words = ss.split(",");
					for(String wo:words)
					{
						calendarlist.add(wo);
					
						if(nn%6==0)
						{
						%>
							<script>
							createTodayPlan('<%=calendarlist.get(0) %>','<%=calendarlist.get(2) %>','<%=calendarlist.get(3) %>','<%=calendarlist.get(4) %>','<%=calendarlist.get(5) %>');
							</script>
						<%
							calendarlist.clear();
						}
			
						nn++;
					}
				}
				calendarReader.close();
	
			%>
			  <button class="w3-btn w3-light-grey w3-margin-top" onclick="completePlan()">공부완료</button></p>
			</div>
		   </div>
		   
		    <div class="w3-col w3-left" style="width:55%;color:black">
		      <div class="w3-container">
		  		 <h3>TimeTable</h3>
		  		 <div class="scroll" id="ex">
				    <div class="day time">
				    	<div class="hour" style="background-color: #34495e">Time</div>
				    	<div class="hour">7:00</div>
				    	<div class="hour">8:00</div>
				    	<div class="hour">9:00</div>
				    	<div class="hour">10:00</div>
				    	<div class="hour">11:00</div>
				    	<div class="hour">12:00</div>
				    	<div class="hour">13:00</div>
				    	<div class="hour">14:00</div>
				    	<div class="hour">15:00</div>
				    	<div class="hour">16:00</div>
					    <div class="hour">17:00</div>
					    <div class="hour">18:00</div>
					    <div class="hour">19:00</div>
					    <div class="hour">20:00</div>
					    <div class="hour">21:00</div>
					    <div class="hour">22:00</div>
					    <div class="hour">23:00</div>
					    <div class="hour">24:00</div>
					    <div class="hour">01:00</div>
					    <div class="hour">02:00</div>
					    
				    </div>
				
				      <div class="day_title" >10</div>
				      <div class="day_title" >20</div>
				      <div class="day_title" >30</div>
				      <div class="day_title" >40</div>
				      <div class="day_title" >50</div>
				      <div class="day_title" >60</div>
				</div>
				
				<p id="selectedDiv" style="color:black"></p>
				 <button class="w3-btn w3-light-grey" onclick="finish()" style="margin:10px; margin-left:300px;">Study Time</button>
			  </div>
		    </div>
		    	
		  </div>
		
	</div>
</div>

</body>
</html>
