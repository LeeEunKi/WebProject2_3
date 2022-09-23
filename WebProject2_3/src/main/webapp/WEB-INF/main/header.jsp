<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.body{
	width: 100%;
}
nav, 
nav .nav-wrapper i, 
nav a.sidenav-trigger, 
nav a.sidenav-trigger i {
    height: 50px !important;
    line-height: 64px;
}
</style>
</head>
<body>
<div style="height: 15px"></div>
<div class="row" style="height: 70px;">
   <a href="../main/main.do"><img src="../img/logo.png" style="margin-left: 35px; display: inline;"></a>
  <div class="wrapper" style="position: relative; top: -143px;">
    <div class="searchBar">
      <input id="searchQueryInput" type="text" name="searchQueryInput" placeholder="통합검색" value="" />
      <button id="searchQuerySubmit" type="submit" name="searchQuerySubmit">
        <svg style="width:24px;height:24px" viewBox="0 0 24 24"><path fill="#666666" d="M9.5,3A6.5,6.5 0 0,1 16,9.5C16,11.11 15.41,12.59 14.44,13.73L14.71,14H15.5L20.5,19L19,20.5L14,15.5V14.71L13.73,14.44C12.59,15.41 11.11,16 9.5,16A6.5,6.5 0 0,1 3,9.5A6.5,6.5 0 0,1 9.5,3M9.5,5C7,5 5,7 5,9.5C5,12 7,14 9.5,14C12,14 14,12 14,9.5C14,7 12,5 9.5,5Z" />
        </svg>
      </button>
    </div>
  </div>
</div>
<div style="height: 15px"></div>


<nav class="navbar navbar-inner" style="margin-bottom: 0px;">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="../main/main.do">Home</a></li>
        <li><a href="../book/search.do" style="list-style: none;">도서검색</a></li>
        <li><a href="#">Projects</a></li>
        <li><a href="#">Contact</a></li>
        <li><a href="../board/list.do">게시판(Test)</a></li>
      </ul>
       <ul class="nav navbar-nav navbar-right">
      <c:if test="${sessionScope.id==null }">
      <li><a href="../member/join.do"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
      <li><a href="../member/login.do"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
     </c:if>
     <c:if test="${sessionScope.id!=null }">
      <li><a href="../member/join_before.do"><span class="glyphicon glyphicon-user"></span>회원수정</a></li>
      <li><a href="../member/logout.do"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
     </c:if>
      </ul>
    </div>
  </div>
</nav>
</body>
</html>