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


.form-group p {
	border : 1px solid #ccc;
	padding : 10px;
	margin : 10px;
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
		           	 	 💡 <b>다독다독에서 자원봉사자를 모집합니다!<br>
						자원봉사자는 자료실에서 자료배가 및 정리, 이용안내 등에 참여하게 됩니다.
						자원봉사활동을 통해 다독다독의 친구가 되어주세요.</b> 💡
		          </div>
		        </div>
     </div>
     
		  <div class="row">
		  
		  
		<jsp:include page="../mypage/mypage_header.jsp"></jsp:include>
		  
		    <div class="col-md-9 mb-9 mb-md-0">
		     <h2 class="h3 mb-3 text-black"><b>자원봉사 신청</b></h2>
      <div class="p-3 p-lg-5 border bg-white">
     <form method="post" action="../member/join_update_ok.do">
     
      <div class="form-group row">
        <label for="c_name" class="text-black" style="font-size: 20px;">🔔 봉사활동 대상 🔔</label>
      	 <div class="col-md-12">
		    <p class="align-left">
		     	- 일반성인, 고등학생, 대학생
		    </p>
		    </div>
		  </div>
		  
		   <div class="form-group row">
        <label for="c_name" class="text-black" style="font-size: 20px">🔔 모집일정 🔔</label>
      	 <div class="col-md-12">
		    <p class="align-left">
		     	- 일반성인 : 연간 상·하반기 2회 <br>
                - 학생 : 여름·겨울 방학기간 2회
		    </p>
		    </div>
		  </div>
		  
		     <div class="form-group row">
        <label for="c_name" class="text-black" style="font-size: 20px">🔔 활동기간 🔔</label>
      	 <div class="col-md-12">
		    <p class="align-left">
		     	- 일반성인 : 연간 상·하반기(6개월) <br>
			    - 학생 : 여름·겨울 방학기간
		    </p>
		    </div>
		  </div>
		  
		     <div class="form-group row">
        <label for="c_name" class="text-black" style="font-size: 20px">🔔 활동시간 🔔</label>
      	 <div class="col-md-12">
		    <p class="align-left">
				- 평일 : 오전(09:30-13:30) / 오후(13:00-17:00) / 저녁(16:30-20:30) <br>
				- 주말 : 오전(09:30-13:30) / 오후(13:30-17:30) <br><br>
				<span style="color: red">※ 최소 주1회 4시간 이상 활동, 최대 주2회 8시간까지 활동 가능</span>
		    </p>
		    </div>
		  </div>
		  
		     <div class="form-group row">
        <label for="c_name" class="text-black" style="font-size: 20px">🔔 모집일정 🔔</label>
      	 <div class="col-md-12">
		    <p class="align-left">
		     	- 일반성인 : 연간 상·하반기 2회 <br>
                - 학생 : 여름·겨울 방학기간 2회
		    </p>
		    </div>
		  </div>
		  
		<div class="form-group row">
        <label for="c_name" class="text-black" style="font-size: 20px">🔔 지원사항 🔔</label>
      	 <div class="col-md-12">
		    <p class="align-left">
				- 1일 4시간 이상 활동시 활동경비 지급<br>
				- 자원봉사 활동시간 인정 및 봉사확인서 발급<br>
				- 월 3회 이상 활동 우수활동자 인센티브 제공(대출권수 확대)
		    </p>
		    </div>
		  </div>
		  
		  		     <div class="form-group row">
        <label for="c_name" class="text-black" style="font-size: 20px">🔔 확인서 발급 방법 🔔</label>
      	 <div class="col-md-12">
		    <p class="align-left">
				- 서울도서관 자원봉사활동 확인서는 1365자원봉사 포털을 통해서만 발급이 가능합니다.<br>
				- 1365자원봉사포털 ID가 없으신 분은 회원가입 후 ID를 발급받으시기 바랍니다.<br>
				- 봉사실적은 월단위로 일괄 등록 되며, 해당 월의 봉사실적은 매 익월 10일 이후 1365자원봉사 포털에서 확인·발급이 가능합니다.<br>
		    </p>
		    </div>
		  </div>

   			<br><br>
	        <div class="text-center">
	             <!-- <input type=submit value="신청서 작성하기" class="btn btn-sm btn-primary" onClick="location.href='../mypage/mypage_Volunteer_submit.do'"> -->
					<button>
		                  <a href="../mypage/mypage_Volunteer_submit.do">신청서 작성하기</a>
		            </button>
	        </div>
      </form>
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
