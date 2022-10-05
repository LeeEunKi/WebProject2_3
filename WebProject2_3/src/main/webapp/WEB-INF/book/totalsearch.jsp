<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function () {
		$('#loan').click(function () {
			let id= '${sessionScope.id}';
			if(id.trim()==''){
				alert("로그인 후 확인 가능합니다");
				return;
			}
			else{
				location.href = "../book/loan.do";
			}
		})
		
		$('#like').click(function () {
			let id= '${sessionScope.id}';
			if(id.trim()==''){
				alert("로그인 후 확인 가능합니다");
				return;
			}
			else{
				location.href = "../book/like.do";
			}
		})
		
		$('.pageBtn').click(function () {
		$('html, body').animate({ scrollTop: 300 }, 'fast');
		//$("html, body").animate({scrollTop: 2250.984375}, 400);   /* 자동 스크롤 */
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



.col-lg-10 {
  width: 1000px;
}

.card1 {
  width: 320px;
  height: 450px;
  margin: auto;
  border-radius: 1%;
 /*  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); */
  transform: scale(0.8);
  display: inline-block;
}

.card1:hover {
  /* box-shadow: 0px 6px 6px rgba(0, 0, 0, 0.45); */
}

.img {
  width: 320px;
  height: 450px;
  border-radius: 1% 1% 0 0;
}

h4 {

  font-size: 24px;
  font-weight: bold;
  margin: 20px 0px 0px;
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
 
.sidebar span.active {
  background-color: #3b5d50;
  color: white;
}

.sidebar span:hover:not(.active) {
  background-color: #777;
  color: white;
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
  <!— Start Hero Section —>
    <div class="hero">
      <div class="container">
        <div class="row justify-content-between">
          <div class="col-lg-5">
            <div class="intro-excerpt">
              <h1>도서검색</h1>
            </div>
            
          </div>
          
          
        </div>
      </div>
    </div>
  <!— End Hero Section —>
  <div style="height: 30px"></div>
  <div class="container con1">
     <div class="row row1">
		             
		        <div class="col-lg-2 col-md-2 col-sm-12" style="border-right-style: solid; border-right-color: rgb(231, 234, 238);display: inline-block;float: right;">
						<div class="sidebar">
						  <a class="active"  href="../book/totalsearch.do">도서검색</a>
						      <span><a href="../book/totalsearch.do">&nbsp;&nbsp;도서명 검색</a></span>
			                  <span><a href="../book/authorsearch.do">&nbsp;&nbsp;저자명 검색</a></span>
						  <a href="../book/search.do">인기도서</a>
						  <a href="../book/categorysearch.do">주제별 도서</a>
						  <span class="loan" id="loan">예약 내역</span>
				          <span class="loan" id="like">관심도서 내역</span>
		             </div>
        

      <div class="col-lg-10 col-md-8 col-sm-12 content">
             <h3 style="margin-bottom: 15px;padding-left: 15px">검색 결과</h3>

					<div class="input-group mb-3" style="margin-left: 15px">
					  <div class="input-group">
					    <label class="btn btn-primary" for="inputGroupSelect01">도서명</label>

						  <input type="text" class="form-control" :value="title" ref="title" v-model="title">
	
						    <button class="btn btn-primary" type="button" id="button-addon2" v-on:click="titleSearch()">검색</button>
	
						</div>	
					  </div>	
					


				<hr style="margin-bottom: 0px">
				
				  <div class="card1" v-for="vo in book_list" style="display: inline-block;">
				    <a :href="'../book/detail.do?no='+vo.no"><img :src="vo.img" align="midde" alt="Random Unsplash image" class="img" style="width: 300px ;height: 420px"/>
				    <h4>{{vo.title}}</h4>
				    <p>{{vo.author}}</p>
				    <p>{{vo.publisher}}</p>
				    </a>
				  </div>  

			 
				  <div style="margin-top: 20px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
			      <div style="height: 20px"></div>
			        <div class="text-center">
			          <button class="btn btn-sm btn-info pageBtn" v-on:click="prev()">이전</button>
			            {{curpage}} page / {{totalpage}} pages
			          <button class="btn btn-sm btn-info pageBtn" v-on:click="next()">다음</button>
			      </div>
				

	</div>
			    
                
</div>
</div>
		 

<script type="text/javascript">
 new Vue({
	 el:'.con1',
	 data:{
		 book_list:[],
		 title:'행복',
		 totalpage:0,
		 curpage:1
	 },
	 mounted:function(){
		 this.send();
	 },
	 methods:{
		 send:function(){
			 axios.get('http://localhost:8080/web/book/totalsearch_vue.do',{
				 params:{
					 title:this.title,
					 page:this.curpage
				 }
			 }).then(result=>{
				 console.log(result); //일단 출력이 되는지 확인
				 
				 this.book_list=result.data;
				 this.curpage=this.book_list[0].curpage;
				 this.totalpage=this.book_list[0].totalpage;
			 })
		 },
		 titleSearch:function(){
			 if(this.title=="")
			 {
				 alert("도서명을 입력해주세요");
				 this.$refs.title.focus();
				 return;
			 }
			 this.send();
		 },
		 prev:function(){
			  this.curpage=this.curpage>1?this.curpage-1:this.curpage;
			  this.send();
	     },
	     next:function(){
		     this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
		     this.send();
	     }
	 }
 })

</script>
</body>
</html>