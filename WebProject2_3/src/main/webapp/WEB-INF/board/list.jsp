<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Vue를 이용한 코딩 => JSTL,EL 필요없음(for문 돌릴필요없음) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/room_style.css">
<style type="text/css">
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

table.dataTable th,
table.dataTable td {
  white-space: nowrap;
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
<hr>
<h2>자유게시판</h2>
<hr>
	<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table summary="This table shows how to create responsive tables using Datatables' extended functionality" class="table table-bordered table-hover dt-responsive">
        <thead>
          <tr>
            <th width=10% class="text-center">번호</th>
						<th width=45% class="text-center">제목</th>
						<th width=15% class="text-center">아이디</th>
						<th width=20% class="text-center">작성일</th>
						<th width=10% class="text-center">조회수</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="vo in board_list">
						<th width=10% class="text-center">{{vo.no}}</th>
						<th width=45%><a :href="'../board/detail.do?no='+vo.no">{{vo.subject}}</a></th>
						<th width=15% class="text-center">{{vo.name}}</th>
						<th width=20% class="text-center">{{vo.dbday}}</th>
						<th width=10% class="txt_org text-center">{{vo.hit}}</th>
					</tr>
          
        </tbody>
        <tfoot>
          <tr>
          <!-- 버튼 자리 -->
          </tr>
        </tfoot>
      </table>
    </div>
  </div>
</div>
	<script>
		new Vue({
			//el : 관리 영역 지정 => container
			el:'.container',
			data:{
				board_list:[],
				curpage:1,
				totalpage:0
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
					_this.board_list=result.data;
					_this.curpage=result.data[0].curpage;
					_this.totalpage=result.date[0].totalpage;
				})
			}
		})
	</script>
	
</body>
</html>