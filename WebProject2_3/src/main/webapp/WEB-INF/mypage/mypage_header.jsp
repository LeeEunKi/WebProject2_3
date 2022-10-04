<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

/*사이드 메뉴바 css*/
.sidemenu ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    background-color: white;
    width:300px;
    height:500px;
    border: 1px solid #E2E2E2;
}
.sidemenu li a {
    display: block;
    color: black;
    padding: 8px 16px;
    text-decoration: none;
     border: 1px;
}
.sidemenu li a.active {
    background-color:#DDDDFF;
    color: black;
     border: 1px;
     font-size: 22px;
     font-weight: bold;
}
.sidemenu li a:hover:not(.active) {
    background-color: #555;
    color: white;
    
     border: 1px;
}

</style>
</head>
<body>

		
		   <div class="col-md-3">
		    <div class="sidemenu">
		    <ul>
		      <li><a class="active" href="#home"><b2>MyPage</b2></a></li>
		      <li><a href="../mypage/mypage_Volunteer.do"><b2>자원봉사 신청하기</b2></a></li>
		      <li><a href="../mypage/mypage.do"><b2>내가 작성한 게시글</b2></a></li>
		      <li><a href="../mypage/mypage_join_before.do">회원정보 수정하기</a></li>
		       <li><a href="../mypage/mypage_delete_before.do">회원 탈퇴하기</a></li>
		    </ul>
		    </div>
		  </div>
</body>
</html>