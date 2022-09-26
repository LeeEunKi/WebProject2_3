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
$(function(){
	$('#logBtn').click(function(){
		let id=$('#id').val();
		if(id.trim()==="")
		{
			$('#id').focus();
			return;
		}
		let pwd=$('#pwd').val();
		if(pwd.trim()==="")
		{
			$('#pwd').focus();
			return;
		}
		//let ck=$("#ck").is(":checked");
		$.ajax({
			type:'post',
			url:'../member/login_ok.do',
			//data:{"id":id,"pwd":pwd,"ck":ck},
			data:{"id":id,"pwd":pwd},
			success:function(result)
			{
				let res=result.trim();
				if(res==='NOID')
				{
					alert("아이디 존재하지 않습니다!!");
					$('#id').val("");
					$('#pwd').val("");
					$('#id').focus();
				}
				else if(res==='NOPWD')
				{
					alert("비밀번호가 틀립니다!!");
					$('#pwd').val("");
					$('#pwd').focus();
				}
				else
				{
					location.href="../main/main.do";
				}
			}
		})
	})
})
</script>
<style type="text/css">
 .carousel-inner > .carousel-item > img{
       width: 800px;
      height: 510px; 
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

.tabset > label {
  position: relative;
  display: inline-block;
  padding: 15px 15px 25px;
  border: 1px solid transparent;
  border-bottom: 0;
  cursor: pointer;
  font-weight: 600;
}

.tabset > label::after {
  content: "";
  position: absolute;
  left: 15px;
  bottom: 10px;
  width: 22px;
  height: 4px;
  background: #8d8d8d;
}

.tabset > label:hover,
.tabset > input:focus + label {
  color: #06c;
}

.tabset > label:hover::after,
.tabset > input:focus + label::after,
.tabset > input:checked + label::after {
  background: #06c;
}

.tabset > input:checked + label {
  border-color: #ccc;
  border-bottom: 1px solid #fff;
  margin-bottom: -1px;
}

.tab-panel {
  padding: 30px 0;
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

.col-sm-6 {
  padding: 30px;
}

.tabset {
  max-width: 65em;
}

  height:100%;
}
body:before{
  content:'';
  height:100%;
  display:inline-block;
  vertical-align:middle;
}
button1{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button1:hover{
  background:#fff;
  color:#1AAB8A;
}
button1:before,button1:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button1:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button1:hover:before,button1:hover:after{
  width:100%;
  transition:800ms ease all;
}

</style>
</head>
<body>
<div class="container-fluid">
	<div class="row">
	<div class="col-lg-2"></div>
	   <div class="col-lg-6" style="margin-top: 20px">
			 <div id="demo" class="carousel slide" data-ride="carousel">
	
		    <div class="carousel-inner">
		      <!-- 슬라이드 쇼 -->
		      <div class="carousel-item active">
		        <!--가로-->
		        <img class="d-block w-100" 
		          src="https://images.pexels.com/photos/213399/pexels-photo-213399.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
		          alt="First slide">
		          <div class="carousel-caption d-none d-md-block">
		              <h5>TEST</h5>
		              <p>testtesttest</p>
		        </div>
		      </div>
		      <div class="carousel-item">
		        <img class="d-block w-100"
		          src="https://images.pexels.com/photos/2355519/pexels-photo-2355519.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"
		          alt="Second slide">
		      </div>
		      <div class="carousel-item">
		        <img class="d-block w-100"
		          src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
		          alt="Third slide">
		      </div>
		    
		    <!-- / 슬라이드 쇼 끝 -->
		
		    <!-- 왼쪽 오른쪽 화살표 버튼 -->
		    <a class="carousel-control-prev" href="#demo" data-slide="prev">
		      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		      <!-- <span>Previous</span> -->
		    </a>
		    <a class="carousel-control-next" href="#demo" data-slide="next">
		      <span class="carousel-control-next-icon" aria-hidden="true"></span>
		      <!-- <span>Next</span> -->
		    </a>
		    <!-- / 화살표 버튼 끝 -->
		
		  </div>
	   </div>
	</div>



  <script>
    $('.carousel').carousel({
      interval: 2000 //기본 5초
    })
</script>

      
	
      <div class="col-lg-2" style="margin-top: 20px;">
        <c:if test="${sessionScope.id==null }">
          <div class="login-page">
            <div class="box">
              <form class="login-box">
                <input type="text" placeholder="username" id="id" size=15 class="input-sm" value="${id }">
                <input type="password" placeholder="password" type=password id="pwd" size=15 class="input-sm">
               	 <tr>
               	  <td class="text-center" colspan="2">
		            <Button value="로그인" class="btn btn-sm btn-danger" id="logBtn">
		          	  Login
		            </Button>
		          </td>
		         </tr>
                <p class="message">Not registered? <a href="../member/join.do">Create an account</a></p>
              </form>
            </div>
          </div>
          </c:if>
          <c:if test="${sessionScope.id!=null }">
          <div class="login-page">
            <div class="box">
              <form class="login-box">
              	<b>"${sessionScope.name}"</b>님,<br>
              	방문을 환영합니다! 
              	<br>
              	<br>
              	<!-- <a href="#">Create an account</a></p>  -->
                <button>
                  <a href="../member/mypage.do">My LIBRARY</a>
                </button>
                <br>
                <br>
                 <p><a href="../member/join_before.do">회원정보 수정</a></p> 
                 <p><a href="../member/logout.do">로그아웃</a></p> 
               
                
              </form>
            </div>
          </div>
          </c:if>
          <div class="box" style="height: 180px;">
            <p>Some text...</p>
          </div>
        </div>
        <div class="col-lg-2"></div>
  </div>




  <div class="row"    style=" height: 400px;">
  <div class="col-lg-2"></div>
    <div class="col-sm-6">
      
      <div class="tabset">
		  <!-- Tab 1 -->
		  <input type="radio" name="tabset" id="tab1" aria-controls="marzen" checked>
		  <label for="tab1">이달의 책</label>
		  <!-- Tab 2 -->
		  <input type="radio" name="tabset" id="tab2" aria-controls="rauchbier">
		  <label for="tab2">이용안내</label>
		  <!-- Tab 3 -->
		  <input type="radio" name="tabset" id="tab3" aria-controls="dunkles">
		  <label for="tab3">시설안내</label>
		  
		  <div class="tab-panels">
		    <section id="marzen" class="tab-panel">
		      <h2>이달의 책</h2>
		      <p><strong>Overall Impression:</strong> An elegant, malty German amber lager with a clean, rich, toasty and bready malt flavor, restrained bitterness, and a dry finish that encourages another drink. The overall malt impression is soft, elegant, and complex, with a rich aftertaste that is never cloying or heavy.</p>
		      <p><strong>History:</strong> As the name suggests, brewed as a stronger “March beer” in March and lagered in cold caves over the summer. Modern versions trace back to the lager developed by Spaten in 1841, contemporaneous to the development of Vienna lager. However, the Märzen name is much older than 1841; the early ones were dark brown, and in Austria the name implied a strength band (14 °P) rather than a style. The German amber lager version (in the Viennese style of the time) was first served at Oktoberfest in 1872, a tradition that lasted until 1990 when the golden Festbier was adopted as the standard festival beer.</p>
		  </section>
		    <section id="rauchbier" class="tab-panel">
		      <h2>이용안내</h2>
		      <p><strong>Overall Impression:</strong>  An elegant, malty German amber lager with a balanced, complementary beechwood smoke character. Toasty-rich malt in aroma and flavor, restrained bitterness, low to high smoke flavor, clean fermentation profile, and an attenuated finish are characteristic.</p>
		      <p><strong>History:</strong> A historical specialty of the city of Bamberg, in the Franconian region of Bavaria in Germany. Beechwood-smoked malt is used to make a Märzen-style amber lager. The smoke character of the malt varies by maltster; some breweries produce their own smoked malt (rauchmalz).</p>
		    </section>
		    <section id="dunkles" class="tab-panel">
		      <h2>시설안내</h2>
		      <p><strong>Overall Impression:</strong> A dark, strong, malty German lager beer that emphasizes the malty-rich and somewhat toasty qualities of continental malts without being sweet in the finish.</p>
		      <p><strong>History:</strong> Originated in the Northern German city of Einbeck, which was a brewing center and popular exporter in the days of the Hanseatic League (14th to 17th century). Recreated in Munich starting in the 17th century. The name “bock” is based on a corruption of the name “Einbeck” in the Bavarian dialect, and was thus only used after the beer came to Munich. “Bock” also means “Ram” in German, and is often used in logos and advertisements.</p>
		    </section>
	     </div>
	   </div>
  
</div>
      
      
      
      
     
    
    
    <div class="col-sm-2 text-center" style="margin-top: 20px">
	    <div class="box" style="height: 350px;">

		       <jsp:include page="room_reserve.jsp"></jsp:include>

	     </div>
    </div> 
     
        <div class="col-lg-2"></div>
     </div>


  	<div class="container text-center"> 
  	  <div class="row">
		<jsp:include page="quickmenu.jsp"></jsp:include>
      </div>
	</div>
	
	<div class="container-fluid">
	    <jsp:include page="books.jsp"></jsp:include>
	</div>
</div>	

	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">
$('.slider').each(function() {
	  var $this = $(this);
	  var $group = $this.find('.slide_group');
	  var $slides = $this.find('.slide');
	  var bulletArray = [];
	  var currentIndex = 0;
	  var timeout;
	  
	  function move(newIndex) {
	    var animateLeft, slideLeft;
	    
	    advance();
	    
	    if ($group.is(':animated') || currentIndex === newIndex) {
	      return;
	    }
	    
	    bulletArray[currentIndex].removeClass('active');
	    bulletArray[newIndex].addClass('active');
	    
	    if (newIndex > currentIndex) {
	      slideLeft = '100%';
	      animateLeft = '-100%';
	    } else {
	      slideLeft = '-100%';
	      animateLeft = '100%';
	    }
	    
	    $slides.eq(newIndex).css({
	      display: 'block',
	      left: slideLeft
	    });
	    $group.animate({
	      left: animateLeft
	    }, function() {
	      $slides.eq(currentIndex).css({
	        display: 'none'
	      });
	      $slides.eq(newIndex).css({
	        left: 0
	      });
	      $group.css({
	        left: 0
	      });
	      currentIndex = newIndex;
	    });
	  }
	  
	  function advance() {
	    clearTimeout(timeout);
	    timeout = setTimeout(function() {
	      if (currentIndex < ($slides.length - 1)) {
	        move(currentIndex + 1);
	      } else {
	        move(0);
	      }
	    }, 4000);
	  }
	  
	  $('.next_btn').on('click', function() {
	    if (currentIndex < ($slides.length - 1)) {
	      move(currentIndex + 1);
	    } else {
	      move(0);
	    }
	  });
	  
	  $('.previous_btn').on('click', function() {
	    if (currentIndex !== 0) {
	      move(currentIndex - 1);
	    } else {
	      move(3);
	    }
	  });
	  
	  $.each($slides, function(index) {
	    var $button = $('<a class="slide_btn">&bull;</a>');
	    
	    if (index === currentIndex) {
	      $button.addClass('active');
	    }
	    $button.on('click', function() {
	      move(index);
	    }).appendTo('.slide_buttons');
	    bulletArray.push($button);
	  });
	  
	  advance();
	});
</script>

</body>
</html>
