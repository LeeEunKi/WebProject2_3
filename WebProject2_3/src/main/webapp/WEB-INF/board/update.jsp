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
		
&nbsp;&nbsp;<h2><b>수정하기 페이지</b></h2>
  <div class="container">
    <div id="board_update">
    <div class="row row1">
      <table class="table">
       <tr>
         <th width=20% class="text-right">이름</th>
         <td width=80%>
           <input type=text  ref="name" size=20 class="input-sm" v-model="name">
           <%--
               v-bind:value=""
            --%>
           <input type=hidden name=no :value="vo.no">
         </td>
       </tr>
       <tr>
         <th width=20% class="text-right">제목</th>
         <td width=80%>
           <input type=text  ref="subject" size=50 class="input-sm" v-model="subject">
         </td>
       </tr>
       <tr>
         <th width=20% class="text-right">내용</th>
         <td width=80%>
           <textarea rows="10" cols="50" v-model="content" ref="content">{{content }}</textarea>
         </td>
       </tr>
       <tr>
         <th width=20% class="text-right">비밀번호</th>
         <td width=80%>
           <input type=password v-model="pwd" ref="pwd" size=15 class="input-sm">
         </td>
       </tr>
       <tr>
        <td colspan="2" class="text-center">
          <input type=button value="수정" class="btn btn-sm btn-warning" v-on:click="boardUpdate()">
          <input type=button value="취소" class="btn btn-sm btn-info"
            onclick="javascript:history.back()">
        </td>
       </tr>
      </table>
    </div>
    </div>
  </div>
  <script>
   new Vue({
	   el:'#board_update',
	   data:{
		   name:'',
		   subject:'',
		   content:'',
		   pwd:'',
		   vo:{},
		   no:${no},
		   res:''
	   },
	   mounted:function(){
		   let _this=this;
		   axios.get("http://localhost:8080/web/board/update_vue.do",{
			   params:{
				   no:_this.no
			   }
		   }).then(function(result){
			   _this.vo=result.data;
			   _this.name=_this.vo.name;
			   _this.subject=_this.vo.subject;
			   _this.content=_this.vo.content;
		   })
	   },
	   methods:{
		   boardUpdate:function(){
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
	   			let _this=this;
	   			axios.get("http://localhost:8080/web/board/update_vue_ok.do",{
	   				params:{
	   					no:_this.no,
	   					name:_this.name,
	   					subject:_this.subject,
	   					content:_this.content,
	   					pwd:_this.pwd
	   				}
	   			}).then(function(result){
	   				_this.res=result.data; // YES/NO
	   				if(_this.res==='yes')
	   				{
	   					location.href="../board/detail.do?no="+_this.no;
	   				}
	   				else
	   				{
	   					alert("비밀번호가 틀립니다!!");
	   					_this.pwd="";
	   					_this.$refs.pwd.fodcus()
	   				}
	   			})
		   }
	   }
   })
  </script>
</body>
</html>