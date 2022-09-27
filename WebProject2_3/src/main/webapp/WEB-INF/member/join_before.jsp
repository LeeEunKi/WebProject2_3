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
		
		
		<div class="untree_co-section">
  		 <div class="container">
  		 	
	  		 <div class="row mb-5">
			        <div class="col-md-12">
			          <div class="border p-4 rounded" role="alert" style="background-color:#F5E3CF;">
			           	 <b>💡회원님의 소중한 개인 정보를 위해, 비밀번호를 확인 해 주세요!💡</b>
			          </div>
			        </div>
			      </div>
			    <div class="row">
				<div id="join_before">
		          <div class="col-md-12 mb-12 mb-md-0">
		              <h2 class="h3 mb-3 text-black"><b>비밀번호 확인</b></h2>
		              <div class="p-3 p-lg-5 border bg-white">
						
						<div class="text-center">
		                <label for="c_code" class="text-black mb-3">비밀번호를 입력 해 주세요!</label>
		                <div class="input-group w-75 couponcode-wrap">
		                   <input type=password style='text-align:center' ref=pwd class="form-control me-2" v-model="pwd" placeholder="비밀번호를 입력하세요">
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
		          </div>
  		 		</div>
  		</div>
  		</div>
  		<script>
    new Vue({
       el:'#join_before',
       data:{
          pwd:''
       },
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
