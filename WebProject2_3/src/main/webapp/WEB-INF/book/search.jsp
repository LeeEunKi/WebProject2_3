<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function () {
		$('.loan').click(function () {
			let id= '${sessionScope.id}';
			if(id.trim()==''){
				alert("로그인 후 확인 가능합니다");
				return;
			}
			else{
				location.href = "../book/loan.do";
			}
		})
	})
</script>
<style type="text/css">
*{
	font-family: 'Noto Sans KR', sans-serif;

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
   font-weight: 500;
   color: #2964D9;
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
    border-top: none;  
    border-bottom: none;
    
 
}
.images:hover{
	cursor: pointer;
	
}

.thumbnail>img {
    margin-right: auto;
    margin-left: auto;
}
p {

  font-size: 16px;
  font-weight: 300;
  width: 240px;
  margin: 8px 0px 0px;
  color: #757575;
}
a{
	text-decoration: none !important;
}
a:hover{
	text-decoration: none !important;
}



.sidebar {
  margin: 0;
  padding: 0;
  width: 200px;

  position: absolute;
  height: 50%;
  overflow: hidden;
}

.sidebar a {
  display: block;
  color: black;
  font-weight: 600;
  font-size: 20px;
  padding: 16px;
  text-decoration: none;
}
 
.sidebar a.active {
  background-color: #3b5d50;
  color: white;
}
.sidebar a:hover:not(.active) {
  background-color: #777;
  color: white;
}

.sidebar span a {
  display: block;
  color: black;
  font-weight: 400;
  font-size: 17px;
  padding: 8px 16px;
  text-decoration: none;
}
.loan{
   display: block;
  color: black;
  font-weight: 600;
  font-size: 20px;
  padding: 16px;
  text-decoration: none;
}
.loan:hover:not(.active) {
  background-color: #777;
  color: white;
}
 
.sidebar span.active {
  background-color: #3b5d50;
  color: white;
}

.sidebar span:hover:not(.active) {
  background-color: #777;
  color: white;
}


div.content {
  margin-left: 200px;
  padding: 1px 16px;
}

@media screen and (max-width: 700px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
	.sidebar{
		display:flex;
	}
  div.content {
		margin-left: 0;
	}
}

