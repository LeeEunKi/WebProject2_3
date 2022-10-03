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
		 
		 <!-- 안내 문구 출력 하는 곳 입니다!! 삭제 가능 -->
		 <div class="row mb-5">
		        <div class="col-md-12">
		          <div class="border p-4 rounded" role="alert" style="background-color:#F5E3CF;">
		           	  <b>💡 한번 탈퇴 시 재가입이 어려우니 신중하게 결정해주세요!💡</b>
		          </div>
	    	</div>
        </div>
        <!-- 안내 문구 출력 끝 -->
     
      <div class="row">
		<jsp:include page="../mypage/mypage_header.jsp"></jsp:include>
		 <div class="col-md-9 mb-9 mb-md-0">
		 
		 <!-- 여기서 부터 원하는 내용 넣어주시면 됩니다. -->
		     <h2 class="h3 mb-3 text-black"><b>회원 탈퇴하기</b></h2>
		    <div class="p-3 p-lg-5 border bg-white" style="width: auto">
		    <div id="join_delete">
		    <form method="post" action="../mypage/mypage_delete_ok.do">
		    
		       <div class="form-group row">
		        <label for="c_name" class="text-black" style="font-size: 20px">🔔 회원탈퇴약관 🔔</label>
		      	 <div class="col-md-12">
				    <p class="align-left">
				     	제11조 (회원 탈퇴 및 자격 상실)
						1. 회원은 회사에 언제든지 회원 탈퇴를 요청할 수 있으며 회사는 요청을 받은 즉시 해당 회원의 회원 탈퇴를 위한 절차를 밟아 NHN커머스 개인정보처리방침에 따라 회원 등록을 말소합니다.<br>
						2. 회사의 모든 서비스에서 이용중인 서비스의 기간이 남아있는 회원이 탈퇴 요청하였을 경우 회원탈퇴로 인한 서비스의 중지 또는 피해는 회원탈퇴 이용자에게 있습니다.<br>
						3. 회원이 서비스 이용에 있어서 본 약관 제 10조 내용을 위반하거나, 다음 각 호의 사유에 해당하는 경우 회사는 직권으로 회원자격 상실 및 회원탈퇴의 조치를 할 수 있습니다.<br>
						가. 다른 사람의 명의를 사용하여 가입 신청한 경우<br>
						나. 신청 시 필수 작성 사항을 허위로 기재한 경우<br>
						다. 관계법령의 위반을 목적으로 신청하거나 그러한 행위를 하는 경우<br>
						라. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청하거나 그러한 행위를 하는 경우<br>
						마. 다른 사람의 회사 서비스 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우<br>
						바. 관계 법령 위배와 본 약관이 금지하는 행위를 하는 회원 경우<br>
						4. 회사가 직권으로 회원탈퇴 처리를 하고자 하는 경우에는 말소 전에 회원에게 소명의 기회를 부여합니다.
				    </p>
				   </div>
				 </div>
				   <br>
				   <br>
				  <div style="font-size: 20px">
				   <p>탈퇴를 원할경우 모두 체크해주세요!</p>
				      <label><input type="checkbox"> 약관을 모두 확인하셨나요?</label><br><br>
				      <label><input type="checkbox"> 정말로 탈퇴를 원하시나요?</label>
				  </div>
				  
				  <br><br>
			        <tr>
			          <td colspan="2" class="text-center">
			            <input type=submit value="회원탈퇴" class="btn btn-sm btn-primary">
			            <input type=button value="취소" class="btn btn-sm btn-primary"
			              onclick="javascript:history.back()"
			            >
			          </td>
			        </tr>
			        </form>
			        </div>
		    </div>
		    </div>
		    <!-- 원하는 내용 출력 끝 -->
		    </div>
		   </div>
      </div>
     </div>
  <script>
    new Vue({
       el:'#join_delete',
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
             axios.get('http://localhost:8080/web/mypage/mypage_delete_ok.do',{
                params:{
                   pwd:this.pwd
                }
             }).then(function(result){
                let res=result.data;
                if(res==='yes')
                {
                	alert("탈퇴가 완료되었습니다! 이용해주셔서 감사합니다.");
                   location.href="../mypage/mypage_delete.do";
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
