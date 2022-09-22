<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/room_style.css">
<style type="text/css">

h1 {
   text-align: center
}
body { 
  font-size: 140%; 
}

h2 {
  text-align: center;
  padding: 20px 0;
}

table caption {
  padding: .5em 0;
}


.p {
  text-align: center;
  padding-top: 140px;
  font-size: 14px;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  &nbsp;&nbsp;<h2><b>삭제하기 페이지</b></h2>
<hr>
   <div class="container">
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
   <script>
  
     new Vue({
    	 el:'.container',
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

