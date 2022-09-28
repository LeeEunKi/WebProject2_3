<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<!-- Start Hero Section -->
			<div class="hero">
				<div class="container">
					<div class="row justify-content-between">
						<div class="col-lg-5">
							<div class="intro-excerpt">
								<h1>열람실 예약</h1>
							</div>
						</div>
						<div class="col-lg-7">
							
						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->
		
<div style="height: 50px"></div>

	<div class="container" id="room-area">
   		<div class="row row1">
		        <h1>금일 열람실 실시간 좌석현황</h1>
		        <hr>
		</div> 
		<div>
					  <table class="table table-bordered" style="margin-bottom: 50px;">
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
						     <tr style="text-align-last: center; cursor: pointer;" :class="roomNo==${vo.no }?'selected-table':''" @click="change(${s.index+1})">
						      <td>${vo.name }</td>
						      <td>${vo.total_seat }</td>
						      <td>${vo.used_seat }</td>
						      <td>${vo.remain_seat }</td>
						      <td>${vo.use } %</td>
						     </tr>
					     </c:forEach>
					    </tbody> 
					  </table>
		</div>
		
					  <div class ="row" id="seat-area">
					    <jsp:include page="./seat_detail.jsp"></jsp:include>
						<jsp:include page="./booking_info.jsp"></jsp:include>
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
		after_time:'', // 기본 3시간 예약
		member_name:''
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
				this.seat_data=result.data;
				this.roomNo=this.seat_data[0].room_no;
				this.member_name=this.seat_data[0].member_name;
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
				   this.myDate();
				   if(this.now_time=='')
					   return;
				   event.target.classList.toggle("selected");
				   this.selected_no=event.target.getAttribute('data');
				   this.onoff=this.onoff+1;
				   
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
			// 개방시간이 아닐 시 리턴
			/* if(date.getHours()<9 || (date.getHours()>=18 && date.getMinutes()>=0)){
				alert("현재는 예약할 수 없습니다. (개방 시간 : 09:00~18:00)");
				return;
			} */
			
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
			
			
			if(after_hou>18){
				after_hou='18';
				after_min='00';
				after_sec='00';
			}
			
			this.now_time= hou +':' + min + ':' + sec;
			this.after_time = after_hou +':' + after_min + ':00';  
		},
		booking:function(){
			if(this.selected_no==0){
				alert("좌석을 선택해주세요!");
				return;
			}
			
			axios.get('http://localhost:8080/web/study/room_booking.do',{
				params:{
					room_no:this.roomNo,
					seat_no:this.selected_no,
					date:this.now_date,
					start_time:this.now_time,
					end_time:this.after_time,
					member_id:this.member_id,
					type:1
				}
			}).then(result=>{
				if(result.data=='NO'){
					alert("이미 예약한 좌석이 있습니다!");
					return;
				}	
				else{
					alert("예약되었습니다!");
					location.href="../study/room_list.do";
				}
			})
		}
	}
})
</script>
</body>
</html>