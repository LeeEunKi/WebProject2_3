<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>

		<!-- Start Hero Section -->
			<div class="hero">
				<div class="container">
					<div class="row justify-content-between">
						<div class="col-lg-5">
							<div class="intro-excerpt">
								<h1>회원가입</h1>
							</div>
						</div>
						<div class="col-lg-7">
							
						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->
		
&nbsp;&nbsp;<h2><b>상세보기 페이지</b></h2>
<hr>
   <div class="container">
    <div id="board_detail">
     <div class="row">
      <div class="col-xs-12">
     <table summary="This table shows how to create responsive tables using Datatables' extended functionality" class="table table-bordered table-hover dt-responsive">
        <tr>
         <th width=20% class="text-center warning" style="background-color:#F5E3CF;">번호</th>
         <td width=30% class="text-center" style="background-color:white;">{{vo.no }}</td>
         <th width=20% class="text-center warning" style="background-color:#F5E3CF;">작성일</th>
         <td width=30% class="text-center" style="background-color:white;">{{vo.dbday }}</td>
        </tr>
        <tr>
         <th width=20% class="text-center warning" style="background-color:#F5E3CF;">이름</th>
         <td width=30% class="text-center" style="background-color:white;">{{vo.name }}</td>
         <th width=20% class="text-center warning" style="background-color:#F5E3CF;">조회수</th>
         <td width=30% class="text-center" style="background-color:white;">{{vo.hit }}</td>
        </tr>
        <tr>
         <th width=20% class="text-center warning" style="background-color:#F5E3CF;">제목</th>
         <td colspan="3" style="background-color:white;">{{vo.subject }}</td>
        </tr>
        <tr>
          <td colspan="4" class="text-left" valign="top" height="200"  style="background-color:white;">
           <pre style="white-space: pre-wrap;border:none;background-color: white;">{{vo.content }}</pre>
          </td>
        </tr>
        <tr>
          <td colspan="4" class="text-center">
          	<a :href="'../board/update.do?no='+no" class="myButton">수정</a>
          	<a :href="'../board/delete.do?no='+no" class="redbutton">삭제</a>
          	<a href="../board/list.do" class="yellowbutton">목록</a>
          </td>
        </tr>
      </table>
      </div>
     </div>
     </div>
   </div>
   <script>
   new Vue({
	   el:'#board_detail',
	   data:{
		   //array
		   vo:{},
		   no:${no}
	   },
	   //버튼을 누를때 X => 시작과 동시에 값을 가져옴
	   mounted:function(){
		   let _this=this;
		   axios.get("http://localhost:8080/web/board/detail_vue.do",{
			   params:{
					no:_this.no	   
			   }
		   //요청 처리 결과값 읽기 => 데이터값만 변경(상태변경)
		   }).then(function(result){
			   _this.vo=result.data;
		   })
	   }
   })
   </script>
</body>
</html>