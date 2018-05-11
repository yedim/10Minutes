<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<style>
#hidden
{
	width:1px;
	height:1px;
	border:0;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="Calendar.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 
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

<form method="post" name="fileSend" action="CalendarSave.jsp">
	<input type="hidden" name="plan" value=""><!-- 계획목록  -->
	<input type="hidden" name="startMonth" value=""> <!--시작날짜-->
	<input type="hidden" name="startDay" value="">
	
	<input type="hidden" name="timeHour" value=""><!-- 시작시간 -->
	<input type="hidden" name="timeMin" value="">
	
	<input type="hidden" name="studyTime" value=""><!-- 공부시간 -->
</form>

<iframe id="hidden" name="hiddenifr" src="CalendarSave.jsp"></iframe>

<div class="w3-container" id="calendar_id">

</div>
 <script type="text/javascript">
  
  window.onload=calendar();
  
  function calendar(y,m)
  {
	  var date=new Date(); //날짜 객체 생성
	  var nowY=date.getFullYear(); //현재 연도
	  var nowM=date.getMonth(); //현재 월
	  var nowD=date.getDate(); //현재 일
	  
	  y = (y != undefined)?y:nowY;
	  m = (m != undefined)?m-1:nowM;
	  
	  var theDate=new Date(y, m, 1);
	  var theDay=theDate.getDay();
		
	  var last=[31,28,31,30,31,30,31,31,30,31,30,31];//1월부터 12월까지 마지막 일을 배열로 저장함.
	  var month=["January", "February", "March", "April", "May", "June", "July"
		  , "August", "September", "October", "November", "December"];
	  if(y%4 == 0 && y % 100 !=0 || y%400 == 0) lastDate=last[1]=29;/*현재 연도가 윤년(4년 주기이고 100년 주기는 제외합니다. 또는 400년 주기)일경우 2월에 마지막 날짜는 29가 되어야 합니다.*/
	  
	  var lastDate=last[m]; //현재 월에 마지막이 몇일인지 구합니다.
	
	  var row=Math.ceil((theDay+lastDate)/7); /*필요한 행수*/
  
	var printDate = document.createElement("h2");
	printDate_text = document.createTextNode(month[m]+"   "+y);
	printDate.style.color="grey";
	printDate.appendChild(printDate_text);
	document.getElementById("calendar_id").appendChild(printDate);
	
   	var calendar = document.createElement("div");
  	calendar.className="calendar";
  	calendar.setAttribute('id',"calendar");
  	document.getElementById("calendar_id").appendChild(calendar);
 
	var calendar__header=document.createElement("div");
	calendar__header.className="calendar__header";
	calendar__header.setAttribute('id',"calendar__header");
	document.getElementById("calendar").appendChild(calendar__header);
	
	var calendar__header_day;
	var calendar__header_day_text;

	var i;
	var day;
	for(i=0; i<7;i++)
	{
		if(i==0){ day="sun";}	if(i==1){ day="mon";}	if(i==2){ day="tue";}
		if(i==3){ day="wed";}	if(i==4){ day="thu";}	if(i==5){ day="fri";}
		if(i==6){ day="sat";}
		calendar__header_day=document.createElement("div");
		calendar__header_day_text = document.createTextNode(day);
		calendar__header_day.setAttribute('id',"calendar__header_day"+day);
		calendar__header_day.appendChild(calendar__header_day_text);
		document.getElementById("calendar__header").appendChild(calendar__header_day);
	}
	 
  	var dNum=1;
  	var calendar__week;
	var calendar__week_text;
	var calendar__day;
	var calendar__day_text;
	
  	for(var i=1; i<=row; i++){//행
	  	calendar__week=document.createElement("div");
	  	calendar__week.className="calendar__week";
	  	calendar__week.setAttribute('id',"calendar__week");
	  	document.getElementById("calendar").appendChild(calendar__week);

  	for(var k=1; k<=7; k++){//열 /*행이 첫 줄이고 현재 월의 1일의 요일 이전은 모두 빈열로 표기하고 날짜가 마지막 일보다 크면 빈열로 표기됩니다.*/
     	 if(i==1 && k<=theDay || dNum>lastDate){
     		calendar__day=document.createElement("div");
     		calendar__day_text=document.createTextNode(" ");
     		calendar__day.setAttribute('id',"calendar__day");
     		calendar__day.className="calendar__day";
     		calendar__day.appendChild(calendar__day_text);
       		document.getElementById("calendar__week").appendChild(calendar__day); 
       }else{ 
    	   
      		calendar__day=document.createElement("div");
      		calendar__day_text=document.createTextNode(dNum);
     		calendar__day.setAttribute('id',"calendar__day"+dNum);
      		calendar__day.className="calendar__day";
      		if(nowD==dNum)
      		{
      			calendar__day.style.background="#E6E6E6";	
      		}
      		calendar__day.appendChild(calendar__day_text);
        	document.getElementById("calendar__week").appendChild(calendar__day);
	        dNum++;
       }
 	 }  	
  }
}
  
  </script>
  
<script>
function createExistCalendar(subjectText1,startDaytext3,startTime4,startTime5,studyTime6)
{
	var plan = document.createElement("div");
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
	plan.appendChild(plan_text);
	plan.style.backgroundColor="#7cadcd";
	plan.style.color="black";
	plan.style.fontSize="10pt";
	document.getElementById("calendar__day"+startDaytext).appendChild(plan);
	  	
}
</script>

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
				createExistCalendar('<%=calendarlist.get(0) %>','<%=calendarlist.get(2) %>','<%=calendarlist.get(3) %>','<%=calendarlist.get(4) %>','<%=calendarlist.get(5) %>');
				</script>
			<%
				calendarlist.clear();
			}

			nn++;
		}
	}
	
	
