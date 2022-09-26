<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#cate tr').css("color","rgb(103, 114, 148)");
	$('#cate tr #total').css("color","rgb(103, 114, 148)");
	  $('#cate tr').click(function(){
		  $('#cate tr').css("color","rgb(103, 114, 148)");
		  $(this).css("color","black");
	  })
	  $('.filterBtn').click(function(){
		  $('.filterBtn').css("background-color","#f0f8ff");
		  console.log(this);
		  $(this).css("background-color","rgb(153 207 255)");
	  })
})
</script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
@font-face {
    font-family: 'yangjin';
    src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
*{
font-family:'Pretendard-Regular'
}
h3, h4, h5{
  font-family:'yangjin'
  font-weight: bold;
  margin: 20px 0px 0px;
}
.container{
	margin-top: 30px;
}
.row{
	margin: 0px auto;
	width: 100%;
}
.subject{
	position: relative;
    color: rgb(103, 114, 148);
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
  background-color: #FFF;
  width: 280px;
  height: 540px;
  margin: auto;
  border-radius: 1%;
 /*  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); */
  transform: scale(0.8);
  display: inline-block;
}

.img {
  width: 280px;
  height: 400px;
  border-radius: 1% 1% 0 0;
}
p {
  font-size: 16px;
  font-weight: 300;
  width: 240px;
  margin: 8px 0px 0px;
  color: #757575;
}
.filterBtn{
	background-color: #f0f8ff;
}
</style>
</head>
<body>
	<div class="container">
		<div id="book_list">
			<div style="height:20px"></div>
			<div class="row row1">
				<div class="col-lg-2 side">
					<h4 class="subject" style="text-align:center">카테고리 목록</h4>
					<table id="cate" style="text-align:center; margin:0px auto; border-block:solid #f0f8ff">
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
				<h3 v-if="type===''">전체</h3>
					<h3 v-else>{{type}}</h3>
					<h5>총 {{cnt}} 권의 중고책이 있습니다.</h5>
					<div class="text-right">
						<input type=button class="btn btn-sm filterBtn" value="최신등록순" @click="typeChange(type,1)">
						<input type=button class="btn btn-sm filterBtn" value="낮은가격순" @click="typeChange(type,2)">
						<input type=button class="btn btn-sm filterBtn" value="높은가격순" @click="typeChange(type,3)">
						<input type=button class="btn btn-sm filterBtn" value="제목순" @click="typeChange(type,4)">
					</div>
					<div style="height:20px"></div><!-- 간격띄우기 -->
				  <div class="card1" v-for="vo in book_list" style="display: inline-block;">
				    <a :href="'../shop/detail.do?no='+vo.no"><img :src="vo.img" align="middle" class="img"/>
				    <h4>{{vo.title}}</h4>
				    <p>{{vo.author}}</p>
				    <p>{{vo.publisher}}</p>
				    <h5>{{vo.discount}}&nbsp;|&nbsp;{{vo.percent}}</h5>
				    </a>
				  </div>  
			 
				  <div style="margin-top: 20px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
			      <div style="height: 20px"></div>
			        <div class="text-center">
			          <button class="btn btn-sm btn-info" v-on:click="prev()">이전</button>
			            {{curPage}} page / {{totalPage}} pages
			          <button class="btn btn-sm btn-info" v-on:click="next()">다음</button>
			      </div>

				</div>
			</div>
		</div>
	</div>
<script>
	const list = new Vue({
		el:'.container',
		data:{
			curPage:1,
			totalPage:0,
			book_list:[],
			type:'',
			cnt:0,
			cookie_list:[],
			order:1,
			id:''
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
					console.log(result.data);
					_this.book_list = result.data;
					_this.curPage = result.data[0].curPage;
					_this.totalPage = result.data[0].totalPage;
					_this.type = result.data[0].type;
					_this.cnt = result.data[0].cnt;
					$('html,body').scrollTop(0);
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