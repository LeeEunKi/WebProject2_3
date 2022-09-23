<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$( function() {
 $('#cartBtn').click(function(){
    $('#dialog-confirm').dialog({
        resizable: false,
        height: "auto",
        width: 400,
        modal: true,
        buttons: {
          "장바구니에 추가": function() {
            location.href = '../shop/cart_insert.do?no='+${no};
          },
          "취소": function() {
            $( this ).dialog( "close" );
          }
        }
      });
 })
 $('#infoIcon').click(function(){
	 $('#dialog').dialog({
			width:400,
			height:150});
 })
});
</script>
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
.row1{
	border-top:none !important;
	height:200px !important;
}
#infoIcon:hover{
	cursor:pointer;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row" id="book_detail">
			<table class="table" style="border:none;">
				<tr>
					<td colspan="2" width="40%"><h3>{{book_detail.title}}</h3></td>
				</tr>
				<tr>
					<td colspan="2" width="40%">{{book_detail.author}} 지음&nbsp;|&nbsp;
					<a :href="'../shop/publisher_list.do?publisher='+book_detail.publisher">{{book_detail.publisher}}</a> 발행</td>
				</tr>
				<tr>
					<td class="text-center" rowspan="5" width="40%">
						<img :src="book_detail.img" style="width:400px; height:550px;">
					</td>
				</tr>
				<tr>
					<td height=10></td>
				</tr>
				<tr>
					<td class="row1">
						<img id="infoIcon" src="../img/info.png" style="height:20px;float:left;">
						<h5>책 상태</h5>
						<p>{{book_detail.condition}}</p>
						<h5>정가</h5>
						<p style="text-decoration:line-through;color:darkred">{{book_detail.price}}원</p>
						<h5>→&nbsp;할인가</h5>
						<img src="../img/sale.png" style="height:20px;float:left;"><p>&nbsp;{{book_detail.discount}}원</p>
					</td>
				</tr>
				<tr>
					<td>
						<pre style="white-space: pre-wrap; font-family:'Pretendard-Regular';font-size:14px;">{{book_detail.desc}}</pre>
					</td>
				</tr>
				<tr>
					<td class="row1">
						<button id="cartBtn" class="btn btn-primary">
							<img src="../img/cart.png" style="width:20px;">&nbsp;장바구니 담기
						</button>
						<a class="btn btn-primary" href="#">
							<img src="../img/book_find.png" style="width:20px;">&nbsp;빌려읽기
						</a>
						<a href="../shop/list.do" class="btn btn-primary" @click="javascript:history.back()">
							<img src="../img/list.png" style="width:20px;">&nbsp;목록으로
						</a>
					</td>
				</tr>
			</table>
		<div stlye="height:20px"></div>
		<h3>최근 본 책</h3>
		<div class="row" id="cookie_list">
			<a :href="'../shop/detail.do?no='+c.no" v-for="c in cookie_list">
				<img :src="c.img" style="width:60px;height:60px;margin-left:5px">
			</a>
		</div>
		<div style="height:20px"></div>
		</div>
		<div id="dialog-confirm" title="장바구니 담기?" style="display:none">
		  <p>선택하신 중고책을 장바구니에 추가하시겠습니까?</p>
		</div>
		<div id="dialog" title="품질 등급에 따른 할인율" style="display:none">
			<table>
				<tr>
					<th width="20%" class="text-center">등급</th>
					<th width="60%" class="text-center">헌 상태</th>
					<th width="20%" class="text-center">할인율</th>
				</tr>
				<tr>
					<td width="20%">최상</td>
					<td width="60%">새것에 가까움</td>
					<td width="20%">10%</td>
				</tr>
				<tr>
					<td width="20%">상</td>
					<td width="60%">약간의 사용감은 있으나 깨끗함</td>
					<td width="20%">20%</td>
				</tr>
				<tr>
					<td width="20%">중</td>
					<td width="60%">사용감이 많으며 헌 느낌이 남</td>
					<td width="20%">40%</td>
				</tr>
				<tr>
					<td width="20%">하</td>
					<td width="60%">표지 손상이 심하고 얼룩이 많음</td>
					<td width="20%">60%</td>
				</tr>
				<tr>
					<td width="20%">최하</td>
					<td width="60%">땔감</td>
					<td width="20%">70%</td>
				</tr>
			</table>
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
<!--  
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