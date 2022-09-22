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
&nbsp;&nbsp;<h2><b>상세보기 페이지</b></h2>
<hr>
   <div class="container">
     <div class="row">
      <div class="col-xs-12">
     <table summary="This table shows how to create responsive tables using Datatables' extended functionality" class="table table-bordered table-hover dt-responsive">
        <tr>
         <th width=20% class="text-center warning">번호</th>
         <td width=30% class="text-center">{{vo.no }}</td>
         <th width=20% class="text-center warning">작성일</th>
         <td width=30% class="text-center">{{vo.dbday }}</td>
        </tr>
        <tr>
         <th width=20% class="text-center warning">이름</th>
         <td width=30% class="text-center">{{vo.name }}</td>
         <th width=20% class="text-center warning">조회수</th>
         <td width=30% class="text-center">{{vo.hit }}</td>
        </tr>
        <tr>
         <th width=20% class="text-center warning">제목</th>
         <td colspan="3">{{vo.subject }}</td>
        </tr>
        <tr>
          <td colspan="4" class="text-left" valign="top" height="200">
           <pre style="white-space: pre-wrap;border:none;background-color: white;">{{vo.content }}</pre>
          </td>
        </tr>
        <tr>
          <td colspan="4" class="text-right">
            <a :href="'../board/update.do?no='+no" class="btn btn-xs btn-info">수정</a>
            <a :href="'../board/delete.do?no='+no" class="btn btn-xs btn-warning">삭제</a>
            <a href="../board/list.do" class="btn btn-xs btn-success">목록</a>
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
		   //array
		   vo:{},
		   no:${no}
	   },
	   //버튼을 누를때 X => 시작과 동시에 값을 가져옴
	   mounted:function(){
		   let _this=this;
		   axios.get("http://localhost:8080/web/board/detail_vue.do",{
			   params:{
					no:_this.no	   
			   }
		   //요청 처리 결과값 읽기 => 데이터값만 변경(상태변경)
		   }).then(function(result){
			   _this.vo=result.data;
		   })
	   }
   })
   </script>
</body>
</html>