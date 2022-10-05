<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

				
						<img id="room_img" src="../img/booking.png" style="width: 30px;height: 30px;position: relative;top: 3px;margin-right: 10px"><h2 class="mb-4 section-title">열람실 실시간 현황</h2>
						
						 <div class="col-lg-6 mb-6">
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
							   <div style="margin-top: 10px"><p style="float: left"><a href="../study/room_list.do" class="btn">열람실 좌석 예약</a></p></div>
						  </div>
							<div class="col-lg-6 mb-6" style="display: inline-block;margin-left: 30px">
							  <div class="feature">
								<div class="icon">
									<img src="../img/on-time.png" alt="Image" class="imf-fluid" style="width: 35px;height: 35px">
								</div>
								<h3>열람실 운영시간</h3>
								<p>평일(화~금) 09:00~18:00</p>
								<p>주말(토~일) 09:00~18:00</p>
								<p style="letter-spacing: 0.5px">매주 <strong>월요일, 공휴일</strong>은 휴관일입니다</p>
								
							 </div> 
							</div>
							  
							
						     

						  
						
					
		
		
</body>
</html>