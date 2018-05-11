<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>SideBar</title>
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
	}
	
	
	function deleteDay()
	{
		var id = document.getElementById("dday1");
		document.body.removeChild(id);
	}
</script>
</head>
<body>

<div class="w3-container">
  <div class="w3-card-4" style="width:100%">
    <header class="w3-container w3-light-grey">
      <h3>D-DAY</h3>
    </header>
    <div id="d-day" class="w3-container">
      <p>D-DAY여기에 추가</p>
      <hr>
    </div>
    
    <div class="w3-container">
 
	종료일자 <br><input type="text" id="endMonth" maxlength="2" size="1" placeholder="월"></input> 
	         <input type="text" id="endDay" maxlength="2" size="1" placeholder="일"></input> 
	         <input type="text" id="endEvent"  size="10"></input><br>
	입력형식 ex) 5월 20일
	</div>
    <div class="w3-container w3-center w3-padding-16" >
    <button class="w3-button w3-dark-grey" onclick = "dayGap();">추가</button>
    <button class="w3-button w3-dark-grey" onclick="deleteDay();" >삭제</button>
    </div>
  </div>
</div>
	
</body>
</html>
