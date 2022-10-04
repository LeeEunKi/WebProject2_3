<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

h1 {
   text-align: center
}

h2 {
  text-align: center;
  padding: 20px 0;
}

.p {
  text-align: center;
}
.myButton {
	box-shadow: 0px 10px 14px -7px #276873;
	background:linear-gradient(to bottom, #599bb3 5%, #408c99 100%);
	background-color:#599bb3;
	border-radius:8px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:20px;
	font-weight:bold;
	padding:8px 20px;
	text-decoration:none;
	text-shadow:0px 1px 0px #3d768a;
}
.myButton:hover {
	background:linear-gradient(to bottom, #408c99 5%, #599bb3 100%);
	background-color:#408c99;
}
.myButton:active {
	position:relative;
	top:1px;
}
.redbutton {
	box-shadow: 0px 10px 14px -7px #276873;
	background:linear-gradient(to bottom, #b35961 5%, #994061 100%);
	background-color:#b35961;
	border-radius:8px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:20px;
	font-weight:bold;
	padding:8px 20px;
	text-decoration:none;
	text-shadow:0px 1px 0px #3d768a;
}
.redbutton:hover {
	background:linear-gradient(to bottom, #994061 5%, #b35961 100%);
	background-color:#994061;
}
.redbutton:active {
	position:relative;
	top:1px;
}
.yellowbutton {
	box-shadow: 0px 10px 14px -7px #276873;
	background:linear-gradient(to bottom, #d4bc22 5%, #d9ca27 100%);
	background-color:#d4bc22;
	border-radius:8px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:20px;
	font-weight:bold;
	padding:8px 20px;
	text-decoration:none;
	text-shadow:0px 1px 0px #3d768a;
}
.yellowbutton:hover {
	background:linear-gradient(to bottom, #d9ca27 5%, #d4bc22 100%);
	background-color:#d9ca27;
}
.yellowbutton:active {
	position:relative;
	top:1px;
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
		
&nbsp;&nbsp;<h2><b>상세보기 페이지</b></h2>	
   <div class="container">
     <div class="row">
     <div class="col-xs-12">
      <table summary="This table shows how to create responsive tables using Datatables' extended functionality" class="table table-bordered table-hover dt-responsive">
        <tr>
         <th width=20% class="text-center warning" style="background-color:#F5E3CF;">번호</th>
         <td width=30% class="text-center" style="background-color:white;">${vo.no }</td>
         <th width=20% class="text-center warning" style="background-color:#F5E3CF;">작성일</th>
         <td width=30% class="text-center" style="background-color:white;">${vo.dbday }</td>
        </tr>
        <tr>
         <th width=20% class="text-center warning" style="background-color:#F5E3CF;">이름</th>
         <td width=30% class="text-center" style="background-color:white;">${vo.name }</td>
         <th width=20% class="text-center warning" style="background-color:#F5E3CF;">조회수</th>
         <td width=30% class="text-center" style="background-color:white;">${vo.hit }</td>
        </tr>
        <tr>
         <th width=20% class="text-center warning" style="background-color:#F5E3CF;">제목</th>
         <td colspan="3" style="background-color:white;">${vo.subject }</td>
        </tr>
        <c:if test="${vo.filecount!=0 }">
          <tr>
            <th width=20% class="text-center warning" style="background-color:#F5E3CF;">첨부파일</th>
            <td colspan="3" style="background-color:white;">
              <ul>
               <c:forEach var="fname" items="${fList }" varStatus="s">
                 <li><a href="download.do?fn=${fname }">${fname }</a>(${sList[s.index]}Bytes)</li>
               </c:forEach>
              </ul>
            </td>
          </tr>
        </c:if>
        <tr>
          <td colspan="4" class="text-left" valign="top" height="200" style="background-color:white;">
           <pre style="white-space: pre-wrap;border:none;background-color: white;">${vo.content }</pre>
          </td>
        </tr>
        <tr>
          <td colspan="4" class="text-right">
            <a href="update.do?no=${vo.no }" class="btn btn-xs btn-info">수정</a>
            <a href="delete.do?no=${vo.no }" class="btn btn-xs btn-warning">삭제</a>
            <a href="list.do" class="btn btn-xs btn-success">목록</a>
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