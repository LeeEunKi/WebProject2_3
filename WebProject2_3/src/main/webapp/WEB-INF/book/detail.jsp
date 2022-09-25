<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


/* ********************************************** */

*{
	font-family: arial;
}

p {
/* 	padding: 10px; */
	margin: 0;
	font-size: 17px;
	line-height: 16px;
	color: #484747;

}

.boxarea {
	background-color: #EFEFEF;
	padding: 10px;
	margin: 10px auto;
	width: 100%;
	
	
}

.content-area {
	overflow: hidden;
  position: relative;
  width:100%;
}

.content {
	position: relative;
  background-color:F7FFF7;
	height: 100%;
/* 	border-top: 1px solid silver; */
	display: inline-block;
	white-space: normal;
}


detail-nav {
	box-sizing: border-box;
	width: 100%;
}

nav ul.nav-tabs {
	margin: 0px auto;
	padding: 0px;
	display: table;
	width: 100%;
}	
.nav-tabs li {
	text-transform: uppercase;
	font-size: 17px;
  font-weight: 500;
	list-style: none;
	display: table-cell;
	padding-right: 2px;
}

.nav-tabs li:last-child {
  padding-right: 0px;
}

.nav-tabs li a {
	display: block;
	color: white;
	text-align: center;
	background-color: #6D93DF;
	padding: 10px 10px;
	text-decoration: none;
 
}

.nav-tabs li a:hover {
	background-color: #FF6B6B;
}


.nav-tabs li a.active {
	background-color: #2964D9;
}

.nav-tabs li a:visited {
	color: white;
}

.section-detail {
	margin: 0px 0px;
	padding: 0px;
	height:800px;
/*     width:530px; */
    float:left;
}

.container-detail {
	height: 600px;
	width: 7000px;
	margin: 0px;
	padding: 0;
	padding-top: 0px;
	position: block;
	white-space: nowrap;
	overflow: hidden;
	transition: all 0.3s ease-in;
}

/* https://coolors.co/1a535c-4ecdc4-f7fff7-ff6b6b-ffe66d */
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
         			   <a href="../book/totalsearch.do"><h3 class="subject">자료검색</h3></a>
         			   <ul>
         			     <a href="../book/totalsearch.do"><li>도서명 검색</li></a>
         			     <a href="../book/authorsearch.do"><li>저자명 검색</li></a>
         			   </ul>
            			
          			</div>
          			<div class="ui vertical text menu sidemenu" style="margin-bottom: 15px">
         			   <a href="../book/search.do"><h3 class="subject">인기도서</h3></a>
            			
          			</div>
          			<div class="ui vertical text menu sidemenu" style="margin-bottom: 15px">
         			   <h3 class="subject">주제별검색</h3>
            			
          			</div>
			    </div>
			    

	<div class="col-lg-9">
				<h3 style="margin-bottom: 0px">상세 보기</h3>
				<hr style="margin-bottom: 0px">
				
				<table class="table">
					<tr>
					  <td rowspan="6">
					  <img :src="vo.img">
					  </td>
					</tr>
		            <tr>
		              <td colspan="2">
		                <h3>{{vo.title}}&nbsp;&nbsp;<span style="color: orange;font-size: 16px;font-weight: 600;padding-left: 15px">{{vo.type}}</span></h3>
		              </td>
		            </tr>
		            <tr>
		              <td style="width: 20%">저자명</td>
		              <td style="width: 80%">{{vo.author}}</td>
		            </tr>
		            <tr>
		              <td style="width: 20%">출판사</td>
		              <td style="width: 80%">{{vo.publisher}}</td>
		            </tr>
		            <tr>
		              <td style="width: 20%">출판일자</td>
		              <td style="width: 80%">{{vo.dbday}}</td>
		            </tr>
		            <tr>
		              <td style="width: 20%"></td>
		              <td style="width: 80%">
		              <c:if test="${sessionScope.id==null }">
		                <span class="btn btn-lg btn-warning"style="float: left;margin-right: 10px">도서 예약</span>
		              </c:if>
		              <c:if test="${sessionScope.id!=null }">
		                <a :href="'../book/loan.do?no='+vo.no" class="btn btn-lg btn-warning"style="float: left;margin-right: 10px">도서 예약</a>
		              </c:if>
		              <c:if test="${sessionScope.id==null }">
		                <span class="btn btn-lg btn-warning"style="float: left;margin-right: 10px">관심도서 추가</span>
		              </c:if>
		              <c:if test="${sessionScope.id!=null }">
		                 
		                <a :href="'../book/booklike.do?no='+vo.no" class="btn btn-lg btn-warning"style="float: left">관심도서 추가</a>
		              </c:if>
		                
		              </td>
		            </tr>
		            <!-- no,title,author,type,publisher,img,TO_CHAR(pub_date,'YYYY-MM-DD') AS dbday, description -->
		          </table>
			
		<main class="boxarea">
				<div class="content-area">
					<nav class="detail-nav">
						<ul class="nav-tabs">
							<li><a href="#" class="n-tab active">책소개</a></li>
							<li><a href="#" class="n-tab">이용안내</a></li>
							<li><a href="#" class="n-tab">별점</a></li>  
						</ul>
					</nav>
			
					<div class="container-detail">
						<section class="section-detail content active">
						    <br>
							<h2>책소개</h2>
							<p>{{vo.description}}</p>
					    </section>
						
						<section class="content">
						    <br>
							<h2>이용안내</h2>
							<pre>
