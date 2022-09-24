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
.selected-table{
  background-color: lightsteelblue;
}
</style>
</head>
<body>
<div class="container"  id="room-area">
	<div class="row" style="width: 100%;">
	  <h1>금일 열람실 현황</h1>
	</div>
	<hr>
	<div class="row text-center btn-area" style="margin-bottom: 15px;">
	 <button type="button" class="btn btn-lg btn-success" style="margin-right: 20px;" @click="change(1)">제 1 열람실</button>
	 <button type="button" class="btn btn-lg btn-success" style="margin-right: 20px;" @click="change(2)">제 2 열람실</button>
	 <button type="button" class="btn btn-lg btn-success" style="margin-right: 20px;" @click="change(3)">제 3 열람실</button>
	</div>
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
	     <c:forEach var="vo" items="${list}" varStatus="s">
		     <tr style="text-align-last: center;" :class="roomNo==${vo.no }?'selected-table':''">
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
		<jsp:include page="./booking_info.jsp"></jsp:include>
	   </div> 
	  </div>
</div>
<script>
new Vue({
	el:'#room-area',
	data:{
		seat_data:[], // 열람실별 좌석정보 
		roomNo: 1,   // 열람실 번호
		selected_no:0, // 선택 좌석번호
		onoff:0, // 좌석 중복 선택 방지 변수
		now_date:'', // 현재 날짜
		now_time:'', // /시간
		after_time:'' // 기본 3시간 예약
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
		},
		change:function(room_no){
			const selected_seat=document.querySelector(".selected:not(.state1)");
			if(selected_seat != null){
				selected_seat.classList.remove("selected");
			}
			this.selected_no=0;
			this.onoff=0;
			
			this.seat(room_no);
		},
		toggle:function(){
			if(!event.target.classList.contains("occupied")){
				
				if(this.onoff==0){
				   event.target.classList.toggle("selected");
				   this.selected_no=event.target.getAttribute('data');
				   this.onoff=this.onoff+1;
				   
				   this.myDate();
				   
				}
				else{
					if(event.target.classList.contains("selected")){
						event.target.classList.toggle("selected");
						this.selected_no=0;
						this.now_date=''; 
						this.now_time='';
						this.after_time=''; 
						this.onoff=this.onoff-1;
					}
				} 
			}
			
		},
		myDate:function(){
			let date=new Date();
			let year=date.getFullYear();
			let month = date.getMonth()+1;
			let day = date.getDate();
			this.now_date= year + '.' + month + '.' + day ; 
			
			let hou = ('0' + date.getHours()).slice(-2);
			let min = ('0' + date.getMinutes()).slice(-2);
			let sec = ('0' + date.getSeconds()).slice(-2);
			let after_hou = ('0' + (date.getHours()+3)).slice(-2);
			let after_min = ('0' + date.getMinutes()).slice(-2);
			let after_sec = ('0' + date.getSeconds()).slice(-2);
			if(hou <9){
				alert("현재는 예약할 수 없습니다. (개실 시간 : 09:00~18:00)");
				return;
			}
			if(hou>18 && min>0){
				alert("현재는 예약할 수 없습니다. (개실 시간 : 09:00~18:00)");
				return;
			}
			
			if(after_hou>18){
				after_hou='18';
				after_min='00';
				after_sec='00';
			}
			
			this.now_time= hou +':' + min + ':' + sec;
			this.after_time = after_hou +':' + after_min + ':00';  
		}
	}
})
</script>
</body>
</html>