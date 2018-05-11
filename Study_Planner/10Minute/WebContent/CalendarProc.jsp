<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="Calendar.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script type="text/javascript">

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
	
    //1월부터 12월까지 마지막 일을 배열로 저장함.
    var last=[31,28,31,30,31,30,31,31,30,31,30,31];
    
    /*현재 연도가 윤년(4년 주기이고 100년 주기는 제외합니다.
    또는 400년 주기)일경우 2월에 마지막 날짜는 29가 되어야 합니다.*/
    if(y%4 == 0 && y % 100 !=0 || y%400 == 0) lastDate=last[1]=29;
    
    var lastDate=last[m]; //현재 월에 마지막이 몇일인지 구합니다.
    
    /*③ 현재 월의 달력에 필요한 행의 개수를 구합니다.
    var row(행의 개수)= Math.ceil( (theDay(빈 칸)+lastDate(월의 전체 일수)) / 7)*/

    var row=Math.ceil((theDay+lastDate)/7); /*필요한 행수*/
    
    document.write("<h2>"+y+"."+(m+1)+"</h2>"); //년월 표기
    
    //문자결합 연산자를 사용해 요일이 나오는 행을 생성

    var calendar="<div class='calendar'>"
 	calendar+="<div class='calendar__header'>";
    calendar+="<div>sun</div>";
    calendar+="<div>mon</div>";
    calendar+="<div>tue</div>";
    calendar+="<div>wed</div>";
    calendar+="<div>thu</div>";
    calendar+="<div>fri</div>";
    calendar+="<div>sat</div>";
    calendar+="</div>";

    var dNum=1;
    //이중 for문을 이용해 달력 테이블을 생성
    for(var i=1; i<=row; i++){//행 생성 (tr 태그 생성)
    calendar+="<div class='calendar__week'>";

    for(var k=1; k<=7; k++){//열 생성 (td 태그 생성)
        /*행이 첫 줄이고 현재 월의 1일의 요일 이전은 모두 빈열로
        표기하고 날짜가 마지막 일보다 크면 빈열로 표기됩니다.*/
        if(i==1 && k<=theDay || dNum>lastDate){
          calendar+="<div class='calendar__day'> &nbsp; </div>";
         }else{
          calendar+="<div class='calendar__day'>"+dNum+"</div>";
           dNum++;
         }
    }
    calendar+="</div>";
    }
    calendar+="</div>";
    //⑤ 문자로 결합된 달력 테이블을 문서에 출력
    document.write(calendar);
	}
	calendar();
	
	
  </script>
</head>
<body>

<div class="w3-container">
<button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-black">추가</button>
<div id="id01" class="w3-modal">
 <div class="w3-modal-content w3-card-4 w3-animate-zoom">
  <header class="w3-container w3-sand"> 
   <span onclick="document.getElementById('id01').style.display='none'" 
   class="w3-button w3-sand w3-xlarge w3-display-topright">&times;</span>
   <h2>Header</h2>
  </header>


  <div class="w3-container">
  <h4>과목</h4>
  <select class="w3-select" name="option">
    <option value="" disabled selected>Choose your subject</option>
    <option value="1">영어</option>
    <option value="2">국어</option>
    <option value="3">수학</option>
  </select>
  
   <h4>할일</h4>
  <select class="w3-select" name="option">
    <option value="" disabled selected>Choose your task</option>
    <option value="1">영어</option>
    <option value="2">국어</option>
    <option value="3">수학</option>
  </select>
 	<br>
 	<br>
 	
   </div>

	
  <div class="w3-container w3-light-grey w3-padding">
   <button class="w3-button w3-bar w3-white w3-border" 
   onclick="document.getElementById('id01').style.display='none'">추가</button>

  </div>
 </div>
</div>

</div>
</body>
</html>
