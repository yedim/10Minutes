<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.io.*"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>SideBar</title>
<style>
#hidden
{
	width:1px;
	height:1px;
	border:0;
}
</style>
<script>
	
	var cnt=0;
	function dayGap () {
	
		var endMonth = document.getElementById('endMonth').value;
		var endDay = document.getElementById('endDay').value;
		var endEvent=document.getElementById('endEvent').value;
		var Month =["","January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November","December" ];
	    
		var dday = new Date(Month[endMonth]+" "+endDay +", 2018 00:00:00").getTime();//디데이 April 26
	    var nowday = new Date();//현재
	    nowday = nowday.getTime();//밀리세컨드 단위변환
	    var distance = dday - nowday;//디데이에서 현재까지 뺀다.
	
	    var d = Math.floor(distance / (1000 * 60 * 60 * 24));//일
	    
	    if (distance <= 0) {//당일넘어섰을때, dday로 변경
	       document.getElementById("d-day").innerHTML = "D-day";
	    }
	    	
	     var jbBtn = document.createElement( 'p' );
	     jbBtn.setAttribute("id","dday1");
		 var jbBtnText = document.createTextNode("D-"+(d+1)+" "+endEvent);
		     
		 jbBtn.appendChild( jbBtnText );
		 document.body.appendChild( jbBtn );
		     
	     jbBtn.appendChild( jbBtnText );
	     document.getElementById("d-day").appendChild( jbBtn );
		     
	     form = document.ddaySend; /* form name is ddaySend */
		 form.content.value = "D-"+(d+1)+" "+endEvent;                                            
		 form.target = "hiddenifr";                                                
		 form.submit();                                                             
	
		alert("dday 추가 되었습니다."); 
	}
	
	function deleteDay()
	{
		var id = document.getElementById("dday1");
		document.getElementById("d-day").removeChild(id);
	}
	
	function countDown()
	{
		var endMonth = document.getElementById('countDownEndMonth').value;
		var endDay = document.getElementById('countDownEndDay').value;
		var endHour = document.getElementById('countDownEndHour').value;
		var endMinute = document.getElementById('countDownEndMinute').value;
		var endEvent=document.getElementById('countDownEndEvent').value;
		var Month =["","January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November","December" ];
	    
	    
		// Set the date we're counting down to
		var countDownDate = new Date(Month[endMonth]+" "+endDay +", 2018 "+endHour+":"+endMinute+":00").getTime();

		// Update the count down every 1 second
		var x = setInterval(function() {

		// Get todays date and time
		var now = new Date().getTime();
		    
	    var distance = countDownDate - now;
	    
	    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
	    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
	    
	    
	    	 document.getElementById("countdown").innerHTML =  days+"d "+hours + "h "
	 	    + minutes + "m " + seconds + "s "+endEvent;	
	     
		   if (distance < 0) {
		        clearInterval(x);
		        document.getElementById("countdown").innerHTML = "EXPIRED";
		    }
		}, 1000);

	}
</script>
</head>
<body>

<iframe id="hidden" name="hiddenifr" src="SideBarSave.jsp"></iframe>

<form method="post" name="ddaySend" action="SideBarSave.jsp">
	<input type="hidden" name="content" value="">
</form>


<div class="w3-container w3-margin-bottom">
  <div class="w3-card-4" style="width:100%">
    <header class="w3-container w3-light-grey">
      <h5>D-DAY</h5>
    </header>
    <div id="d-day" class="w3-container" style="font-size:10pt;">
      <!-- dday여기추가 -->
       <!-- 파일 읽기 -->
    <%
		String readfilePath = application.getRealPath("/WEB-INF/txtfile/dday.txt");
		BufferedReader reader = new BufferedReader(new FileReader(readfilePath));
		String str=null;
		
		while(true)
		{
			str=reader.readLine();
			if(str==null) break;
			String[] words = str.split(",");
			for(String wo:words)
			{
			%>
				<p><%=wo%></p>
			<%		
			}
		}
	%>  
    </div>
      <hr>
    <div class="w3-container" style="font-size:10pt;">
 
	종료일자 <br><input type="text" id="endMonth" maxlength="2" size="1" placeholder="월"></input> 
	         <input type="text" id="endDay" maxlength="2" size="1" placeholder="일"></input> 
	         <input type="text" id="endEvent"  size="10"></input><br>
	 ex) 5월 20일
	</div>
    <div class="w3-container w3-center w3-padding-16" >
    <button class="w3-button w3-dark-grey" onclick = "dayGap();">추가</button>
<!--     <button class="w3-button w3-dark-grey" onclick="deleteDay();" >삭제</button>
 -->   
  </div>
  </div>
</div>

<div class="w3-container">
  <div class="w3-card-4" style="width:100%">
    <header class="w3-container w3-light-grey">
      <h5>CountDown</h5>
    </header>
    <p id="countdown" class="w3-container" > </p>
      <hr>
    <div class="w3-container" style="font-size:10pt;">
 
	종료일자 <br><input type="text" id="countDownEndMonth" maxlength="2" size="1" placeholder="월"></input> 
	         <input type="text" id="countDownEndDay" maxlength="2" size="1" placeholder="일"></input> 
			 <input type="text" id="countDownEndHour" maxlength="2" size="1" placeholder="시"></input> 
	         <input type="text" id="countDownEndMinute" maxlength="2" size="1" placeholder="분"></input> 
	         <input type="text" id="countDownEndEvent"  size="10" placeholder="일정"></input><br>
	ex) 5월 10일 15시 10분
	</div>
    <div class="w3-container w3-center w3-padding-16" >
    <button class="w3-button w3-dark-grey" onclick = "countDown();">설정</button>
    </div>
  </div>
</div>
	
</body>
</html>
