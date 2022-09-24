<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
    border-top: 1px !important;  
    border-top-color: #f2f2f2;
}
.images:hover{
	cursor: pointer;
	
}

.thumbnail>img {
    margin-right: auto;
    margin-left: auto;
}
</style>
</head>
<body>

<div class="section" style="padding-bottom:0px">
	<div class="container-fluid">
			<div class="row text-left mb-5">
				<div class="col-12">
					<h2 class="font-weight-bold heading text-primary mb-4" style="padding-top: 20px">도서검색</h2>
					<hr>
				</div>
			</div>

		
	<div class="row row1">
				<div class="col-lg-2 side" style="border-right-style: solid; border-right-color: rgb(231, 234, 238);">
         			<div class="ui vertical text menu sidemenu" style="margin-bottom: 15px">
         			   <a href="../book/totalsearch.do"><h3 class="subject">통합자료검색</h3></a>
            			
          			</div>
          			<div class="ui vertical text menu sidemenu" style="margin-bottom: 15px">
         			   <a href="../book/search.do"><h3 class="subject">인기도서</h3></a>
            			
          			</div>
          			<div class="ui vertical text menu sidemenu" style="margin-bottom: 15px">
         			   <h3 class="subject">주제별검색</h3>
            			
          			</div>
			    </div>
			    

	<div class="col-lg-10">
				<h3 style="margin-bottom: 0px">검색 결과</h3>
				<h5 style="margin-top: 5px">Horizontal card11s</h5>
				<hr style="margin-bottom: 0px">
	</div>
			    <div class="col-lg-2"></div>

		     	<div class="col-lg-5">
			     	
					  <table class="table"> 
					    <tr style="vertical-align:middle" v-for="vo in book_data">
					      <td class="text-center">
					       <img :src="vo.img" style="width:160px; height:220px" class="images" v-on:click="detailData(vo.no)">  
					      </td>	  
					      <td colspan="2">
					        <h3>{{vo.title}}&nbsp;&nbsp;</h3><h4><span style="color: orange;">score</span></h4>
					        <ul style="list-style: none; padding-left: 0px;margin-left: 0px;">
					         <li>저자:&nbsp;&nbsp;{{vo.author}}</li>
					         <li>출판사:&nbsp;&nbsp;{{vo.publisher}}</li>
					         <li>출판일:&nbsp;&nbsp;{{vo.dbday}}</li>
					         <li>대출가능 권 수:&nbsp;&nbsp;{{vo.loancnt}}</li>
					        </ul>
					        <button style="float: right;margin-bottom: 5px" v-on:click="detailData(vo.no)">상세보기</button>
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
			   <div class="col-lg-5" v-show="isShow" v-if="isShow===true" style="margin-top: 10px">
		        <table class="table">
		          <tr>
		            <td class="text-center thumbnail" colspan="3" style="margin-bottom: 0px">
		              <img :src="book_detail.img" style="width: 50%;">
<!-- 		            </td> -->
		          </tr>
		        </table>
		          <table class="table">
		            <tr>
		              <td colspan="2">
		                <h3>{{book_detail.title}}&nbsp;&nbsp;<span style="color: orange;font-size: 16px;font-weight: 600;padding-left: 15px">{{book_detail.type}}</span></h3>
		              </td>
		            </tr>
		            <tr>
		              <td style="width: 20%">저자명</td>
		              <td style="width: 80%">{{book_detail.author}}</td>
		            </tr>
		            <tr>
		              <td style="width: 20%">출판사</td>
		              <td style="width: 80%">{{book_detail.publisher}}</td>
		            </tr>
		            <tr>
		              <td style="width: 20%">출판일자</td>
		              <td style="width: 80%">{{book_detail.dbday}}</td>
		            </tr>
		            <tr>
		              <td style="width: 20%">책소개</td>
		              <td style="width: 80%">{{book_detail.description}}</td>
		            </tr>
		            <tr>
		              <td style="width: 20%"></td>
		              <td style="width: 80%">
		                <a :href="'../book/detail.do?no='+book_detail.no" class="btn btn-sm btn-info"style="float: right">도서 예약</a>
		              </td>
		            </tr>
		            <!-- no,title,author,type,publisher,img,TO_CHAR(pub_date,'YYYY-MM-DD') AS dbday, description -->
		          </table>
                </div>
                
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