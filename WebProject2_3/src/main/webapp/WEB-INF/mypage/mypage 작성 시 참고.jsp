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
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



<style type="text/css">
/* common */

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
         <!-- 헤더는 mypage_header.jsp에서 수정 가능 --> 
		<jsp:include page="../mypage/mypage_header.jsp"></jsp:include>
		 <div class="col-md-9 mb-9 mb-md-0">
		 
		 <!-- 여기서 부터 원하는 내용 넣어주시면 됩니다. -->
		     <h2 class="h3 mb-3 text-black"><b>회원 정보 수정</b></h2>
		    <div class="p-3 p-lg-5 border bg-white">
		    <div id="join_before">
		     <div class="text-center">
		                <label for="c_code" class="text-black mb-3">비밀번호를 입력 해 주세요!</label>
		                <div class="col-md-12">
		                <div class="input-group w-75 couponcode-wrap">
		                   <input type=password style='text-align:center' ref=pwd class="form-control me-2" v-model="pwd" placeholder="비밀번호를 입력하세요">
		                </div>
		                </div>
		                </div>
		                <br>
		                <br>
						<div class="text-center">
				            <input type=button value="확인" class="btn btn-sm btn-warning" v-on:click="ok()">
				            <input type=button value="취소" class="btn btn-sm btn-info"
				              onclick="javascript:history.back()"
				            >
		       </div>
		      </div>
		    </div>
		    <!-- 원하는 내용 출력 끝 -->
		    
		   </div>
      </div>
     </div>
    </div>
   </div>
 </div>
</body>
</html>
