<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
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
	text-decoration: underline !important;
}
span:hover{
	cursor: pointer;
	font-weight: 400;
}




/*  */

.sidebar {
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: #f1f1f1;
  position: absolute;
  height: 50%;
  overflow: hidden;
}

.sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}
 
.sidebar a.active {
  background-color: #3e84e0;
  color: white;
}
.sidebar a:hover:not(.active) {
  background-color: #555;
  color: white;
}

.sidebar span {
  display: block;
  color: black;
  padding: 8px 16px;
  text-decoration: none;
}
 
.sidebar span.active {
  background-color: #3e84e0;
  color: white;
}

.sidebar span:hover:not(.active) {
  background-color: #555;
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
		
            <!— Start Column 1 —>
        <div class="col-lg-2 col-md-2 col-sm-12" style="border-right-style: solid; border-right-color: rgb(231, 234, 238);display: inline-block;float: right;">
            <!--  <div class="ui vertical text menu sidemenu" style="margin-bottom: 15px;">
                <a href="../book/totalsearch.do"><h3 class="subject">자료검색</h3></a>      
              </div>
              <div class="ui vertical text menu sidemenu" style="margin-bottom: 15px">
                <a href="../book/search.do"><h3 class="subject">인기도서</h3></a>
                
              </div>
              <div class="ui vertical text menu sidemenu" style="margin-bottom: 15px">
                <h3 class="subject">주제별검색</h3>
                <ul style="list-style: none;">
                "순수과학","역사","언어","총류","기술과학","종교","철학","문학","예술","사회과학"
                  <li v-on:click="cate('총류')">총류</li>
                  <li v-on:click="cate('역사')">역사</li>
                  <li v-on:click="cate('언어')">언어</li>
                  <li v-on:click="cate('종교')">종교</li>
                  <li v-on:click="cate('철학')">철학</li>
                  <li v-on:click="cate('문학')">문학</li>
                  <li v-on:click="cate('예술')">예술</li>
 				  <li v-on:click="cate('순수과학')">순수과학</li>
                  <li v-on:click="cate('기술과학')">기술과학</li>
                  <li v-on:click="cate('사회과학')">사회과학</li>
                </ul>
              </div> -->
              <!-- <ul class="nav nav-pills  flex-column">
				  <li class="nav-item">
				    <a class="nav-link" aria-current="page" href="#">도서 검색</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">인기도서</a>
				  </li>
				  <li class="nav-item">
				    <span v-on:click="cate('총류')" class="nav-link active">주제별 검색</span>
				    <span v-on:click="cate('총류')">총류</span>
				    <span v-on:click="cate('역사')">역사</span>
				    <span v-on:click="cate('언어')">언어</span>
				    <span v-on:click="cate('종교')">종교</span>
				    <span v-on:click="cate('철학')">철학</span>
				    <span v-on:click="cate('문학')">문학</span>
				    <span v-on:click="cate('예술')">예술</span>
				    <span v-on:click="cate('순수과학')">순수과학</span>
				    <span v-on:click="cate('기술과학')">기술과학</span>
				    <span v-on:click="cate('사회과학')">사회과학</span>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link disabled">Disabled</a>
				  </li>
				</ul> -->
				<div class="sidebar">
				  <a href="../book/totalsearch.do">도서검색</a>
				  <a href="../book/search.do">인기도서</a>
				  <a class="active" href="../book/categorysearch.do">주제별 도서</a>
					<span v-on:click="cate('총류')">총류</span>
				    <span v-on:click="cate('역사')">역사</span>
				    <span v-on:click="cate('언어')">언어</span>
				    <span v-on:click="cate('종교')">종교</span>
				    <span v-on:click="cate('철학')">철학</span>
				    <span v-on:click="cate('문학')">문학</span>
				    <span v-on:click="cate('예술')">예술</span>
				    <span v-on:click="cate('순수과학')">순수과학</span>
				    <span v-on:click="cate('기술과학')">기술과학</span>
				    <span v-on:click="cate('사회과학')">사회과학</span>

				
             </div>
        

      <div class="col-lg-10 col-md-8 col-sm-12 content">
             <h3 style="margin-bottom: 15px;padding-left: 15px">{{type}} 검색 결과</h3>

				<hr style="margin-bottom: 0px">
				
				  <div class="card1" v-for="vo in book_list" style="display: inline-block;">
				    <a :href="'../book/detail.do?no='+vo.no"><img :src="vo.img" align="midde" alt="image" class="img" style="width: 300px ;height: 420px"/>
				    <h4>{{vo.title}}</h4>
				    <p>{{vo.author}}</p>
				    <p>{{vo.publisher}}</p>
				    </a>
				  </div>  

			 
				  <div style="margin-top: 20px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
			      <div style="height: 20px"></div>
			        <div class="text-center">
			          <button class="btn btn-sm btn-primary" v-on:click="prev()">이전</button>
			            {{curpage}} page / {{totalpage}} pages
			          <button class="btn btn-sm btn-primary" v-on:click="next()">다음</button>
			      </div>
      </div>
       
       
       
              <div style="height: 20px"></div>
   </div>
</div>






		 

<script type="text/javascript">
 	new Vue({
 		el:'.con1',
 		data:{
 			curpage:1,
 			totalpage:0,
 			book_list:[],
 			type:'총류',
 			page:''
 		},
 		mounted:function(){
 			this.send();
 			console.log(this.type);
 			console.log(this.page);
 		},
 		methods:{
			send:function(){
				let _this = this;
				axios.get("http://localhost:8080/web/book/categorysearch_vue.do",{
					params:{
						page:_this.curpage,
						type:_this.type
					}
				}).then(function(result){
					console.log(result);
					_this.book_list = result.data;
					_this.curpage = result.data[0].curpage;
					_this.totalpage = result.data[0].totalpage;
				})
		   },
		   cate:function(type){
			   this.type= type;
			   this.curpage =1;
			   this.send();
		   },
		   prev:function(){
				this.curpage = this.curpage>1?this.curpage-1:this.curpage;
				this.send();
			},
			next:function(){
				this.curpage = this.curpage<this.totalpage?this.curpage+1:this.curpage;
				this.send();
			}
 		}
 	}) 

</script>
</body>
</html>