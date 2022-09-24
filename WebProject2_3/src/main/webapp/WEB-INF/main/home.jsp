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
<style type="text/css">
 .carousel-inner > .carousel-item > img{
       width: 800px;
      height: 510px; 
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
                <input type="text" placeholder="username"/>
                <input type="password" placeholder="password"/>
                <button>
                  login
                </button>
                <p class="message">Not registered? <a href="#">Create an account</a></p>
              </form>
            </div>
          </div>
          </c:if>
          <c:if test="${sessionScope.id!=null }">
          <div class="login-page">
            <div class="box">
               <h3>"${sessionScope.name}"님 반갑습니다.</h3>
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
    <div class="col-sm-6"  style=" height: 400px;" >
      
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
