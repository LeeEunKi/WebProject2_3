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
    border-top: none !important;  
}
.images:hover{
	cursor: pointer;
	
}
</style>
</head>
<body>

<div class="section" style="padding-bottom:0px">
		<div class="container">
			<div class="row text-left mb-5">
				<div class="col-12">
					<h2 class="font-weight-bold heading text-primary mb-4">도서검색</h2>
					<hr>
				</div>
			</div>

		</div>
</div>

<div class="section pt-0">
	<div class="container">
		<div class="row justify-content-between mb-5">
				<div class="col-lg-3 side" style="border-right-style: solid; border-right-color: rgb(231, 234, 238);">
         			<div class="ui vertical text menu sidemenu" style="margin-bottom: 15px">
         			   <h3 class="subject">통합자료검색</h3>
            			
          			</div>
          			<div class="ui vertical text menu sidemenu" style="margin-bottom: 15px">
         			   <h3 class="subject">인기도서</h3>
            			
          			</div>
          			<div class="ui vertical text menu sidemenu" style="margin-bottom: 15px">
         			   <h3 class="subject">주제별검색</h3>
            			
          			</div>
			    </div>
		     	<div class="col-lg-5 row1">
				  <table class="table"> 
				    <tr> 
				      <th width="15%" class="text-center">검색 결과</th>
				      <th width="60%"></th>
				      <th width="25%"></th>
				    </tr>
				    <tr style="vertical-align:middle" v-for="vo in book_data">
				      <td class="text-center">
				       <img :src="vo.img" style="width:160px; height:220px" class="images" v-on:click="detailData(vo.no)">  
				      </td>	  
				      <td colspan="2">
				        <h3>{{vo.title}}&nbsp;&nbsp;</h3><h4><span style="color: orange;">score</span></h4>
				        <ul style="list-style: none; padding-left: 0px;margin-left: 0px;">
				         <li>{{vo.author}}</li>
				         <li>{{vo.publisher}}</li>
				         <li>{{vo.dbday}}</li>
				         <li>대출횟수: ...</li>
				        </ul>
				      </td>
				    </tr>
	    		</table>
				   
			      <div style="height: 20px"></div>
			        <div class="text-center">
			          <button class="btn btn-sm btn-info" v-on:click="prev()">이전</button>
			            {{curpage}} page / {{totalpage}} pages
			          <button class="btn btn-sm btn-info" v-on:click="next()">다음</button>
			        </div>
			   </div>
			   <div class="col-sm-4" v-show="isShow" v-if="isShow===true">
		        <table class="table">
		          <tr>
		            <td class="text-center"  v-for="img in book_detail>
		              <img :src="img" style="width: 100%">
		            </td>
		          </tr>
		        </table>
		          <div style="height: 10px"></div>
		          <table class="table">
		            <tr>
		              <td colspan="2">
		                <h3>{{}}&nbsp;&nbsp;<span style="color: orange;">{{}}</span></h3>
		              </td>
		            </tr>
		            <tr>
		              <td style="width: 20%">0000</td>
		              <td style="width: 80%">{{}}</td>
		            </tr>
		            <tr >
		              <td style="width: 20%">00000</td>
		              <td style="width: 80%">{{}}</td>
		            </tr>
		            <tr>
		              <td style="width: 20%">책소개</td>
		              <td style="width: 80%">{{}}</td>
		            </tr>
		            <tr >
		              <td style="width: 20%">메뉴</td>
		              <td style="width: 80%">
		                <a href="#" class="btn btn-sm btn-info"style="float: right">도서 예약</a>
		              </td>
		            </tr>
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
    		book_data:[]
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
    		
    	}
    })
  </script>
</body>
</html>