<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
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
		
		$('#rvBtn').click(function () {
			alert("로그인 후 작성 가능합니다");
		})
	})
</script>
<script type="text/javascript">
function submit() {
	let form=document.likedata;
	form.sumbit();
}
</script>
<style type="text/css">
*{
	font-family: 'Noto Sans KR', sans-serif;

}
.subject{
	position: relative;
    color: rgb(103, 114, 148);
    font-size: 25px;
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
}


/*
 CSS for the main interaction
*/
.tabset > input[type="radio"] {
  position: absolute;
  left: -200vw;
}

.tabset .tab-panel {
  display: none;
}

.tabset > input:first-child:checked ~ .tab-panels > .tab-panel:first-child,
.tabset > input:nth-child(3):checked ~ .tab-panels > .tab-panel:nth-child(2),
.tabset > input:nth-child(5):checked ~ .tab-panels > .tab-panel:nth-child(3),
.tabset > input:nth-child(7):checked ~ .tab-panels > .tab-panel:nth-child(4),
.tabset > input:nth-child(9):checked ~ .tab-panels > .tab-panel:nth-child(5),
.tabset > input:nth-child(11):checked ~ .tab-panels > .tab-panel:nth-child(6) {
  display: block;
}

/*
 Styling
*/
body {
  font: 16px/1.5em "Overpass", "Open Sans", Helvetica, sans-serif;
  color: #333;
  font-weight: 300;
}

.tabset > label {
  position: relative;
  display: inline-block;
  padding: 15px 15px 25px;
  border-bottom: 0;
  cursor: pointer;
  font-weight: 600;
}

.tabset > label::after {
  content: "";
  position: absolute;
  display: none;
}

.tabset > label:hover,
.tabset > input:focus + label {
  color: #207856;
}

.tabset > label:hover::after,
.tabset > input:focus + label::after,
.tabset > input:checked + label::after {
  background: #207856;
}

.tabset > input:checked + label {
  border-color: #ccc;
  border-bottom: none;
  margin-bottom: -1px;
}

.tab-panel {
  padding: 30px 8px;
  border-top: 1px solid #ccc;
}

/*
 Demo purposes only
*/
*,
*:before,
*:after {
  box-sizing: border-box;
}

.tabset {
  max-width: 65em;
}
a{
	text-decoration: none !important;
}
a:hover{
	text-decoration: none; !important;
}
.li{
	padding-bottom: 7px;
}



.sidebar {
  margin: 0;
  padding: 0;
  width: 200px;
  font-weight: 600;
  font-size: 20px;
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
  background-color: #3b5d50;
  color: white;
}
.sidebar a:hover:not(.active) {
  background-color: #777;
  color: white;
}

