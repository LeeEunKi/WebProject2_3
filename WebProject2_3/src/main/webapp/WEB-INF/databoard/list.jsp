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
h2 {
  text-align: center;
  padding: 20px 0;
}
.p {
  text-align: center;
}
</style>
</head>
<body>

<!-- Start Hero Section -->
			<div class="hero">
				<div class="container">
					<div class="row justify-content-between">
						<div class="col-lg-5">
							<div class="intro-excerpt">
								<h1>정보공유 게시판</h1>
							</div>
						</div>
						<div class="col-lg-7">
							
						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->

&nbsp;&nbsp;<h2><b>정보공유 게시판</b></h2>
   <div class="container">
     <div class="row">
     <div class="col-xs-12">
       <a href="../databoard/insert.do" class="btn btn-sm btn-primary">새글</a>
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
	           <td width=45%><a href="../databoard/detail.do?no=${vo.no }">${vo.subject }</a></td>
	           <td class="text-center" width=15%>${vo.name }</td>
	           <td class="text-center" width=20%>${vo.dbday }</td>
	           <td class="text-center" width=10%>${vo.hit }</td>
	         </tr>
	        </tbody>
         </c:forEach>
       </table>
       <table class="table">
         <tr>
           <td class="text-right">
            <a href="list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-danger">이전</a>
            ${curpage } page / ${totalpage } pages
            <a href="list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
           </td>
         </tr>
       </table>
       <br>
       <br>
     </div>
   </div>
   </div>
</body>
</html>