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
<div class="container" id="room-area">
	<div class="row text-center">
	  <h1>열람실 좌석 현황</h1>
	</div>
	<hr>
	<div class="row text-center btn-area">
	 <button type="button" class="btn btn-lg btn-success" style="margin-right: 20px;" @click="seat(1)">제 1 열람실</button>
	 <button type="button" class="btn btn-lg btn-success" style="margin-right: 20px;" @click="seat(2)">제 2 열람실</button>
	 <button type="button" class="btn btn-lg btn-success" style="margin-right: 20px;" @click="seat(3)">제 3 열람실</button>
	</div>
	  <h4>제 {{roomNo}} 열람실 좌석 현황</h4>
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
	    <div class="col-sm-7">
			<div class="plane-container">
			  <div class="plane">
			  <div class="row">
	            <div style="height: 50px;"><h4>제 <strong>{{roomNo}}</strong> 열람실 좌석 현황</h4></div>
	    	  </div>
			   <c:forEach begin="0" end="9" varStatus="i">
			     <div class="row">
			     <c:forEach begin="1" end="10" varStatus="j">
			        <div v-for="svo in seat_data"  :class="['seat',svo.state]" 
			           v-if="svo.no === ${j.index+(i.index*10)} ">
			         {{svo.no}}
			        </div>
	      	      </c:forEach>
			     </div>
			   </c:forEach>
			  </div>
			</div>
		</div>
		<div class="col-sm-5">
			  <div class="state">
		    	  <ul class="showcase">
				    <li>
				      <div class="seat"></div>
				      <small>선택 가능</small>
				    </li>
				    <li>
				      <div class="seat selected"></div>
				      <small>선택 됨</small>
				    </li>
				    <li>
				      <div class="seat occupied"></div>
				      <small>선택 완료</small>
				    </li>
				  </ul>
		  	</div>
		</div>
	   </div> 
	  </div>
</div>
<script src="../css/room_script.js"></script>
<script>
new Vue({
	el:'#room-area',
	data:{
		seat_data:[],
		roomNo: 1
	},
	mounted:function(){
		this.seat(this.roomNo);
	},
	methods:{
		seat:function(room_no){
			axios.get('http://localhost:8080/web/study/room_state.do',{
				params:{
					room_no:room_no
				}
			}).then(result=>{
				console.log(result.data);
				this.seat_data=result.data;
				this.roomNo=this.seat_data[0].room_no;
			})
		}
	}
})
</script>
</body>
</html>