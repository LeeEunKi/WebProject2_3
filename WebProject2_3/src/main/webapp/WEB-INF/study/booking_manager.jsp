<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Untree.co">
  <link rel="shortcut icon" href="favicon.png">

  <meta name="description" content="" />
  <meta name="keywords" content="bootstrap, bootstrap4" />
<!-- Bootstrap CSS -->
<!-- 이거 지우면 깨짐 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<link href="css/tiny-slider.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co </title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('.cancel-btn').click(function(){
		$.ajax({
			type:'post',
			url:'../study/booking_cancel.do',
			success:function(result){
				alert("좌석이 취소되었습니다!");
				location.href="../study/booking_manager.do";
			}
			
		})
	})
	
	$('#extend-btn').click(function(){
		$.ajax({
			type:'post',
			url:'../study/booking_extend.do',
			success:function(result){
				alert("연장되었습니다 (종료시간:"+result+")");
				location.href="../study/booking_manager.do";
			}
			
		})
	})
	
})
</script>
<style type="text/css">
.row1{
   margin: 0px auto;
   width: auto;
   height: auto;
}
html, body {
  height: 100%;
  margin: 0;
  padding: 0;
}
body { 
  overflow-y: scroll;
}
.footercustom {
  width: auto;
  margin: 50px 0 0 0;
}

.smallfont {
  font-size: 12px;
}

hr {
  border: 1px solid #f84646;
  margin: 0 auto;
}
.booking-table{
  width: 120px;
  border: solid 1px;
  margin-right: 5px;
}
.booking-btn{
  background: darkslategray;
}


</style>
</head>
<body>
<div id="mypage_list">
		<!-- Start Hero Section -->
			<div class="hero">
				<div class="container">
					<div class="row justify-content-between">
						<div class="col-lg-5">
							<div class="intro-excerpt">
								<h1>마이페이지</h1>
							</div>
						</div>
						<div class="col-lg-7">
							
						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->
		
	<div class="untree_co-section">
		 <div class="container" style="width:90%">
		 <div id="mypage_list">
		 
		 <!-- 안내 문구 출력 하는 곳 입니다!! 삭제 가능 -->
		 <div class="row mb-5">
		        <div class="col-md-12">
		          <div class="border p-4 rounded" role="alert" style="background-color:#F5E3CF;">
		           	  <b>💡회원님의 소중한 개인 정보를 위해, 비밀번호를 확인 해 주세요!💡</b>
		          </div>
	    	</div>
        </div>
        <!-- 안내 문구 출력 끝 -->
     
      <div class="row">
		<jsp:include page="../mypage/mypage_header.jsp"></jsp:include>
		 <div class="col-md-9 mb-9 mb-md-0">
		 
		 <!-- 여기서 부터 원하는 내용 넣어주시면 됩니다. -->
		     <h2 class="h3 mb-3 text-black"><b>열람실 예약 정보</b></h2>
		    <div class="p-3 p-lg-5 border bg-white">
		     <c:if test="${count>0}">
			     <div class="row">
			       <table class="table booking-table">
			         <tr>
			          <th style="background-color: bisque;">제 ${vo.room_no }열람실</th>
			         </tr>
			         <tr>
			          <td style="height: 67px; font-size: 20px; text-align-last: center; vertical-align: middle;"><b>좌석 ${vo.seat_no }</b></td>
			         </tr>
			       </table>
			       <table class="table booking-table" style="width: 550px;">
			         <tr>
			           <td>
			             <img src="../images/time.png">
			             시작시간 ${vo.dbday }&nbsp;${vo.start_time }  
			           </td>
			           <td>
			           	 종료시간 ${vo.dbday }&nbsp;${vo.end_time } 
			           </td>
			         </tr>
			         <tr>
			           <td colspan="2">
			             <button class="btn booking-btn cancel-btn">예약취소</button>
			             <button class="btn booking-btn cancel-btn">퇴실/반납</button>
			             <button id="extend-btn" class="btn booking-btn">시간연장</button>
			             <button class="btn booking-btn">좌석이동</button>
			           </td>
			         </tr>
			       </table>
			     </div>
			    </c:if>
			 <c:if test="${count ==0 }">
				 <div class="row">
			       <h4>예약된 열람실 좌석이 없습니다.</h4>
			     </div>
			 </c:if>    
		   </div>
	   </div>
      </div>
     </div>
    </div>
   </div>
 </div>
</body>
</html>

