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
		 <div class="row mb-5">
		        <div class="col-md-12">
		          <div class="border p-4 rounded" role="alert" style="background-color:#F5E3CF;">
		           	 💡 <b>작성한 게시글을 클릭하면 수정 및 삭제가 가능해요!</b> 💡
		          </div>
		        </div>
     </div>
     
		  <div class="row">
		  
		  
		<jsp:include page="../mypage/mypage_header.jsp"></jsp:include>
		  
		    <div class="col-md-9 mb-9 mb-md-0">
		     <h2 class="h3 mb-3 text-black"><b>내가 작성한 게시글 목록 </b></h2>
		    <div class="p-3 p-lg-5 border bg-white" style="width: auto">
		     <br>
		     <br>
		      <table summary="This table shows how to create responsive tables using Datatables' extended functionality" class="table table-bordered table-hover dt-responsive">
		        <thead>
		          <tr style="background-color:#F5E3CF;">
		            <th width=10% class="text-center">번호</th>
					<th width=45% class="text-center">제목</th>
					<th width=15% class="text-center">아이디</th>
					<th width=20% class="text-center">작성일</th>
					<th width=10% class="text-center">조회수</th>
		          </tr>
		        </thead>
		       <c:forEach var="vo" items="${list }">
		          <tbody>
		            <tr style="background-color: white;">
			           <td class="text-center" width=10%>${vo.no }</td>
			           <td width=45%><a href="../board/detail.do?no=${vo.no }">${vo.subject }</a></td>
			           <td class="text-center" width=15%>${vo.name }</td>
			           <td class="text-center" width=20%>${vo.dbday }</td>
			           <td class="text-center" width=10%>${vo.hit }</td>
			         </tr>
			        </tbody>
		         </c:forEach>
				<tr>
				</table>
				<br>
		      <br><br><br>
		    </div>
		  </div>
		  </div>
		  </div>
		  </div>
		  </div>
</div>
  	
</body>
</html>
