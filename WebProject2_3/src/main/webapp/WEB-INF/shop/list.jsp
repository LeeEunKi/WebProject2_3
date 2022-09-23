<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
*{
font-family:'Pretendard-Regular'
}
h3, h5{
font-family:'yangjin'
}
.container{
	margin-top: 30px;
}
.row{
	margin: 0px auto;
	width: 100%;
}
</style>
</head>
<body>
	<div class="container">
		<div id="book_list">
			<div style="height:20px"></div>
			<div class="row">
				<div class="col-sm-2">
					<h4 style="text-align:center">카테고리 목록</h4>
					<table>
						<tr @click="typeChange('')"><td>전체</td></tr>
						<tr @click="typeChange('총류')"><td>총류</td></tr>
						<tr @click="typeChange('순수과학')"><td>순수과학</td></tr>
						<tr @click="typeChange('역사')"><td>역사</td></tr>
						<tr @click="typeChange('언어')"><td>언어</td></tr>
						<tr @click="typeChange('기술과학')"><td>기술과학</td></tr>
						<tr @click="typeChange('종교')"><td>종교</td></tr>
					</table>
				</div>
				<div class="col-sm-10">
					<h3 v-if="type===''">전체</h3>
					<h3 v-else>{{type}}</h3>
					<h5>총 {{cnt}} 권의 중고책이 있습니다.</h5>
					<div class="text-right">
						<input type=button class="btn btn-sm" value="최신등록순" @click="typeChange(type,1)">
						<input type=button class="btn btn-sm" value="낮은가격순" @click="typeChange(type,2)">
						<input type=button class="btn btn-sm" value="높은가격순" @click="typeChange(type,3)">
						<input type=button class="btn btn-sm" value="제목순" @click="typeChange(type,4)">
					</div>
					<div style="height:20px"></div><!-- 간격띄우기 -->
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
				</div>
				<div class="text-center">
					<input type=button class="btn btn-lg btn-warning" value="이전" @click="prev()">
						{{curPage}} page / {{totalPage}} pages
					<input type=button class="btn btn-lg btn-warning" value="다음" @click="next()">
				</div>
			</div>
			<div style="height:20px"></div>
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