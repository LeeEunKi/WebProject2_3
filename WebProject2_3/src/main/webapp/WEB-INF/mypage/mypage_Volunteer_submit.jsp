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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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

.pointcolor {
  color: #f84646 !important;
}
.pointbutton {
  color: #fff !important;
  background: #f84646 !important;
  border: 1px solid #f84646;
}
.pointbutton:hover {
  background: #db3a29 !important;
}


/* Menu */
.ui.secondary.pointing.menu {
  margin-left: 5%;
  margin-right: 5%;
}
.pointing.menu, .pointing.menu a {
  border: none !important;
}
.centermenu {
  margin: 0 auto !important;
}

.activecustom {
  color: #f84646 !important;
  font-weight: bold !important;
}
.item:hover{
  color: #f84646 !important;
  background: none !important;
}


/* Responsive Menu */
.hidden.menu {
   display: none;
}

.masthead.segment {
   min-height: 100px;
   padding: .25em 0em;
}

.secondary.pointing.menu .toc.item {
   display: none;
}

@media only screen and (max-width: 700px) {
  .ui.fixed.menu {
    display: none !important;
  }
  .secondary.pointing.menu .item {
    display: none;
  }
  .secondary.pointing.menu .toc.item {
    display: block;
  }
  .masthead.segment {
    min-height: 70px;
  }
}

.item--white {
  color: white !important;
}


/* header */
.logoimg {
  /*border: 1px solid #eee;*/
  margin-bottom: 20px;
  margin-top: -25px;
}


/* Contents */
.ui.sub-container {
  /*border: 1px solid #eee;*/
  margin: 0 4% 0 4%;
}
.ui.vertical.text.menu.sidemenu .item{
  /*border: 1px solid #eee;*/
  margin-bottom: 10%;

}
.ui.items p {
  margin-top: -10px;
}
.ui.items .item.pointcolor {
  text-decoration: underline;
  font-size: 16px;  
}


/* Table */
table td, th {
  padding: 10px 0 !important;
  text-align: center !important;
  font-size: 13px;
}
@media (min-width: 768px) {
  .sidebar-nav .navbar .navbar-collapse {
    padding: 0;
    max-height: none;
  }
  .sidebar-nav .navbar ul {
    float: none;
    display: block;
  }
  .sidebar-nav .navbar li {
    float: none;
    display: block;
  }
  .sidebar-nav .navbar li a {
    padding-top: 12px;
    padding-bottom: 12px;
  }
}

p {
	border : 1px solid #ccc;
	padding : 10px;
	margin : 10px;
}
.align-left {table-align:left};
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
		<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2"></div>
			   <div class="col-lg-8" style="margin-top: 20px">
			<div class="pusher">
			  <div class="ui vertical masthead segment" style="border: none;">
			   <div class="col-sm-3">
		    <div class="sidebar-nav">
		      <div class="navbar navbar-default" role="navigation">
		        <div class="navbar-header">
		          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
		            <span class="sr-only">Toggle navigation</span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		          </button>
		          <span class="visible-xs navbar-brand">Sidebar menu</span>
		        </div>
		        <div class="navbar-collapse collapse sidebar-navbar-collapse">
		          <ul class="nav navbar-nav">
		            <li><a href="../mypage/mypage_Volunteer.do">자원봉사 신청</a></li>
		            <li><a href="../mypage/mypage.do">내가 작성한 게시글 확인하기</a></li>
		            <li><a href="#">Menu Item 3</a></li>
		            <li><a href="#">Menu Item 4</a></li>
		            <li><a href="#">Reviews <span class="badge">1,118</span></a></li>
		          </ul>
		        </div><!--/.nav-collapse -->
		      </div>
		    </div>
		  </div>
   
    <div class="row mb-5">
		        <div class="col-md-8">
		          <div class="border p-4 rounded" role="alert" style="background-color:#F5E3CF;">
	           <!--   <img  src="volunteering.png">  -->
		           	 <b>회원님의 개인정보를 빠짐없이 기입 해 주세요!<br>
						내부 심사 후, 개별 연락 드릴 예정입니다.</b>
						
		          </div>
		        </div>
     </div>
    <div class="row">
     <div class="col-md-8 mb-7 mb-md-0">
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
  </div>
  </div>
  	<script>
    new Vue({
       el:'#join_before',
       methods:{
          ok:function(){
             if(this.pwd==="")
             {
                this.$refs.pwd.focus();//$('#id명').focus()
                return;
             }
             
             // 비밀번호 입력
             let _this=this;
             //axios.post() axios.get()
             axios.get('http://localhost:8080/web/member/join_before_ok.do',{
                params:{
                   pwd:this.pwd
                }
             }).then(function(result){
                let res=result.data;
                if(res==='yes')
                {
                   location.href="../member/join_update.do";
                }
                else
                {
                   alert("비밀번호가 틀립니다");
                   _this.pwd="";
                   _this.$refs.pwd.focus();
                }
             })
          }
       }
    })
  </script>
</body>
</html>