%>


<div class="w3-container w3-margin" style="float:right;">
	<button class="w3-button w3-xlarge w3-circle w3-black" 
	onclick="document.getElementById('id01').style.display='block'">+</button>
	
	<div id="id01" class="w3-modal">
 	<div class="w3-modal-content w3-card-4 w3-animate-zoom">
	  	<header class="w3-container w3-sand"> 
	   	<span onclick="document.getElementById('id01').style.display='none'" 
	   		class="w3-button w3-sand w3-xlarge w3-display-topright">&times;</span>
	   	<h2>계획추가</h2>
	  	</header>
  <div class="w3-container">
  <h4>계획목록</h4>
  <select class="w3-select" name="option" id="selectSubject" style="margin-bottom:30px">
  	<%
	  	String readfilePath = application.getRealPath("/WEB-INF/txtfile/plan.txt");
		BufferedReader reader = new BufferedReader(new FileReader(readfilePath));
		String str=null;
		int cnt=0;
		

		%>
		<option value="" disabled selected>Choose your subject</option>
		<%
		while(true)
		{
			str=reader.readLine();
			if(str==null) break;
			if(str.equals(" ")) break;
			String[] words = str.split(",");
			for(String wo:words)
			{
			%>
				 <optgroup label=<%=wo%>>			 
			<% 
				String planfilePath = application.getRealPath("/WEB-INF/txtfile/"+wo+".txt");
				BufferedReader planReader = new BufferedReader(new FileReader(planfilePath));
				String planStr=null;
				int planCnt=0;
				
				while(true)
				{
					planStr=planReader.readLine();
					if(planStr==null) break;
					if(planStr.equals(" ")) break;
					String[] planWords = planStr.split(",");
					for(String planWo:planWords)
					{
			%>
						<option value=<%=planWo%>><%=planWo%></option>
				</opgroup>	
			<%
					}
					cnt++;
				}
			}
		}
  	%>    
   
  </select>
	<h5>시작날짜&nbsp;</h5>  
	<input type="text" id="startMonth" size="1" disabled>월
	<select id="startDay">
  		
  	</select> 
  	
	<script type="text/javascript">
		var d=new Date(); //날짜 객체 생성
		document.getElementById('startMonth').value=d.getMonth()+1;
		
		var month=d.getMonth();
		var year = d.getFullYear();
		
		var ld = new Date(year, month+1,0);
		
		var i;
		var today = d.getDate();
		var lastday=ld.getDate();
		
		var node;
		var textnode;
		
		for( i=today; i<=lastday;i++)
		{
			node = document.createElement("option");
			textnode = document.createTextNode(i);
			node.setAttribute('value',i);
			node.appendChild(textnode);
			document.getElementById('startDay').appendChild(node);
		}
			
	</script>
	
	<h5>시작시간&nbsp;</h5>  	
  	<select id="timeHour">
  		<option value="07">07</option>	<option value="08">08</option>
  		<option value="09">09</option>	<option value="10">10</option>
  		<option value="11">11</option>	<option value="12">12</option>
  		<option value="13">13</option>	<option value="14">14</option>
  		<option value="15">15</option>	<option value="16">16</option>
  		<option value="17">17</option>	<option value="18">18</option>
  		<option value="19">19</option>	<option value="20">20</option>
  		<option value="21">21</option>	<option value="22">22</option>
  		<option value="23">23</option>	<option value="24">24</option>
  		<option value="01">01</option>	<option value="02">02</option>
  	</select> 
  	:
  	<select id="timeMin">
  		<option value="00">00</option>
  		<option value="10">10</option>
  		<option value="20">20</option>
  		<option value="30">30</option>
  		<option value="40">40</option>
  		<option value="50">50</option>
  	</select> 
  	<br>
  	
  	<h5>공부시간&nbsp;</h5>   
  	<input type="number" id="studyTime" name="studyTime" min="10" max="1200" step="10">분
	<br>
	<br>
	
	 <script>
  	function addCalendarPlan()
  	{
  		document.getElementById('id01').style.display='none';
  		
  		var plan = document.createElement("div");
  		var startDaytext = document.getElementById("startDay").value;
  		var startTime=document.getElementById("timeHour").value+":"+document.getElementById("timeMin").value;
  		var studyTime = document.getElementById("studyTime").value;
  		var subjectText = document.getElementById("selectSubject").value;
  		var plan_text=document.createTextNode(startTime+" "+subjectText+" "+studyTime+"분");
  		plan.appendChild(plan_text);
  		plan.style.backgroundColor="#7cadcd";
  		plan.style.color="black";
  		plan.style.fontSize="10pt";
  	  	document.getElementById("calendar__day"+startDaytext).appendChild(plan);
  		
  		form = document.fileSend;
  	  	form.plan.value=document.getElementById("selectSubject").value;
  		form.startMonth.value = document.getElementById("startMonth").value;//시작날짜
  		form.startDay.value=document.getElementById("startDay").value;
  		form.timeHour.value=document.getElementById("timeHour").value;//시작시간
  		form.timeMin.value=document.getElementById("timeMin").value;//시작시간
  		form.studyTime.value=document.getElementById("studyTime").value;//공부시간
  		form.target = "hiddenifr";                                                
  		form.submit(); 
  	}
  	
  </script>
  <br>
  <div class="w3-container w3-light-grey w3-padding">
   <button class="w3-button w3-bar w3-white w3-border" onclick="addCalendarPlan()">추가</button>
  </div>
 
  
 </div>
</div>

</div>
</body>
</html>
