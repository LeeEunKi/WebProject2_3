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
				
  &nbsp;&nbsp;<h2><b>글 작성 페이지</b></h2>
  <div class="container">
   <div id="board_insert">
    <div class="row row1">
      <table class="table">
       <tr>
         <th width=20% class="text-right">이름</th>
         <td width=80%>
           <input type=text v-model="name" size=20 class="input-sm" ref="name" value="${sessionScope.name}">
         </td>
       </tr>
       <tr>
         <th width=20% class="text-right">제목</th>
         <td width=80%>
           <input type=text v-model="subject" size=50 class="input-sm" ref="subject">
         </td>
       </tr>
       <tr>
         <th width=20% class="text-right">내용</th>
         <td width=80%>
           <textarea rows="10" cols="50" v-model="content" ref="content"></textarea>
         </td>
       </tr>
       <tr>
         <th width=20% class="text-right">비밀번호</th>
         <td width=80%>
           <input type=password v-model="pwd" size=15 class="input-sm" ref="pwd">
         </td>
       </tr>
       <tr>
        <td colspan="2" class="text-center">
          <input type=button value="글쓰기" class="btn btn-sm btn-warning" v-on:click="boardWrite()">
          <%--
             v-on:click="aaa()"
             @click="aaa()"
           --%>
          <input type=button value="취소" class="btn btn-sm btn-info"
            onclick="javascript:history.back()">
        </td>
       </tr>
      </table>
    </div>
    </div>
  </div>
  <script>
  //입력하면 멤버변수 안에 값을 채워줌(name,subject...)
  new Vue({
  		el:'#board_insert',
  		data:{
  			name:'',
  			subject:'',
  			content:'',
  			pwd:''
  		},
  		methods:{
  			boardWrite:function(){
  				//this 안붙이면 지역변수로 인식 => this 꼭 붙이기
  				//유효성 검사 ) => 값이 공백이면 포커스 잡아줌
  				if(this.name.trim()=="")
  				{
  					this.$refs.name.focus();
  					return;
  				}
  				if(this.subject.trim()=="")
  				{
  					this.$refs.subject.focus();
  					return;
  				}
  				if(this.content.trim()=="")
  				{
  					this.$refs.content.focus();
  					return;
  				}
  				if(this.pwd.trim()=="")
  				{
  					this.$refs.pwd.focus();
  					return;
  				}
  				
  				//전송
  				axios.get("http://localhost:8080/web/board/insert_vue.do",{
  					//값 채워주기
  					params:{
  						name:this.name,
  						subject:this.subject,
  						content:this.content,
  						pwd:this.pwd
  					}
  				}).then(function(result){
  					location.href="../board/list.do";
  				})
  			}
  		}
  	})
  </script>
</body>
</html>






