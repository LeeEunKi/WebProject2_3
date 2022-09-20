<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
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
		<div class="row" id="book_detail">
			<table class="table">
				<tr>
					<td class="text-center" rowspan="4">
						<img :src="book_detail.img" style="width:300px; height:500px;">
					</td>
				</tr>
				<tr>
					<td><h3>{{book_detail.title}}</h3></td>
				</tr>
				<tr>
					<td><h3>{{book_detail.author}}</h3></td>
				</tr>
				<tr>
					<td><h3>{{book_detail.price}}</h3></td>
				</tr>
				<tr>
					<td class="text-right">
						<a href="../shop/list.do" class="btn btn-xs btn-primary" @click="javascript:history.back()">이전</a>
					</td>
				</tr>
			</table>
		</div>
		<div stlyee="height:20px"></div>
	</div>
<script>
new Vue({
	el:'#book_detail',
	data:{
		no:${no},
		book_detail:{}
	},
	mounted:function(){
		let _this=this;
		axios.get("http://localhost:8080/web/shop/detail_vue.do",{
			params:{
				no:_this.no
			}
		}).then(function(result){
			_this.book_detail=result.data
		})
	}
})
</script>
</body>
</html>