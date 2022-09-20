<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<div class="container">
		<div id="book_list">
			<div class="row">
				전체 몇권인지 나타낼 것임 {{cnt}}
			</div>
			<div style="height:20px"></div>
			<div class="row">
				<div class="col-sm-2">
					<h4>카테고리 목록</h4>
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
					<div class="text-center">
						<input type=button class="btn btn-lg btn-warning" value="이전" @click="prev()">
							{{curPage}} page / {{totalPage}} pages
						<input type=button class="btn btn-lg btn-warning" value="다음" @click="next()">
					</div>
					<div class="col-sm-4" v-for="vo in book_list">
						<div class="thumbnail">
							 <a :href="'../shop/detail_before.do?no='+vo.no"> <!-- 쿠키를 넣을까말까-->
								<img :src="vo.img" style="width:150px;height:250px;" class="images">
								<div class="caption">
									<p>[{{vo.condition}}]{{vo.title }}</p>
									<p>{{vo.author}}&nbsp;|&nbsp;{{vo.publisher}}</p>
									<p>{{vo.discount}} {{vo.type}}</p>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div style="height:20px"></div>
			<div class="row" id="seoul_cookie">
				<img :src="c.img" style="width:60px;height:100px;margin-left:5px" v-for="c in cookie_list">
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
			cookie_list:[]
		},
		mounted:function(){
			this.send();
		},
		methods:{
			send:function(){
				let _this = this;
				axios.get("http://localhost:8080/web/shop/list_vue.do",{
					params:{
						page:_this.curPage,
						type:_this.type
					}
				}).then(function(result){
					console.log(result.data);
					_this.book_list = result.data;
					_this.curPage = result.data[0].curPage;
					_this.totalPage = result.data[0].totalPage;
					_this.type = result.data[0].type;
					_this.cnt = result.data[0].cnt;
				})
				//쿠키 데이터 가져올 것임
				axios.get("http://localhost:8080/web/shop/cookie_list.do",{
				}).then(function(result){
					console.log(result.data);
					_this.cookie_list = result.data;
				}) 
			},
			typeChange:function(type){
				this.type = type;
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