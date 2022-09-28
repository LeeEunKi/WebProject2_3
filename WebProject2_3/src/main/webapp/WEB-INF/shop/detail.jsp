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
	 let id = '${sessionScope.id}';
	 console.log(id);
	 if(id.trim()==''){
		 alert('로그인 후 이용 가능합니다.');
		 return;
	 }else{
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
	 }
   
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
.soldout{
	opacity:30%
}
.soldout:hover{
	opacity:100%
}
.t{
	border-top: 1px solid #3c763d !important;
    border-bottom: 1px solid #3c763d !important;
}
.tt{
	border:none !important;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row" id="book_detail">
			<table class="table" style="border:none;">
				<tr>
					<td class="t" colspan="2" width="40%"><h3>{{book_detail.title}}</h3></td>
				</tr>
				<tr>
					<td class="t" colspan="2" width="40%">{{book_detail.author}} 지음&nbsp;|&nbsp;
					<a :href="'../shop/publisher_list.do?publisher='+book_detail.publisher">{{book_detail.publisher}}</a> 발행</td>
				</tr>
				<tr>
					<td class="text-center tt" rowspan="5" width="40%">
						<img :src="book_detail.img" style="width:400px; height:550px;":class="[book_detail.state===0?'img':'soldout img']"/>
					</td>
				</tr>
				<tr>
					<td class="tt" height=10></td>
				</tr>
				<tr>
					<td class="row1 tt">
						<h5>책 상태 <img id="infoIcon" src="../img/info.png" style="height:15px;"></h5>
						<p>{{book_detail.condition}}</p>
						<h5>정가</h5>
						<p style="text-decoration:line-through;color:darkred">{{book_detail.price|currency}}원</p>
						<h5>→&nbsp;{{book_detail.percent}} 할인!</h5>
						<img src="../img/sale.png" style="height:20px;float:left;"><p>&nbsp;{{book_detail.discount|currency}}원</p>
					</td>
				</tr>
				<tr>
					<td class="tt">
						<pre style="white-space: pre-wrap; font-family:'Pretendard-Regular';font-size:14px;">{{book_detail.desc}}</pre>
					</td>
				</tr>
				<tr>
					<td class="row1 tt">
						<button id="cartBtn" class="btn btn-primary" v-if="book_detail.state===0">
							<img src="../img/cart.png" style="width:20px;">&nbsp;장바구니 담기
						</button>
						<button id="cartBtn" class="btn btn-primary" v-if="book_detail.state!=0" disabled>
							<img src="../img/cart.png" style="width:20px;">&nbsp;구매 불가
						</button>
						<a class="btn btn-primary" :href="'../book/detail.do?no='+book_detail.book_no">
							<img src="../img/book_find2.png" style="width:20px;">&nbsp;빌려읽기
						</a>
						<a :href="'../shop/list.do?page='+book_detail.page" class="btn btn-primary" @click="javascript:history.back()">
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
		cookie_list:[],
		page:${page}
	},
	mounted:function(){
		let _this=this;
		axios.get("http://localhost:8080/web/shop/detail_vue.do",{
			params:{
				no:_this.no,
				page:_this.page
			}
		}).then(function(result){
			_this.book_detail=result.data
		})
		axios.get("http://localhost:8080/web/shop/cookie_list.do",{
		}).then(function(result){
			console.log(result.data);
			_this.cookie_list = result.data;
		}) 
	},
	filters:{ //금액 000,000 처리
		   currency: function(value){ // 금액 3자리 수 마다 따옴표 필터
               let num = new Number(value);
               return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
           }
	    }
})
</script>
</body>
</html>