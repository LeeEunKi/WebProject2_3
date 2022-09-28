<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
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
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
  $(function(){
	
    $('#postBtn').click(function(){
    	new daum.Postcode({
			oncomplete:function(data)
			{
				$('#post').val(data.zonecode)
				$('#addr1').val(data.address)
			}
		}).open()
    })
    
  });
  </script>
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
		           	  <b>💡회원님의 소중한 개인 정보를 위해, 비밀번호를 확인 해 주세요!💡</b>
		          </div>
		        </div>
     </div>
     
		  <div class="row">
		  
		  
		<jsp:include page="../mypage/mypage_header.jsp"></jsp:include>
		
		 <div class="col-md-9 mb-9 mb-md-0">
		     <h2 class="h3 mb-3 text-black"><b>회원 정보 수정</b></h2>
		    <div class="p-3 p-lg-5 border bg-white">
		    <form method="post" action="../member/join_update_ok.do">
      
       <div class="form-group row">
		              <div class="col-md-7">
		                <label for="c_name" class="text-black">ID</label>
		                <input type=text class="form-control" name="id" readonly="readonly" id="myid" value="${vo.id }">
		              </div>
		  </div>
     
     	 <div class="form-group row">
		              <div class="col-md-7">
		                <label for="c_name" class="text-black">Name</label>
		                <input type=text class="form-control" size=20 name="name" value="${vo.name }">
		              </div>
		  </div>
        	<br>
          <div class="form-group row">
		              <div class="col-md-12">
		                <label for="c_address" class="text-black">성별 <span class="text-danger">*</span></label>
		                <input type=radio name="sex" value="남자" ${vo.sex=='남자'?"checked":"" }>남자
          			  	<input type=radio name="sex" value="여자" ${vo.sex=='여자'?"checked":"" }>여자
		              </div>
		            </div>
      		<br>
      		
      		<div class="form-group row">
		              <div class="col-md-7">
		                <label for="c_email_address" class="text-black">Email Address <span class="text-danger">*</span></label>
		                <input type=text class="form-control" name="email" value="${vo.email }">
		              </div>
		             
		    </div>
     		
     		 <div class="form-group row">
     		 	 <div class="col-md-7">
		            	 <label for="c_email_address" class="text-black">우편번호 <span class="text-danger">*</span></label>
		            	 <div class="input-group w-75 couponcode-wrap">
		            	 <input type=text name="post" size=10 readonly="readonly" class="form-control" id="post"  value="${vo.post }">
		            	 &nbsp;&nbsp;&nbsp;
		            	 <div class="input-group-append">
            				<input type=button class="btn btn-black btn-sm" value="우편번호검색" id="postBtn">
            			</div>
            			</div>
            			</div>
		            </div>
		            
 		      <div class="col-md-7">
		                <label for="c_phone" class="text-black">Address <span class="text-danger">*</span></label>
		                 <input type=text name="addr1" size=70 class="form-control" id="addr1"  value="${vo.addr1 }">
		             </div>
      
					<div>
		            	 <div class="col-md-7">
		                <label for="c_phone" class="text-black">Detail Address <span class="text-danger">*</span></label>
		                <input type=text class="form-control" name="addr2"  value="${vo.addr2 }">
		              </div>
		            </div>
		            
     		 <div class="form-group row">
		              <div class="col-md-3">
		                <label for="c_fname" class="text-black">Phone number <span class="text-danger">*</span></label>
		                <input type=text class="form-control" name="tel1"  value="010" readonly="readonly">
		                -
		              </div>
		              <div class="col-md-4">
		               <label for="c_fname" class="text-black"> </label>
		                <input type=text class="form-control" name="tel2" value="${fn:substring(vo.tel,4,13) }">
		              </div>
		            </div>
		          
 			<div class="form-group">
		              <label for="c_order_notes" class="text-black">자기소개</label>
		              <textarea  name="content" cols="30" rows="5" class="form-control">${vo.content }</textarea>
		            </div>
   			<br><br>
	        <tr>
	          <td colspan="2" class="text-center">
	            <input type=submit value="회원수정" class="btn btn-sm btn-primary">
	            <input type=button value="취소" class="btn btn-sm btn-primary"
	              onclick="javascript:history.back()"
	            >
	          </td>
	        </tr>
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
