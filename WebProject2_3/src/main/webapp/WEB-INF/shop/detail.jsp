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
		<div class="row" id="book_detail">
			<table class="table">
				<tr>
					<td colspan="2" width="40%"><h3>{{book_detail.title}}</h3></td>
				</tr>
				<tr>
					<td colspan="2" width="40%">{{book_detail.author}} 지음&nbsp;|&nbsp;{{book_detail.publisher}} 발행</td>
				</tr>
				<tr>
					<td class="text-center" rowspan="5" width="40%">
						<img :src="book_detail.img" style="width:400px; height:550px;">
					</td>
				</tr>
				<tr>
					<td><h5>책 상태</h5><br>{{book_detail.condition}}</td>
				</tr>
				<tr>
					<td><h5>정가</h5><br>{{book_detail.price}}원</td>
				</tr>
				<tr>
					<td><h5>할인가</h5><br>{{book_detail.discount}}원</td>
				</tr>
				<tr>
					<td>
						<a :href="'../shop/cart_insert.do?no='+book_detail.no" class="btn btn-lg btn-primary">장바구니 담기</a>
					</td>
				</tr>
				<tr>
					<td style="text-align:right">
						<a href="../shop/list.do" class="btn btn-xs btn-primary" @click="javascript:history.back()">이전</a>
					</td>
				</tr>
			</table>
		<div stlye="height:20px"></div>
		<h3>최근 본 책</h3>
		<div class="row" id="cookie_list">
			<img :src="c.img" style="width:60px;height:100px;margin-left:5px" v-for="c in cookie_list">
		</div>
		<div style="height:20px"></div>
		</div>
	</div>
<script>
new Vue({
	el:'#book_detail',
	data:{
		no:${no},
		book_detail:{},
		cookie_list:[]
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
		axios.get("http://localhost:8080/web/shop/cookie_list.do",{
		}).then(function(result){
			console.log(result.data);
			_this.cookie_list = result.data;
		}) 
	}
})
</script>
</body>
</html>
<!--  https://jqueryui.com/dialog/#modal-confirmation
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Dialog - Modal confirmation</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#dialog-confirm" ).dialog({
      resizable: false,
      height: "auto",
      width: 400,
      modal: true,
      buttons: {
        "Delete all items": function() {
          $( this ).dialog( "close" );
        },
        Cancel: function() {
          $( this ).dialog( "close" );
        }
      }
    });
  } );
  </script>
</head>
<body>
 
<div id="dialog-confirm" title="Empty the recycle bin?">
  <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>These items will be permanently deleted and cannot be recovered. Are you sure?</p>
</div>
 
<p>Sed vel diam id libero <a href="http://example.com">rutrum convallis</a>. Donec aliquet leo vel magna. Phasellus rhoncus faucibus ante. Etiam bibendum, enim faucibus aliquet rhoncus, arcu felis ultricies neque, sit amet auctor elit eros a lectus.</p>
 
 
</body>
</html> -->