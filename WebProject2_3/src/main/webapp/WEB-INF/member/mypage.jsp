<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(document)
.ready(function() {
  // fix menu when passed
  $('.masthead')
    .visibility({
      once: false,
      onBottomPassed: function() {
        $('.fixed.menu').transition('fade in');
      },
      onBottomPassedReverse: function() {
        $('.fixed.menu').transition('fade out');
      }
    });

  // create sidebar and attach to menu open
  $('.ui.sidebar')
    .sidebar('attach events', '.toc.item');

});
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
/* common */

.row1{
   margin: 0px auto;
   width: auto;
   height: auto;
}
html, body {
  height: 100%;
  margin: 0;
  padding: 0;
}
body { 
  overflow-y: scroll;
}
.footercustom {
  width: auto;
  margin: 50px 0 0 0;
}

.smallfont {
  font-size: 12px;
}

hr {
  border: 1px solid #f84646;
  margin: 0 auto;
}

.pointcolor {
  color: #f84646 !important;
}
.pointbutton {
  color: #fff !important;
  background: #f84646 !important;
  border: 1px solid #f84646;
}
.pointbutton:hover {
  background: #db3a29 !important;
}


/* Menu */
.ui.secondary.pointing.menu {
  margin-left: 5%;
  margin-right: 5%;
}
.pointing.menu, .pointing.menu a {
  border: none !important;
}
.centermenu {
  margin: 0 auto !important;
}

.activecustom {
  color: #f84646 !important;
  font-weight: bold !important;
}
.item:hover{
  color: #f84646 !important;
  background: none !important;
}


/* Responsive Menu */
.hidden.menu {
   display: none;
}

.masthead.segment {
   min-height: 100px;
   padding: .25em 0em;
}

.secondary.pointing.menu .toc.item {
   display: none;
}

@media only screen and (max-width: 700px) {
  .ui.fixed.menu {
    display: none !important;
  }
  .secondary.pointing.menu .item {
    display: none;
  }
  .secondary.pointing.menu .toc.item {
    display: block;
  }
  .masthead.segment {
    min-height: 70px;
  }
}

.item--white {
  color: white !important;
}


/* header */
.logoimg {
  /*border: 1px solid #eee;*/
  margin-bottom: 20px;
  margin-top: -25px;
}


/* Contents */
.ui.sub-container {
  /*border: 1px solid #eee;*/
  margin: 0 4% 0 4%;
}
.ui.vertical.text.menu.sidemenu .item{
  /*border: 1px solid #eee;*/
  margin-bottom: 10%;

}
.ui.items p {
  margin-top: -10px;
}
.ui.items .item.pointcolor {
  text-decoration: underline;
  font-size: 16px;  
}


/* Table */
table td, th {
  padding: 10px 0 !important;
  text-align: center !important;
  font-size: 13px;
}
@media (min-width: 768px) {
  .sidebar-nav .navbar .navbar-collapse {
    padding: 0;
    max-height: none;
  }
  .sidebar-nav .navbar ul {
    float: none;
    display: block;
  }
  .sidebar-nav .navbar li {
    float: none;
    display: block;
  }
  .sidebar-nav .navbar li a {
    padding-top: 12px;
    padding-bottom: 12px;
  }
}
</style>
</head>
<body>

&nbsp;&nbsp;<h2><b>마이페이지</b></h2>
<hr>
<div class="container-fluid">
	<div class="row">
	<div class="col-lg-2"></div>
	   <div class="col-lg-8" style="margin-top: 20px">
	<div class="pusher">
	  <div class="ui vertical masthead segment" style="border: none;">
	   <div class="col-sm-3">
    <div class="sidebar-nav">
      <div class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <span class="visible-xs navbar-brand">Sidebar menu</span>
        </div>
        <div class="navbar-collapse collapse sidebar-navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Menu Item 1</a></li>
            <li><a href="#">Menu Item 2</a></li>
            <li><a href="#">Menu Item 3</a></li>
            <li><a href="#">Menu Item 4</a></li>
            <li><a href="#">Reviews <span class="badge">1,118</span></a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
  </div>
  <div class="col-sm-9">
     <!-- Start Contents -->
	  <div class="ui container">
	    <div class="ui sub-container">
	      <!-- Top Message -->
	      <div class="ui stackable grid"><!-- stackable here-->
	        <div class="two wide column" style="padding-top: 0 !important;">
	          <h3 class="ui header pointcolor">ORDERS</h3>
	        </div>
	        <div class="fourteen wide column" style="padding-top: 0 !important;">
	          <div class="smallfont">다양한 주문 관련 서비스를 이용하실 수 있습니다.</div>
	        </div>
	      </div>
	      <div class="ui fitted divider"></div>
	      <div class="ui hidden divider"></div>
	      <div class="ui hidden divider"></div>
	
	     
	
	        <!-- Main Contents-->
	        <div class="thirteen wide column">
	         <!--  <button class="ui small compact pointbutton button">주문 등록</button> --!>
	        
	          <!-- Table -->
	          <table class="ui very basic table">
	            <thead>
	             <tr>
	              		<th width=10% class="text-center">번호</th>
						<th width=45% class="text-center">제목</th>
						<th width=15% class="text-center">아이디</th>
						<th width=20% class="text-center">작성일</th>
						<th width=10% class="text-center">조회수</th>
         		 </tr>
	            </thead>
	            <tbody>
	         	  <c:if test="${sessionScope.id==vo.id}"><%-- 본인이면 --%>
	         	  <c:forEach var="vo" items="${list }">
	         	  <tr>
						<th width=10% class="text-center">${vo.no}</th>
						<th width=45%><a :href="'../board/detail.do?no='+vo.no">${vo.subject}</a></th>
						<th width=15% class="text-center">${vo.name}</th>
						<th width=20% class="text-center">${vo.dbday}</th>
						<th width=10% class="txt_org text-center">${vo.hit}</th>
				</tr>
				</c:forEach>
				</c:if>
	            </tbody>
	            <tfoot>
	              <tr>
	                <th colspan="10">
	                  <div class="ui pagination menu">
	                    <a class="icon item">
	                      <i aria-hidden="true" class="left chevron icon"></i>
	                    </a>
	                    <a class="item">1</a>
	                    <a class="item">2</a>
	                    <a class="item">3</a>
	                    <a class="item">4</a>
	                    <a class="icon item">
	                      <i aria-hidden="true" class="right chevron icon"></i>
	                    </a>
	                  </div>
	                </th>
	              </tr>
	            </tfoot>
	          </table>
	        </div>
	 
	      </div>
	      <!-- End UI grid-->
	      
	    </div>
  </div>
	
	  <div class="ui hidden divider"></div>
	  <div class="ui hidden divider"></div>
	
	 
	  </div>
	  </div>
	  <div class="col-lg-2"></div>


  

</div>
</div>
</div>
<script>
		new Vue({
			//el : 관리 영역 지정 => container
			el:'.container',
			data:{
				member_mypage:[]
			},
			mounted:function(){
				let _this=this;
				axios.get("http://localhost:8080/web/member/mypage_vue.do",{
					params:{
						page:_this.curpage
					}
				}).then(function(result){
					//개발자도구창에서 넘어온값 확인가능
					console.log(result.data);
					_this.member_mypage=result.data;
				})
			}
		})
	</script>
</body>
</html>