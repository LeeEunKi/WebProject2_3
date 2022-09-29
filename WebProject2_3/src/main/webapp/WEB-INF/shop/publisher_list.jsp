<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
*{
font-family:'Pretendard-Regular'
}
h3, h5{
font-family:'yangjin'
}
.backBtn{
	background-color:rgb(32 42 38);
	border : none !important;
	color : white !important;
}
.filterBtn{
	background-color: #d1ded9;
	border : none !important;
	color : black !important;
}
.row{
	margin: 0px auto;
	width: 100%;
}
a{
	text-decoration: none !important;
}
a:hover{
	text-decoration: underline !important;
}
p{
	margin: 5px auto;
}
</style>
</head>
<body>
	<div class="container">
		<div id="book_list">
			<div style="height:20px"></div>
			<div class="row">
					<h3>{{publisher}}에서 출판한 책 목록</h3>
					<h5>총 {{cnt}} 권의 중고책이 있습니다.</h5>
					<div class="text-right">
						<input type=button  class="btn btn-sm backBtn" onclick="javascript:history.back()" value="돌아가기">
						<input type=button class="btn btn-sm filterBtn def" value="최신등록순" @click="typeChange(publisher,1)">
						<input type=button class="btn btn-sm filterBtn" value="낮은가격순" @click="typeChange(publisher,2)">
						<input type=button class="btn btn-sm filterBtn" value="높은가격순" @click="typeChange(publisher,3)">
						<input type=button class="btn btn-sm filterBtn" value="제목순" @click="typeChange(publisher,4)">
					</div>
					<div class="col-sm-3" v-for="vo in book_list">
						<div class="thumbnail" style="border:none">
							 <a :href="'../shop/detail_before.do?no='+vo.no">
								<img :src="vo.img" style="width:150px;height:250px;" class="images">
								<div class="caption">
									<b><p>[상태:{{vo.condition}}]{{vo.title }}</p></b>
									<p>{{vo.author}}&nbsp;|&nbsp;{{vo.publisher}}</p>
									<p>{{vo.discount|currency}}원 {{vo.type}}</p>
								</div>
							</a>
						</div>
					</div>
				<div style="height:20px"></div>
				<div class="text-center">
					<input type=button class="btn btn-lg btn-success" value="이전" @click="prev()">
						{{curPage}} page / {{totalPage}} pages
					<input type=button class="btn btn-lg btn-success" value="다음" @click="next()">
				</div>
				<div style="height:60px"></div>
			</div>
		</div>
	</div>
<script>
	const list = new Vue({
		el:'#book_list',
		data:{
			curPage:1,
			totalPage:0,
			book_list:[],
			publisher:'${publisher}',
			cnt:0,
			cookie_list:[],
			order:1
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
				axios.get("http://localhost:8080/web/shop/publisher_list_vue.do",{
					params:{
						page:_this.curPage,
						publisher:_this.publisher,
						order:_this.order
					}
				}).then(function(result){
					console.log(result.data);
					_this.book_list = result.data;
					_this.curPage = result.data[0].curPage;
					_this.totalPage = result.data[0].totalPage;
					_this.publisher = result.data[0].publisher;
					_this.cnt = result.data[0].cnt;
					$('html,body').scrollTop(0);
				})
			},
			typeChange:function(publisher,order){
				this.publisher = publisher;
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