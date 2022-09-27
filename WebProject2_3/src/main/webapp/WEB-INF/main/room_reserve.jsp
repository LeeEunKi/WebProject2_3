<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rb_box{
    display: inline-block;
    float: left;
    margin: 0 6px 5px 0;
}
.rb_box h4{
	height: 24px;
    border: 1px solid #fdd1aa;
    background-color: #fdd1aa;
    text-align: center;
    font-size: 14px;
    color: #7d6e61;
    font-weight: bold;
    line-height: 22px;
}
.rb_box .num1 {
    float: left;
    width: 49%;
    border: 1px solid #e5e5e5;
    border-top: none;
    border-left: none;
    font-size: 24px;
    font-weight: bold;
    color: #2d2d2d;
    text-align: center;
    line-height: 40px;
}
.rb_box .num1 span {
    display: block;
    padding: 5px 0;
    font-size: 12px;
    line-height: 12px;
    font-weight: normal;
    color: #8C8C8C;
    border-bottom: 1px solid #e5e5e5;
    background-color: #f5f4f3;
}

.rb_box h4 strong {
    font-size: 18px;
    font-weight: bold;
    color: #000000;
}
.room_pre {
    position: absolute;
    top: 33px;
    left: 0;
    overflow: hidden;
}
.standby {
 	clear: both;
    width: 100%;
    height: 65px;
    font-size: 40px;
    line-height: 36px;
    font-weight: bold;
    text-align: center;
    color: #2D2D2D;
    border: 1px solid #e5e5e5;
    background-color: #f5f4f3;
    padding-top: 11px;
}
.standby span {
    left: 28%;
    bottom: 45px;
    display: inline-block;
    font-size: 12px;
    line-height: 12px;
    font-weight: normal;
    color: #8C8C8C;
}
.room_h5{
 	style="text-align: left;
 	margin-bottom: 15px; 
 	display: inline-block;
 	float: left;"
}
#room_img{
	margin-bottom: 6px;
    float: left;
}
</style>
</head>
<body>
  <img id="room_img" src="../img/room_img.png"><h5 class="room_h5">열람실 실시간 현황</h5>
   <div id="room_list" style="width: 300px; height: 300px;">
    <c:forEach var="rvo" items="${rlist }">
     <div class="rb_box" style="width: 120px;">
       <h4>
              제&nbsp;<strong>${rvo.no }</strong>&nbsp;열람실
       </h4>
       <div>
        <p class="num1">
          <span>전체</span>
          ${rvo.total_seat }
        </p>
        <p class="num1">
          <span>잔여</span>
          ${rvo.remain_seat }
        </p>
       </div>
     </div>
    </c:forEach>
	<div class="rb_box" style="width: 120px;">
       <h4>
       <strong>대기 수</strong>
       </h4>
       <div>
        <p class="standby">
         0
    	</p>
       </div>
     </div>
     <p style="padding-top: 10px; text-align: right !important; width: 82%;" >
      <a href="../study/room_list.do">열람실 좌석 예약 바로가기▷</a>
     </p> 
   </div>
</body>
</html>