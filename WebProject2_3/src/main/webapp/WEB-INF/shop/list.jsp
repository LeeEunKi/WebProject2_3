<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('.def').css("background-color","#57786c");
	$('#cate tr').css("color","#57786c");
	  $('#cate tr').click(function(){
		  $('#cate tr').css("color","#57786c").css("font-weight","normal");
		  $(this).css("color","rgb(35 46 42)").css("font-weight","bold");
	  })
	  $('.filterBtn').click(function(){
		  $('.filterBtn').css("background-color","#f0f8ff");
		  console.log(this);
		  $(this).css("background-color","#57786c");
	  })
})
</script>

<style type="text/css">
#book_list{
font-family:'Pretendard-Regular'!important;
}
h3, h4, h5{
  font-family:'yangjin'!important;
  margin: 20px 0px 0px;
  color : #3b5d50;
}
.row{
	margin: 0px auto;
	width: 100%;
}
.subject{
	position: relative;
    color: #57786c;
    font-size: 18px;
    font-family: Medium, sans-serif;
    font-weight: bold;
    letter-spacing: -0.45px;
     margin-bottom: 15px; 
}
.side{
    width: 200px;
    border-right-style: inherit;
    border-right-width: thin;
    border-right-color: graytext;
}
.active_a{
   font-weight: bold;
}
.table>tbody>tr>td,
.table>tbody>tr>td, 
.table>tbody>tr>th, 
.table>tfoot>tr>td, 
.table>tfoot>tr>th, 
.table>thead>tr>td, 
.table>thead>tr>th {
    padding: 8px;
    vertical-align: top;
    border-top: none !important;  
}
.img:hover{
	cursor: pointer;
	
}
.col-lg-10{
	width: 1000px;
}
.card1 {
  /* background-color: #FFF; */
  width: 320px;
  height: 540px;
  margin: auto;
  border-radius: 1%;
 /*  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); */
  transform: scale(0.8);
  display: inline-block;
}

.img {
  width: 320px;
  height: 450px;
  border-radius: 1% 1% 0 0;
}
p {
  font-size: 16px;
  font-weight: 300;
  width: 320px;
  margin: 8px 0px 0px;
  color: #757575;
}

.book-text{
	position:absolute;
	top:40%;
	left:50%;
	width:100%;
	font-size:20px;
	color:red;
	transform:translate(-50%, -50%);
	text-align:center;
}
.soldout{
	opacity:30%
}
.filterBtn{
	background-color: #d1ded9;
	border : none !important;
	color : black !important;
}
a{
	text-decoration: none !important;
}
a:hover{
	text-decoration: underline !important;
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
						<h1>중고책 온라인몰</h1>
					</div>
				</div>
				<div class="col-lg-7">
					
				</div>
			</div>
		</div>
	</div>
<!-- End Hero Section -->

	<div class="container">
		<div id="book_list">
			<div style="height:20px"></div>
			<div class="row row1">
				<div class="col-lg-2 side">
					<h4 class="subject" style="text-align:center">카테고리 목록</h4>
					<table id="cate" style="text-align:center; margin:0px auto; border-block:solid #57786c">
						<tr id="total" @click="typeChange('')"><td>전체</td></tr>
						<tr @click="typeChange('총류')"><td>총류</td></tr>
						<tr @click="typeChange('순수과학')"><td>순수과학</td></tr>
						<tr @click="typeChange('역사')"><td>역사</td></tr>
						<tr @click="typeChange('언어')"><td>언어</td></tr>
						<tr @click="typeChange('기술과학')"><td>기술과학</td></tr>
						<tr @click="typeChange('종교')"><td>종교</td></tr>
					</table>
				</div>
				<div class="col-lg-10">
				<h3 v-if="type===''" style="color:#3b5d50">전체 카테고리</h3>
					<h3 v-else style="color:#3b5d50">{{type}} 카테고리</h3>
					<h5>총 {{cnt|currency}} 권의 중고책이 있습니다.</h5>
					<div style="text-align: right;">
						<input type=button class="btn btn-sm filterBtn def" value="최신등록순" @click="typeChange(type,1)">
						<input type=button class="btn btn-sm filterBtn" value="낮은가격순" @click="typeChange(type,2)">
						<input type=button class="btn btn-sm filterBtn" value="높은가격순" @click="typeChange(type,3)">
						<input type=button class="btn btn-sm filterBtn" value="제목순" @click="typeChange(type,4)">
					</div>
					<div style="height:20px"></div><!-- 간격띄우기 -->
				  <div class="card1" v-for="vo in book_list" style="display: inline-block;">
				  	<h5>상태 : {{vo.condition}}</h5>
				    <a :href="'../shop/detail_before.do?no='+vo.no+'&page='+curPage">
				    	<img :src="vo.img" align="middle" :class="[vo.state===0?'img':'soldout img']"/>
				    	<div class="book-text" v-if="vo.state!=0">구매불가</div>
				    	<h4>{{vo.title}}</h4>
				    </a>
				    <p>{{vo.author}}</p>
				    <p>{{vo.publisher}} 발행</p>
				    <h5 style="float:left; text-decoration:line-through; color:#c5c5c5;">&nbsp;{{vo.price|currency}}원&nbsp;</h5>
				    <h5 style="float:right; transform: translate(-25px);color:black;">({{vo.percent}}할인)&nbsp;{{vo.discount|currency}}원</h5>
				    
				  </div>  
			 
				  <div style="margin-top: 20px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
			      <div style="height: 30px"></div>
			        <div class="text-center">
			          <button class="btn btn-sm btn-success" v-on:click="prev()">이전</button>
			            {{curPage}} page / {{totalPage}} pages
			          <button class="btn btn-sm btn-success" v-on:click="next()">다음</button>
			      </div>
			      
			      <div style="height:60px"></div>
				</div>
			</div>
		</div>
	</div>
<script>
	new Vue({
		el:'#book_list',
		data:{
			curPage:${curPage},
			totalPage:0,
			book_list:[],
			type:'',
			cnt:0,
			cookie_list:[],
			order:1,
			id:'',
			page:''
		},
		mounted:function(){
			this.send();
		},
	    filters:{ //금액 000,000 처리
		   currency: function(value){ // 금액 3자리 수 마다 따옴표 필터
               let num = new Number(value);
               return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
           }
	    },
		methods:{
			send:function(){
				let _this = this;
				axios.get("http://localhost:8080/web/shop/list_vue.do",{
					params:{
						page:_this.curPage,
						type:_this.type,
						order:_this.order
					}
				}).then(function(result){
					_this.book_list = result.data;
					_this.curPage = result.data[0].curPage;
					_this.totalPage = result.data[0].totalPage;
					_this.type = result.data[0].type;
					_this.cnt = result.data[0].cnt;
					$('html,body').scrollTop(0);
					console.log("데이터 잘 불러왔음");
					//console.log(result.data);
					console.log(_this.book_list);
				})
			},
			typeChange:function(type,order){
				this.type = type;
				this.order = order;
				this.curPage = 1;
				this.send();
			},
			prev:function(){
				this.curPage = this.curPage>1?this.curPage-1:this.curPage;
				this.send();
			},
			next:function(){
				this.curPage = this.curPage<this.totalPage?this.curPage+1:this.curPage;
				this.send();
			}
		}
	})
</script>
</body>
</html>