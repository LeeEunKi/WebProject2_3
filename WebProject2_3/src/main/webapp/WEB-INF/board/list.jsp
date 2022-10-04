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
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
h2 {
  text-align: center;
  padding: 20px 0;
}
.p {
  text-align: center;
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
								<h1>자유게시판</h1>
							</div>
						</div>
						<div class="col-lg-7">
							
						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->
		
&nbsp;&nbsp;<h2><b>자유게시판</b></h2>
<hr>
	<div class="container">
	<div id="board_list">
  <div class="row">
    <div class="col-xs-12">
    <c:if test="${sessionScope.id!=null }">
     <a href="../board/insert.do" class="btn btn-sm btn-primary">새글</a>
     </c:if>
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
          <tr v-for="vo in board_list" style="background-color: white;">
						<th width=10% class="text-center">{{vo.no}}</th>
						<th width=45%><a :href="'../board/detail.do?no='+vo.no">{{vo.subject}}</a></th>
						<th width=15% class="text-center">{{vo.name}}</th>
						<th width=20% class="text-center">{{vo.dbday}}</th>
						<th width=10% class="txt_org text-center">{{vo.hit}}</th>
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
				           <input type=button value="다음" class="btn btn-sm btn-warning">
			  </td>
			</tr>
      </table>
      </div>
      <br><br><br>
    </div>
  </div>
  </div>
</div>
	<script>
		new Vue({
			//el : 관리 영역 지정 => container
			el:'#board_list',
			data:{
				board_list:[],
				curpage:1,
				totalpage:0
			},
			mounted:function(){
	    		let _this=this;
	    		axios.get("http://localhost:8080/web/board/list_vue.do",{
	    			params:{
	    				page:_this.curpage
	    			}
	    		}).then(function(result){
	    			console.log(result.data);
	    			_this.board_list=result.data;
	    			_this.curpage=result.data[0].curpage;
	    			_this.totalpage=result.data[0].totalpage;
	    		})
	    	}
	    })
	</script>
	
</body>
</html>