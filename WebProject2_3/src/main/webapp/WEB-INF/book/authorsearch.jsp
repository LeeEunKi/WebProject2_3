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



.col-lg-9 {
  /* background: #F2F2F2; */
}

.card1 {
  background-color: #FFF;
  width: 340px;
  height: 540px;
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
  width: 340px;
  height: 400px;
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
</style>
</head>
<body>


<div class="section" style="padding-bottom:0px">
	<div class="container-fluid con1">
			<div class="row text-left mb-5">
				<div class="col-12 text-center">
				<h2 class="font-weight-bold heading text-primary mb-4" style="padding-top: 20px;float: left">도서검색</h2>
				      <h2 style="font-weight: 700;display: inline; padding-left: 25px">도서명: </h2>
				      <input class="form-control" aria-label="Large" style="position: relative; top: -3px;" type="text" size="30" :value="author" ref="author" v-model="author">
				      <!-- vo-model은 아래 new Vue 안에 있는 data title='' 값을 바꿔주는 역할  -->
				      <input type="button" value="검색" class="btn btn-lg btn-primary" style="position: relative; top: -6px;" v-on:click="authorSearch()">
				  <hr>
				</div>
			</div>

		
	<div class="row row1">
				<div class="col-lg-2 side" style="border-right-style: solid; border-right-color: rgb(231, 234, 238);">
         			<div class="ui vertical text menu sidemenu" style="margin-bottom: 15px">
         			   <a href="../book/totalsearch.do"><h2 class="subject">자료검색</h2></a>
         			   <ul style="list-style: none;">
         			     <a href="../book/totalsearch.do"><li>도서명 검색</li></a>
         			     <a href="../book/authorsearch.do"><li>저자명 검색</li></a>
         			   </ul>
            			
          			</div>
          			<div class="ui vertical text menu sidemenu" style="margin-bottom: 15px">
         			   <a href="../book/search.do"><h2 class="subject">인기도서</h2></a>
            			
          			</div>
          			<div class="ui vertical text menu sidemenu" style="margin-bottom: 15px">
         			   <h2 class="subject">주제별검색</h2>
            			
          			</div>
			    </div>
		          
		   	    

	<div class="col-lg-10">
				<h3 style="margin-bottom: 0px">검색 결과</h3>
				<h5 style="margin-top: 5px">Horizontal card11s</h5>
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
			          <button class="btn btn-sm btn-info" v-on:click="prev()">이전</button>
			            {{curpage}} page / {{totalpage}} pages
			          <button class="btn btn-sm btn-info" v-on:click="next()">다음</button>
			      </div>
				

	</div>
			    
                
</div>
</div>
		 

<script type="text/javascript">
 new Vue({
	 el:'.con1',
	 data:{
		 book_list:[],
		 author:'김',
		 totalpage:0,
		 curpage:1
	 },
	 mounted:function(){
		 this.send();
	 },
	 methods:{
		 send:function(){
			 axios.get('http://localhost:8080/web/book/authorsearch_vue.do',{
				 params:{
					 author:this.author,
					 page:this.curpage
				 }
			 }).then(result=>{
				 console.log(result); //일단 출력이 되는지 확인
				 
				 this.book_list=result.data;
				 this.curpage=this.book_list[0].curpage;
				 this.totalpage=this.book_list[0].totalpage;
			 })
		 },
		 authorSearch:function(){
			 if(this.title=="")
			 {
				 alert("저자명을 입력해주세요");
				 this.$refs.author.focus();
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