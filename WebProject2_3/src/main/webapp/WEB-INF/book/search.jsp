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
.container-fluid{
	margin-top: 50px;
}
.row1{
	margin: 0px auth;
	width: 100%;
}
.images:hover{
	cursor: pointer;
	
}
</style>
</head>
<body>
  <div class="container-fluid">
    <div class="row row1">
      <div class="col-sm-8">
       
         <div class="col-md-4" v-for="vo in book_data">
		    <div class="thumbnail">
		        <img :src="vo.img" alt="Lights" style="width:100%" class="images" v-on:click="detailData(vo.no)">
     									<!-- 
     										 v-on:click = @click
     										 v-bind:src = :src :Vue의 변수(data)와 매칭을 시켜주는 것이 bind 
     										 v-model : 양방향 통신을 할 수있게 한다
     										 
     										 Vue / React  :react는 단방향은 지원 x
     										 --- 양뱡향,단반향 둘 다 가능하지만
     									-->
		        <div class="caption">
		          <p>{{vo.title }}</p>
		        </div>
		    </div>
		  </div>
	   
      <div style="height: 20px"></div>
        <div class="text-center">
          <button class="btn btn-sm btn-info" v-on:click="prev()">이전</button>
            {{curpage}} page / {{totalpage}} pages
          <button class="btn btn-sm btn-info" v-on:click="next()">다음</button>
        </div>
      </div>
    
      <!-- 
      <div class="col-sm-4" v-show="isShow" v-if="isShow===true">
      
      </div>
       -->
       
     
    </div>
  </div>
  <script type="text/javascript">
    new Vue({
    	el:'.row',
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
    		}
    	}
    })
  </script>
</body>
</html>