.sidebar span {
  display: block;
  color: black;
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

            <!— Start Column 1 —>
        <div class="col-lg-2 col-md-2 col-sm-12" style="border-right-style: solid; border-right-color: rgb(231, 234, 238);display: inline-block;float: right;">
				<div class="sidebar">
				  <a class="active" href="../book/totalsearch.do">도서검색</a>
				  <a href="../book/search.do">인기도서</a>
				  <a href="../book/categorysearch.do">주제별 도서</a>
				  <span class="loan" id="loan" style="padding: 16px !important;">예약 내역</span>
				  <span class="loan" id="like" style="padding: 16px !important;">관심도서 내역</span>
             </div>
        </div>
        
        

      <div class="col-lg-10 col-md-10 col-sm-12 content">
        <h3 style="margin-bottom: 0px;padding-left: 10px;">상세보기</h3>
        <hr style="margin-bottom: 0px">
        

            <div style="height: 20px"></div>
          
				
				<table class="table">
					<tr>
					  <td rowspan="6"  style="padding-top: 0px;border-bottom: none">
					  <img :src="vo.img">
					  </td>
					</tr>
		            <tr>
		              <td style="width: 15%;font-size: 18px;font-weight: 400;color: #F9F9F9;background-color: #3b5d50;border-bottom:1px solid #eff2f1;vertical-align: middle;" class="text-center">
		             	도서명
		              </td>
		              <td style="width: 85%;background-color: #fff;border-bottom:1px solid #eff2f1">
		                <h3>{{vo.title}}&nbsp;&nbsp; 
		                <c:if test="${sessionScope.id==null }">
		                	<img src="../img/lineheart.png" style="float: right;width: 30px;height: 30px" class="like unlogin">
		                 </c:if>
		                 <c:if test="${sessionScope.id!=null && lcheck==0 }">
		                 <form method="post" action="../book/insertLike.do" style="display: inline-block; float: right;" name="likedata">
				              	<input type="hidden" :value="vo.no" name="book_no">
				              	<input type="hidden" :value="vo.title" name="title">
				              	<input type="hidden" :value="vo.img" name="img">
				              	<input type="hidden" :value="vo.author" name="author">
				              	<input type="hidden" :value="vo.type" name="type">
			                <img src="../img/lineheart.png" style="float: right;width: 30px;height: 30px" class="like" onClick="submit()">
			             </form>
			             </c:if>
			             <c:if test="${sessionScope.id!=null && lcheck!=0 }">
			                <a :href="'../book/bookDisLikeInsert.do?no='+vo.no"><img src="../img/heart.png" style="float: right;width: 30px;height: 30px" class="like"></a>
		                 </c:if>
		                <span style="color: orange;font-size: 16px;font-weight: 600;padding-left: 15px">{{vo.type}}</span></h3>
		                
		              </td>
		            </tr>
		            <tr>
		              <td style="width: 15%;font-size: 18px;font-weight: 400;color: #F9F9F9;background-color: #3b5d50;border-bottom:1px solid #eff2f1;vertical-align: middle;" class="text-center">저자명</td>
		              <td style="width: 85%;background-color: #f9f9f9;border-bottom:1px solid #eff2f1">{{vo.author}}</td>
		            </tr>
		            <tr>
		              <td style="width: 15%;font-size: 18px;font-weight: 400;color: #F9F9F9;background-color: #3b5d50;border-bottom:1px solid #eff2f1;vertical-align: middle;" class="text-center">출판사</td>
		              <td style="width: 85%;background-color: #fff;border-bottom:1px solid #eff2f1">{{vo.publisher}}</td>
		            </tr>
		            <tr>
		              <td style="width: 15%;font-size: 18px;font-weight: 400;color: #F9F9F9;background-color: #3b5d50;border-bottom:1px solid #eff2f1;vertical-align: middle;" class="text-center">출판일자</td>
		              <td style="width: 85%;background-color: #f9f9f9;border-bottom:1px solid #eff2f1">{{vo.dbday}}</td>
		            </tr>
		            <tr> 
		            <td style="border-bottom: none"></td>
		              <td style="float: right;border-bottom: none">
			              <c:if test="${loancnt ==0 }">
			                <span class="btn btn-sm btn-danger"style="margin-right: 10px;margin-bottom: 7px;padding: 10px 20px;" >예약 불가</span>
			              </c:if>
			              <c:if test="${sessionScope.id==null && loancnt !=0 }">
			                <span class="btn btn-sm btn-primary unlogin"style="margin-right: 10px;margin-bottom: 7px;padding: 10px 20px;" >도서 예약</span>
			              </c:if>
			              <c:if test="${sessionScope.id!=null && loancnt !=0 }">
				              <form method="post" action="../book/insertLoan.do" style="display: inline-block;">
				              	<input type="hidden" :value="vo.no" name="book_no">
				              	<input type="hidden" :value="vo.title" name="title">
				              	<input type="hidden" :value="vo.img" name="img">
				              	<input type="hidden" :value="vo.author" name="author">
				                <input type="submit" class="btn btn-sm btn-primary"style="margin-right: 10px;margin-bottom: 7px;padding: 10px 20px;display: inline-block;" value="도서예약"/>
				              </form>
			              </c:if>
			              <c:if test="${sessionScope.id==null }">
			                <span class="btn btn-sm btn-primary unlogin"style="margin-right: 10px;margin-bottom: 7px;padding: 10px 20px;">관심도서 추가</span>
			              </c:if>
	
			              <c:if test="${sessionScope.id!=null && lcheck==0 }">
			                <form method="post" action="../book/insertLike.do" style="display: inline-block;">
				              	<input type="hidden" :value="vo.no" name="book_no">
				              	<input type="hidden" :value="vo.title" name="title">
				              	<input type="hidden" :value="vo.img" name="img">
				              	<input type="hidden" :value="vo.author" name="author">
				              	<input type="hidden" :value="vo.type" name="type">
			                    <input type="submit" class="btn btn-sm btn-primary"style="margin-right: 10px;margin-bottom: 7px;padding: 10px 20px;display: inline-block;" value="관심도서추가"/>
			               </form>
			              </c:if>
			              <c:if test="${sessionScope.id!=null && lcheck!=0 }">
			              
			                <a :href="'../book/bookDisLikeInsert.do?no='+vo.no" class="btn btn-sm btn-primary"style="margin-right: 10px;margin-bottom: 7px;padding: 10px 20px;display: inline-block;">관심도서 제거</a>
			              </c:if>
			                <a href="../book/search.do" class="btn btn-sm btn-primary"style="margin-right: 10px;margin-bottom: 7px;padding: 10px 20px;display: inline-block;" >목록으로</a>
		              </td>
		            </tr>
		            <!-- no,title,author,type,publisher,img,TO_CHAR(pub_date,'YYYY-MM-DD') AS dbday, description -->
		          </table>
			
					<div class="tabset">
					  <!-- Tab 1 -->
					  <input type="radio" name="tabset" id="tab1" aria-controls="marzen" checked>
					  <label for="tab1">책 소개</label>
					  <!-- Tab 2 -->
					  <input type="radio" name="tabset" id="tab2" aria-controls="rauchbier">
					  <label for="tab2">이용안내</label>
					  <!-- Tab 3 -->
					  <input type="radio" name="tabset" id="tab3" aria-controls="dunkles">
					  <label for="tab3">반납 방법</label>
					  
					  <input type="radio" name="tabset" id="tab4" aria-controls=qna">
					  <label for="tab4">문의</label>
					  
					  <div class="tab-panels" style="background-color: #f9f9f9">
					    <section id="marzen" class="tab-panel">
					      <h2>책소개</h2>
					      <p><strong>줄거리:&nbsp;&nbsp;</strong>{{vo.description}}</p>
					  </section>
					    <section id="rauchbier" class="tab-panel">
					      <h2>이용안내</h2><br>
					      	
						 <p><strong>※관외대출</strong></p>
						 
						    <p>관외대출은 책이음회원증 소지자에 한해 가능함</p><br>
						    
						 <p><strong>※대출안내</strong></p>
						 
						    <p>대출권수 : 1인 5책</p>
						    <p>대출기간 : 2주간 대출</p>
						    <p>가입 대상 : 주민등록상 부산 거주자(타지역 거주자 중 부산 소재 학교 및 직장에 재학(재직)자는 재학(재직)증명서 지참)</p>
						    <p>대출은 본인에 한하여 책이음 회원증 소지자만 가능</p>
						    <p>대출 연장제도는 없으며, 당일 반납도서는 3일 후 재대출 가능</p>
						    <p>반납 연체 시 연체일 수만큼 자료 대출 정지(5권 중 1권이 연체되어도 연체일수만큼 대출 정지)</p>
						    <p>대출도서의 분실 또는 훼손 시 동일 도서 또는 해당 도서의 현시가로 변상</p>
						    <p>휴관일에는 1층 자동 반납함에서 반납 가능</p><br>
						 	<p><strong>※대출 제외 자료</strong></p>
						 	<p>참고도서</p>
						    <p>연속간행물</p>
							
					    </section>
					    <section id="dunkles" class="tab-panel">
					      <h2>반납 방법</h2>
					      <p>대출한 자료실 데스크 및 도서 무인 반납함</p>
						  <p>도서관에서 발급한 회원카드로 관내 도서관에서 대출/반납 가능</p><br>
					      <p><strong>반납 기한</strong>
					      <p>대출한 시점으로부터 일주일 뒤</p>
					    </section>
					    <section id="qna" class="tab-panel">
					      <h2>문의사항</h2>
					      <p><strong>※기타문의 사항</strong>
					      <p>단체 대출이나 기타 문의 사항은 유선으로 연락바랍니다</p>
					    </section>
				     </div>
				   </div>
					</div>
				</div>
		<div class="row row1">
		<div class="col-lg-2 side"></div>
		  <div class="col-lg-10">
		    <section class="content" id="reply">
						    <br>
							<h2>한줄평 쓰기</h2>
								 <div class="input-group mb-3" style="position: relative;left: -5px;">
								
								 <div class="input-group">
								   <textarea class="form-control" aria-label="With textarea"  ref="msg"  v-model="msg"></textarea>
								
									 
									  <c:if test="${sessionScope.id!=null }">
									    <input class="btn btn-primary" type="button" value="리뷰 작성" @click="replyWrite()">
									  </c:if>
									  <c:if test="${sessionScope.id==null }">
									    <button class="btn btn-primary" type="button" id="rvBtn">리뷰 작성</button>
									  </c:if>
								 	  
								 </div>
							    </div>
							※ 부적절한 댓글은 관리자에 의해 삭제될 수 있습니다 
							<hr>
							<!-- 댓글 출력 리스트  -->
					          <div class="row" style="border-bottom: 1px solid #ddd;" v-for="re in reply_list">
					             <ul style="list-style: none;">
										<li>
											<div>
												<!-- <span class="ratingStar"><span style="width:80%;"></span></span> -->
												<strong>{{re.member_id}}</strong>
												<span>({{re.dbday}})</span>
												<span style="float: right; padding: 30px">
													<input type="button" v-if="re.member_id===sessionId" value="수정" @click="replyUpdate(re.no)" :id="'up'+re.no">
	                   								<input type="button" v-if="re.member_id===sessionId" value="삭제" v-on:click="replyDelete(re.no)">
												</span>
												
											</div>
											<p>{{re.msg}}</p>
												<form method="post" action="../book/reply_update.do">
													<div class="input-group" v-show="isShow" style="display: none;" class="updates" :id="'u'+re.no">
													   
														
														<textarea class="form-control" aria-label="With textarea" name="msg" ref="msg"  id="msg">{{re.msg}}</textarea>
														 
														    <input class="btn btn-outline-secondary" type="submit" value="리뷰 수정" >
													 	 
													 	  
													 </div>
													 <input type="hidden" name="book_no" :value="book_no">
											         <input type="hidden" name="no" :value="re.no">
												</form>
										</li>
								  </ul>
					          </div>
							
					    </section>
		  </div>
		</div>
		<!--리뷰란 테스  -->
			    
                
                
		 
	</div>
<script type="text/javascript">
	 new Vue({
		 el:'#reply',
		 data:{
			 book_no:${no},
			 reply_list:[],
			 msg:'',
			 sessionId:'',
			 isShow:false,
			 no:0
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
	    				_this.$refs.msg.focus();
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
	        			console.log(result.data);
	        			_this.reply_list=result.data;
	        			_this.sessionId=result.data[0].sessionId
	        		})
			 },
			 replyDelete:function(no){
	    			let _this=this;
	    			axios.get("http://localhost:8080/web/book/reply_delete.do",{
	    				params:{
	    					no:no,
	    					book_no:_this.book_no
	    				}
		    		}).then(function(result){
		    			console.log(result.data)
		    			_this.reply_list=result.data;
		    			_this.sessionId=result.data[0].sessionId
		    		})
		   	 },
    		 replyUpdate:function(no){
    			 $('.updates').hide();
     			if(this.no==0)
     			{
     				$('#u'+no).show();
     				$('#up'+no).val("취소");
     				this.no=1;
     			}
     			else
     			{
     				$('#u'+no).hide();
     				$('#up'+no).val("수정");
     				this.no=0;
     			}
    		} 
		 }
		 
	 })
	 
	 new Vue({
		 el:'.col-lg-10',
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
</script>
<script type="text/javascript">
 $(function () {
	$('.unlogin').click(function() {
		alert("로그인 후에 이용 가능합니다");
	})
})
</script>
</body>
</html>