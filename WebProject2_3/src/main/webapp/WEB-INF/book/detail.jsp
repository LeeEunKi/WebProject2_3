<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	width: 50%
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
	border-bottom: 5px solid #2964D9;
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
	height:350px;
/*     width:530px; */
    float:left;
}

.container-detail {
	height: 350px;
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
         			   <a href="../book/totalsearch.do"><h3 class="subject">통합자료검색</h3></a>
            			
          			</div>
          			<div class="ui vertical text menu sidemenu" style="margin-bottom: 15px">
         			   <a href="../book/search.do"><h3 class="subject">인기도서</h3></a>
            			
          			</div>
          			<div class="ui vertical text menu sidemenu" style="margin-bottom: 15px">
         			   <h3 class="subject">주제별검색</h3>
            			
          			</div>
			    </div>
			    

	<div class="col-lg-9">
				<h3 style="margin-bottom: 0px">검색 결과</h3>
				<h5 style="margin-top: 5px">Horizontal card11s</h5>
				<hr style="margin-bottom: 0px">
				
				<table class="table">
					<tr>
					  <td rowspan="6">
					  <img src="../1.jpg">
					  </td>
					</tr>
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
		              <td style="width: 20%"></td>
		              <td style="width: 80%">
		                <a :href="'../book/detail.do?no='+book_detail.no" class="btn btn-sm btn-info"style="float: left">도서 예약</a>
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
							<li><a href="#" class="n-tab">리뷰</a></li>
							<li><a href="#" class="n-tab">문의</a></li>    
						</ul>
					</nav>
			
					<div class="container-detail">
						<section class="section-detail content active">
							<h2>책소개</h2>
							<p>ㅖ{{패.채ㅜㅅ둣}}</p>
					    </section>
						
						<section class="content">
							<h2>이용안내</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque autem itaque, nesciunt dolore non maxime praesentium! Nobis impedit aliquid eveniet blanditiis, aspernatur unde corporis, dolorem, voluptates harum, beatae cumque dolore?</p><br/>
		
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime quod velit illo dicta quibusdam esse expedita doloremque provident, qui possimus deserunt omnis fuga labore necessitatibus nesciunt eius. Est, officiis aliquam.</p>
					    </section>
						
						<section class="content">
							<h2>리뷰</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque autem itaque, nesciunt dolore non maxime praesentium!</p><br/>
		
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime quod velit illo dicta quibusdam esse expedita doloremque provident, qui possimus deserunt omnis fuga labore necessitatibus nesciunt eius. Est, officiis aliquam.</p>
					    </section>
						
						<section class="content">
							<h2>Contact</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque autem itaque, nesciunt dolore non maxime praesentium! Nobis impedit aliquid eveniet blanditiis, aspernatur unde corporis, dolorem, voluptates harum, beatae cumque dolore?</p><br/>
		
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime quod velit illo dicta quibusdam esse expedita doloremque provident, qui possimus deserunt omnis fuga labore necessitatibus nesciunt eius. Est, officiis aliquam.</p>
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
</body>
</html>