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
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
		           	 💡 <b>이미 계정이 있으신가요? <a href="#">Click here</a> 에서 로그인 해 주세요!</b> 💡
		          </div>
		        </div>
     </div>
     
		  <div class="row">
		  
		  
		<jsp:include page="../mypage/mypage_header.jsp"></jsp:include>
		  
		    <div class="col-md-9 mb-9 mb-md-0">
		     <h2 class="h3 mb-3 text-black"><b>내가 작성한 게시글 목록 </b></h2>
		    <div class="p-3 p-lg-5 border bg-white">
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
		        <tbody>
		       
		          <tr v-for="Mvo in mypageboardListData" style="background-color: white;">
								<th width=10% class="text-center">{{Mvo.no}}</th>
								<th width=45%><a :href="'../board/detail.do?no='+vo.no">{{Mvo.subject}}</a></th>
								<th width=15% class="text-center">{{Mvo.name}}</th>
								<th width=20% class="text-center">{{Mvo.dbday}}</th>
								<th width=10% class="txt_org text-center">{{Mvo.hit}}</th>
							</tr>
		        </tbody>
				<tr>
				</table>
				<br>
				<div class="text-ceter">
				<table class="text-center">
					<tr>
			          <td class="text-center">
									<input type=button value="이전" class="btn btn-sm btn-danger">
									{{curpage}} page / {{totalpage}} pages
									<input type=button value="다음" class="btn btn-sm btn-danger">
					  </td>
					</tr>
		      </table>
		      </div>
		      <br><br><br>
		    </div>
		  </div>
		  </div>
		  </div>
		  </div>
		  </div>
</div>
  	<script>
  	
	new Vue({
		//el : 관리 영역 지정 => container
		el:'#mypage_list',
		data:{
			mypageboardListData:[],
			curpage:1,
			totalpage:0,
			id:${sessionScope.name}
		},
		mounted:function(){
			let _this=this;
			axios.get("http://localhost:8080/web/board/list_vue.do",{
				params:{
					page:_this.curpage
				}
			}).then(function(result){
				//개발자도구창에서 넘어온값 확인가능
				console.log(result.data);
				console.log(id);
				_this.mypageboardListData=result.data;
				_this.curpage=result.data[0].curpage;
				_this.totalpage=result.date[0].totalpage;
			})
		}
	})
	</script>
</body>
</html>
