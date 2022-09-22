<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/room_style.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
thead{
	border: 1px;
    color: #F0F5FA;
    font-weight: bold;
    border-style: solid;
    border-color: #BFC3C5;
    background-color: #0054A6;
}
</style>
</head>
<body>
<div class="container">
<div class="row">
  <h1>열람실 좌석 현황</h1>
</div>
<hr>
<div class="row text-center btn-area">
 <button type="button" class="btn btn-lg btn-success" style="margin-right: 20px;" v-on:click="room(1)">제 1 열람실</button>
 <button type="button" class="btn btn-lg btn-success" style="margin-right: 20px;" v-on:click="room(2)">제 2 열람실</button>
 <button type="button" class="btn btn-lg btn-success" style="margin-right: 20px;" v-on:click="room(3)">제 3 열람실</button>
</div>
<div>
  <h4>제 1열람실 좌석 현황</h4>
  <table class="table table-bordered">
    <thead> 
      <tr style="text-align-last: center;">
        <th>열람실 명</th>
        <th>전체좌석</th>
        <th>사용좌석</th>
        <th>잔여좌석</th>
        <th>이용률(%)</th>
      </tr>
    </thead>  
    <tbody>  
     <c:forEach var="vo" items="${list}" >
	     <tr style="text-align-last: center;">
	      <td>${vo.name }</td>
	      <td>${vo.total_seat }</td>
	      <td>${vo.used_seat }</td>
	      <td>${vo.remain_seat }</td>
	      <td>${vo.use } %</td>
	     </tr>
     </c:forEach>
    </tbody> 
  </table>
  <div id="seat-area">
   <div class="row"> 
    <jsp:include page="./seat_detail.jsp"></jsp:include>
   </div> 
  </div>
</div>
</div>
</body>
<script src="../css/room_script.js"></script>
<script>
new Vue({
	el:'.btn-area',
	data:{
		room_seat:{}
	},
	methods:{
		room:function(no){
			axios.get('http://localhost:8080/web/study/room_state.do',{
				params:{
					type:no
				}
			}).then(result=>{
				alert(result.data);
				this.room_seat=result.data;
			})
		}
	}
})
</script>
</html>