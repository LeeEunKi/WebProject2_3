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
		           	 💡 <b>회원님의 개인정보를 빠짐없이 기입 해 주세요!<br>
						내부 심사 후, 개별 연락 드릴 예정입니다.</b> 💡
		          </div>
		        </div>
     </div>
     
		  <div class="row">
		  
		  
		<jsp:include page="../mypage/mypage_header.jsp"></jsp:include>
		  
		    <div class="col-md-9 mb-9 mb-md-0">
		    <h2 class="h3 mb-3 text-black"><b>자원봉사 신청서 작성</b></h2>
     	 <div class="p-3 p-lg-5 border bg-white">
     
		       <label for="c_fname" class="text-black">ID <span class="text-danger">*</span></label>
				    <div class="input-group w-75 couponcode-wrap">
				        <input type="text" class="form-control" name="id" readonly="readonly" id="myid" value="${sessionScope.id }">
				    </div>
				    <br>
				    
 					<!--  비밀번호 입력칸 -->
		            <div class="form-group row">
		              <div class="col-md-9">
		                <label for="c_companyname" class="text-black">이름</label>
		                <input type=text class="form-control"  readonly="readonly"  name="pwd" value="${sessionScope.name }" >
		              </div>
		            </div>
				 <!-- 이름 입력칸 -->		            
		            <div class="form-group row">
		              <div class="col-md-9">
		                <label for="c_name" class="text-black">Email Address</label>
		                <input type="text" class="form-control"  readonly="readonly"  name="address" value="${sessionScope.email }">
		              </div>
		            </div>
		            <br>
		            
		         
		         <div class="form-group row">
		              <div class="col-md-3">
		                <label for="c_fname" class="text-black">Phone number <span class="text-danger">*</span></label>
		                <input type=text class="form-control" name="tel1"  value="010" readonly="readonly">
		                -
		              </div>
		              <div class="col-md-7">
		               <label for="c_fname" class="text-black">   </label>
		                <input type=text class="form-control" name="tel2" >
		              </div>
		        </div>
				
				<!-- E-mail -->
		            <div class="form-group row">
		              <div class="col-md-9">
		                <label for="c_email_address" class="text-black">Email Address <span class="text-danger">*</span></label>
		                <input type=text class="form-control" name="email">
		              </div>
		             
		            </div>
		            <br>
		            <!-- 생년월일 입력칸 -->
		            <div class="form-group row">
		              <div class="col-md-12">
		                <label for="c_state_country" class="text-black">봉사희망 날짜<span class="text-danger">*</span></label>
		                <br>
		                <input type=date name="birthday" size=50>
		              </div>
		            </div>
					<br>
					
					
					 <div class="form-group">
				              <label for="c_country" class="text-black">참여대상</label>
				              <select id="c_country" class="form-control">
				                <option value="1">Select one</option>    
				                <option value="2">일반성인</option>    
				                <option value="3">고등학생</option>    
				                <option value="4">대학생</option>    
				              </select>
				        </div>
					
					 <div class="form-group">
				              <label for="c_country" class="text-black">희망 봉사활동</label>
				              <select id="c_country" class="form-control">
				                <option value="1">Select one</option>    
				                <option value="2">도서관 이용안내</option>    
				                <option value="3">도서관 청소</option>    
				                <option value="4">자료실 정리 및 배치</option>    
				                <option value="5">서가 정리</option>    
				              </select>
				        </div>
				
		            <div class="form-group">
		              <label for="c_order_notes" class="text-black">기타</label>
		              <textarea  name="content" cols="30" rows="5" class="form-control" placeholder="Write your notes here..."></textarea>
		            </div>
		  </div>

   			<br><br>
	        <div class="text-center">
	             <!-- <input type=submit value="신청서 작성하기" class="btn btn-sm btn-primary" onClick="location.href='../mypage/mypage_Volunteer_submit.do'"> -->
					<button>
		                  <a href="../mypage/mypage_Volunteer_submit.do">신청서 작성하기</a>
		            </button>
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
