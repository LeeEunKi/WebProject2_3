<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.quick-menu p{
	margin-top: 10px;
	font-size: 16px;
	color: darksalmon;
}
.quick-menu img{
	width:80px;
}
</style>
</head>
<body>
  <h3>Quick Menu</h3>
  <br>
  <div class="row quick-menu">
    <div class="col-sm-2">
      <img src="../img/book_find.png">
      <p>도서 검색</p>
    </div>
    <div class="col-sm-2">
      <img src="../img/book_recommend.png">
      <p>도서 추천</p>
    </div>
    <div class="col-sm-2"> 
      <img src="../img/room_reserve.png">
      <p>열람실 예약</p>    
    </div>
    <div class="col-sm-2"> 
    <a href="../shop/list.do">
      <img src="../img/book_mall.png">
      <p>중고서적 온라인몰</p>
    </a>
    </div>
    <div class="col-sm-2"> 
      <img src="../img/community.png">
      <p>커뮤니티</p>
    </div> 
    <div class="col-sm-2"> 
      <img src="../img/mypage.png">
      <p>마이페이지</p>
    </div> 
  </div>
</body>
</html>