※관외대출
    관외대출은 책이음회원증 소지자에 한해 가능함
※대출안내
    대출권수 : 1인 5책
    대출기간 : 2주간 대출
    가입 대상 : 주민등록상 부산 거주자(타지역 거주자 중 부산 소재 학교 및 직장에 재학(재직)자는 재학(재직)증명서 지참)
    대출은 본인에 한하여 책이음 회원증 소지자만 가능
    대출 연장제도는 없으며, 당일 반납도서는 3일 후 재대출 가능
    반납 연체 시 연체일 수만큼 자료 대출 정지(5권 중 1권이 연체되어도 연체일수만큼 대출 정지)
    대출도서의 분실 또는 훼손 시 동일 도서 또는 해당 도서의 현시가로 변상
    휴관일에는 1층 자동반납함에서 반납 가능
※대출 제외 자료
    참고도서
    연속간행물
							</pre>
					    </section>
						<section class="content reply" style="position: relative;top: -200px">
						    <br>
							<h2>별점 주기</h2>
								 <div class="input-group mb-3" style="position: relative;left: -5px;">
<!-- 								  <div class="input-group-prepend">
								    <label class="input-group-text" for="inputGroupSelect01">별점</label>
								  </div>
								  <select class="custom-select" id="inputGroupSelect01">
								    <option selected>별점을 선택하세요</option>
								    <option value="1">★</option>
								    <option value="2">★★</option>
								    <option value="3">★★★</option>
								    <option value="4">★★★★</option>
								    <option value="5">★★★★★</option>
								  </select> -->
								
								<div class="input-group">
								  <textarea class="form-control" aria-label="With textarea"  ref="msg"  v-model="msg"></textarea>
								
								 <div class="input-group-append">
								    <input class="btn btn-outline-secondary" type="button" value="댓글 쓰기" @click="replyWrite()">
								  </div>
								  </div>
								</div>
							※ 부적절한 댓글은 관리자에 의해 삭제될 수 있습니다
							<hr>
							<div>
							<!-- 댓글 출력 리스트  -->
							 <table class="table" v-for="re in reply_list">
					               <tr>
					                 <td class="text-left">{{re.member_id}}&nbsp;&nbsp;({{re.dbday}})</td>
					                 <td class="text-right">
					                   <%--
					                         <c:if test="${sessionScope.id==re.id}">
					                    --%>
					                   <input type="button" class="btn btn-xs btn-info" value="수정" >
					                   <input type="button" class="btn btn-xs btn-warning" value="삭제" >
					               </tr>
					               <tr>
					                 <td colspan="2" valign="top" class="text-left"><pre style="white-space: pre-wrap;border: none;background-color: white">{{re.msg}}</pre></td>
					               </tr>
					               
					             </table>
							</div>
					    </section>
						
					</div>
				</div>
			</main>
		</div>
			    
                
		 </div>
	</div>
		 
</div>
<script type="text/javascript">
		var slideWidth = $(".boxarea").width();
		var contentW = $(".content-area").width();
		
		$(document).ready(function() {
		  $('.content').css({width:contentW});
		  $('nav ul li').click(function() {
		    var tabindex = $(this).index();
		    var jump = (slideWidth * tabindex);
		    console.log(tabindex);
		    console.log(jump)
		    $(".container-detail").css({
		      transform: "translate3d(-" + jump + "px, 0, 0)"
		    });
		  });
		  $("a.n-tab").click(function() {
		    var $active = $('.active');
		    $active.removeClass("active");
		    $(this).addClass("active");
		  })
		});
		
			$(window).on('resize', function(evt) {
		  $('.content').css({width:contentW});
			});
</script>
<script type="text/javascript">
	 new Vue({
		 el:'.section',
		 data:{
			 no:${no},
			 vo:{}
		 },
		 mounted:function(){
			 axios.get("http://localhost:8080/web/book/detail_info.do",{
				 params:{
					 no:this.no
				 }
			 }).then(result=>{
				 console.log(result);
				 this.vo=result.data;
			 })
		 }
	
	 })
	 
	 new Vue({
		 el:'.reply',
		 data:{
			 book_no:${no},
			 reply_list:[],
			 msg:'',
			 sessionId:''
			 
		 },
		 mounted:function(){
			let _this=this;
    		axios.get("http://localhost:8080/web/book/reply_list.do",{
    			params:{
    				book_no:_this.book_no
    			}
    		}).then(function(result){
    			console.log(result.data)
    			_this.reply_list=result.data;
    			_this.sessionId=result.data[0].sessionId
    		})
		 },
		 methods:{
			 replyWrite:function(){
				 if(this.msg==="")
	    			{
	    				this.$refs.msg.focus();
	    				return;
	    			}
	    			let _this=this;
	    			axios.get("http://localhost:8080/web/book/reply_insert.do",{
	        			params:{
	        				book_no:_this.book_no,
	        				msg:_this.msg
	        			}
	        		}).then(function(result){
	        			_this.msg="";
	        			console.log(result.data)
	        			_this.reply_list=result.data;
	        			_this.sessionId=result.data[0].sessionId
	        		})
			 }
		 }
		 
	 })
</script>
</body>
</html>