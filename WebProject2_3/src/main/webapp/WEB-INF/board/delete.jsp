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
		
		
  &nbsp;&nbsp;<h2><b>삭제하기 페이지</b></h2>
<hr>
   <div class="container">
    <div id="board_delete">
     <div class="row">
      <div class="col-xs-12">
     <table summary="This table shows how to create responsive tables using Datatables' extended functionality" class="table table-bordered table-hover dt-responsive">
       <tr>
         <th width=20% class="text-right">비밀번호</th>
         <td width=80%>
           <%--
              $('#pwd') == ref="pwd"
              Jquery , Ajax , Vue ===== DOMScript (DOM:태그) 태그를 제어하는 프로그램
            --%>
           <input type=password v-model="pwd" ref="pwd" size=15 class="input-sm">
         </td>
       </tr>
       <tr>
        <td colspan="2" class="text-center">
          <input type=submit value="삭제" class="btn btn-sm btn-warning" v-on:click="boardDelete()">
          <input type=button value="취소" class="btn btn-sm btn-info"
            onclick="javascript:history.back()">
        </td>
       </tr>
      </table>
     </div>
   </div>
   </div>
   </div>
   <script>
  
     new Vue({
    	 el:'#board_delete',
    	 data:{
    		 no:${no},
    		 pwd:'',
    		 res:''
    	 },
    	 methods:{
    		 boardDelete:function(){
    			 let _this=this;
    			 axios.get("http://localhost:8080/web/board/delete_vue.do",{
    				 params:{
    					 no:_this.no,
    					 pwd:_this.pwd
    				 }
    			 }).then(function(result){
    				 _this.res=result.data
    				 
    				 if(_this.res=='yes')
    				 {
    					 location.href="../board/list.do"
    				 }
    				 else
    				 {
    					 alert("비밀번호가 틀립니다!!")
    					 _this.pwd="";
    					 _this.$refs.pwd.focus()
    				 }
    			 })
    		 }
    	 }
     })
   </script>
</body>
</html>