@media screen and (max-width: 400px) {
	.sidebar{
		display:flex;
		flex-direction:column;
		text-align:center;
	}
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
								<h1>도서검색</h1>
							</div>
						</div>
						<div class="col-lg-7">
							
						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->
		<div style="height: 30px"></div>
		<div class="container">
		   <div class="row row1">

		      		<!-- Start Column 1 -->
				<div class="col-lg-2 col-md-2 col-sm-12" style="border-right-style: solid; border-right-color: rgb(231, 234, 238);display: inline-block;float: right;">
						<div class="sidebar">
						  <a href="../book/totalsearch.do">도서검색</a>
						      <span><a href="../book/totalsearch.do">&nbsp;&nbsp;도서명 검색</a></span>
			                  <span><a href="../book/authorsearch.do">&nbsp;&nbsp;저자명 검색</a></span>
						  <a class="active" href="../book/search.do">인기도서</a>
		
						  <a href="../book/categorysearch.do">주제별 도서</a>

						  <span class="loan">예약 내역</span>
		             </div>
		         </div>
			    

			<div class="col-lg-5 col-md-5 col-sm-12">
				<h3 style="margin-bottom: 0px">검색 결과</h3>
				<!-- <h5 style="margin-top: 5px">Horizontal card11s</h5> -->
				<hr style="margin-bottom: 0px">
			  
					  <table class="table"> 
					    <tr style="vertical-align:middle" v-for="vo in book_data">
					      <td class="text-center">
					       <img :src="vo.img" style="width:160px; height:220px" class="images" v-on:click="detailData(vo.no)">  
					      </td>	  
					      <td colspan="2">
					        <h3 class="h4 text-primary mb-4">{{vo.title}}&nbsp;&nbsp;</h3>
					       <span style="color: orange;"><h4 class="h5 mb-4">{{vo.type}}</h4></span>
					        <ul style="list-style: none; padding-left: 0px;margin-left: 0px;">
					         <li>저자:&nbsp;&nbsp;{{vo.author}}</li>
					         <li>출판사:&nbsp;&nbsp;{{vo.publisher}}</li>
					         <li>출판일:&nbsp;&nbsp;{{vo.dbday}}</li>
					         <li>대출가능 권 수:&nbsp;&nbsp;{{vo.loancnt}}<button class="btn btn-xs btn-primary" style="float: right;margin-bottom: 5px;padding: 8px 20px;" v-on:click="detailData(vo.no)">도서정보</button></li>
					        </ul>
					        
					        <hr style="width: 100%;background-color: rgb(231, 234, 238);">
					      </td>
					    </tr>
		    		</table>
	    		  <div style="margin-top: 20px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
	    		
				   
			      <div style="height: 20px"></div>
			        <div class="text-center">
			          <button class="btn btn-sm btn-info" v-on:click="prev()">이전</button>
			            {{curpage}} page / {{totalpage}} pages
			          <button class="btn btn-sm btn-info" v-on:click="next()">다음</button>
			        </div>
			   </div>
			   
			   
			   
			   
			   
			   <div class="col-lg-5" v-show="isShow" v-if="isShow===true" style="margin-top: 65px">
				        <table class="table" style="background-color: #f9f9f9;margin-bottom: 0px">
				          <tr>
				            <td class="text-center thumbnail" colspan="3" style="margin-bottom: 0px">
				              <img :src="book_detail.img" style="width: 50%;">
		 		            </td> 
				          </tr>
				        </table>
				          <table class="table">
				            <tr>
				              <td style="width: 20%;font-size: 18px;font-weight: 400;color: #F9F9F9;background-color: #3b5d50;border-bottom:1px solid #eff2f1;vertical-align: middle;" class="text-center">도서명</td>
				              <td style="background-color: #fff;border-bottom:1px solid #eff2f1">
				                <h3>{{book_detail.title}}&nbsp;&nbsp;<span style="color: orange;font-size: 16px;font-weight: 600;padding-left: 15px">{{book_detail.type}}</span></h3>
				              </td>
				            </tr>
				            <tr>
				              <td style="width: 20%;font-size: 18px;font-weight: 400;color: #F9F9F9;background-color: #3b5d50;border-bottom:1px solid #eff2f1;vertical-align: middle;" class="text-center">저자명</td>
				              <td style="width: 80%;background-color: #f9f9f9;border-bottom:1px solid #eff2f1">{{book_detail.author}}</td>
				            </tr>
				            <tr>
				              <td style="width: 20%;font-size: 18px;font-weight: 400;color: #F9F9F9;background-color: #3b5d50;border-bottom:1px solid #eff2f1;vertical-align: middle" class="text-center">출판사</td>
				              <td style="width: 80%;background-color: #fff;border-bottom:1px solid #eff2f1">{{book_detail.publisher}}</td>
				            </tr>
				            <tr>
				              <td style="width: 20%;font-size: 18px;font-weight: 400;color: #F9F9F9;background-color: #3b5d50;border-bottom:1px solid #eff2f1;vertical-align: middle" class="text-center">출판일자</td>
				              <td style="width: 80%;background-color: #f9f9f9;border-bottom:1px solid #eff2f1">{{book_detail.dbday}}</td>
				            </tr>
				            <tr>
				              <td style="width: 20%;font-size: 18px;font-weight: 400;color: #F9F9F9;background-color: #3b5d50;vertical-align: middle;" class="text-center">책소개</td>
				              <td style="width: 80%;background-color: #fff;border-bottom:1px solid #eff2f1">{{book_detail.description}}</td>
				            </tr>
				            <tr>
				              <td style="width: 20%"></td>
				              <td style="width: 80%">
				                <a :href="'../book/detail.do?no='+book_detail.no" class="btn btn-sm btn-primary"style="float: right">도서 예약</a>
				              </td>
				            </tr>
				            <!-- no,title,author,type,publisher,img,TO_CHAR(pub_date,'YYYY-MM-DD') AS dbday, description -->
				          </table>
                </div>
                
		 </div>
	</div>
		 


 
<script type="text/javascript">
    new Vue({
    	el:'.row1',
    	data:{
    		curpage:1,
    		totalpage:0,
    		book_data:[],
    		book_detail:{},
    		no:0,
    		isShow:false
    		
    	},
    	mounted:function(){
    		console.log("VueJS=>this:"+this); //Vue(Object)
    		let _this=this;
    		axios.get("http://localhost:8080/web/book/search_vue.do",{
    			params:{
    				page:_this.curpage
    			}
    		}).then(function(result){
    			console.log("function=>this:"+_this); // Window가 가지고 있는 this
    			console.log(result.data);
    			_this.book_data=result.data;
    			_this.curpage=result.data[0].curpage;
    			_this.totalpage=result.data[0].totalpage;
    		})
    	},
    	methods:{
    		prev:function(){
    			this.curpage=this.curpage>1?this.curpage-1:this.curpage;
    			let _this=this;
        		axios.get("http://localhost:8080/web/book/search_vue.do",{
        			params:{
        				page:_this.curpage
        			}
        		}).then(function(result){
        			_this.book_data=result.data;
        			_this.curpage=result.data[0].curpage;
        			_this.totalpage=result.data[0].totalpage;
        		})
    		},
    		next:function(){
    			this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
    			let _this=this;
        		axios.get("http://localhost:8080/web/book/search_vue.do",{
        			params:{
        				page:_this.curpage
        			}
        		}).then(function(result){
        			_this.book_data=result.data;
        			_this.curpage=result.data[0].curpage;
        			_this.totalpage=result.data[0].totalpage;
        		})
    		},
    		
    		detailData:function(no){
    			let _this=this;
    			_this.isShow=true;
    			axios.get("http://localhost:8080/web/book/detail_vue.do",{
        			params:{
        				no:no
        			}
        		}).then(function(result){
        			_this.book_detail=result.data;
        		})
    
    		}
    	}
    })
  </script>
</body>
</html>