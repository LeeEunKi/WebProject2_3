<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.navbar-inverse{
	border-radius: 0px;
}
</style>
</head>
<body>
<div style="height: 15px"></div>
<div class="row" style="height: 70px;">
   <a href="../main/main.do"><img src="../img/logo.png" style="margin-left: 35px; display: inline;"></a>
</div>
<div style="height: 15px"></div>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="#">Navbar</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
	    <div class="navbar-nav">
	      <a class="nav-item nav-link active" href="../main/main.do">Home <span class="sr-only">(current)</span></a>
	      <a class="nav-item nav-link" href="../book/search.do">도서검색</a>
	      <a class="nav-item nav-link" href="../study/room_list.do">열람실 예약</a>
	      <a class="nav-item nav-link" href="../board/list.do">게시판(Test)</a>
	      <a class="nav-item nav-link" href="../member/mypage.do">마이페이지(Test)</a>
	      <a class="nav-item nav-link" href="#">중고서적 판매</a>
	      <form class="form-inline">
		    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
		    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		  </form>
	
	    <!--   <c:if test="${sessionScope.id==null }">
	       <a href="../member/join.do"><span class="glyphicon glyphicon-user"></span>회원가입</a>
	       <a href="../member/login.do"><span class="glyphicon glyphicon-log-in"></span>로그인</a>
	     </c:if>
	     <c:if test="${sessionScope.id!=null }">
	       <a href="../member/join_before.do"><span class="glyphicon glyphicon-user"></span>회원수정</a>
	       <a href="../member/logout.do"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a>
	     </c:if>  -->
	    </div>
	  </div>
	</nav>



</body>
</html>