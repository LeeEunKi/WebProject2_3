<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.box {
  position: relative;
  z-index: 1;
  background: #FAFAFA;
  max-width: 100%;
  min-width: 400px;
  margin: 0 auto 20px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.1), 0 5px 5px 0 rgba(0, 0, 0, 0.15);
}
.box input {
  font-family: 'Pretendard-Regular';/*"Roboto", sans-serif;*/
  outline: 0 !important;
  background: #FFF !important;
  border: 0 !important;
  margin: 0 0 15px !important;
  padding: 15px !important;
  box-sizing: border-box !important;
  
}
.box button {
  font-family: 'Pretendard-Regular';/*"Roboto", sans-serif;*/
  text-transform: uppercase !important; 
  outline: 0 !important;
  background: #405173 !important;
  width: 100% !important;
  border: 0 !important;
  padding: 15px !important;
  color: #FAFAFA !important;
  font-size: 14px !important;
  -webkit-transition: all 0.3 ease !important;
  transition: all 0.3 ease !important;
  cursor: pointer !important;
}
.box button:hover,.box button:active,.box button:focus {
  background: #43A047;
}
.box .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.box .message a {
  color: #4CAF50;
  text-decoration: none;
}
.box .register-box {
  display: none;
}
.project-box {
    --main-color-card: #dbf6fd;
    border-radius: 30px;
    padding: 16px;
    background-color: white;
}

td, tr{
 border-bottom: none;
 border-top: none;
}

</style>

</head>
<body>
		<!-- Start Hero Section -->
			<div class="hero">
				<div class="container">
					<div class="row justify-content-between">
						<div class="col-lg-7">

							<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
								<div class="carousel-inner">
								  <div class="carousel-item active">
									<img class="d-block w-100" src="../images/sample1.jpg" alt="First slide">
								  </div>
								  <div class="carousel-item">
									<img class="d-block w-100" src="../images/sample4.jpg" alt="Second slide">
								  </div>
								  <div class="carousel-item">
									<img class="d-block w-100" src="../images/sample6.jpg" alt="Third slide">
								  </div>
								</div>
								<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
								  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								  <span class="sr-only">Previous</span>
								</a>
								<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
								  <span class="carousel-control-next-icon" aria-hidden="true"></span>
								  <span class="sr-only">Next</span>
								</a>
							  </div>
							    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
									integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
									crossorigin="anonymous"></script>
								<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
									integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
									crossorigin="anonymous"></script>
								<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
									integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
									crossorigin="anonymous"></script>
								<script>
									$('.carousel').carousel({
									interval: 2000 //기본 5초
									})
								</script>
						</div>
						
		<div class="col-lg-5">
			<div class="intro-excerpt">
				<c:if test="${sessionScope.id==null }">
		          <div class="login-page">
		            <div class="box" >
		              <form class="login-box">
		                <input type="text" placeholder="username" id="id" size=15 class="input-sm" value="${id }" style="width: 100%;font-size: 14px;">
		                <input type="password" placeholder="password" type=password id="pwd" size=15 class="input-sm"  style="width: 100%;font-size: 14px;">
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
		                  <a href="../mypage/mypage_Volunteer.do" style="color: white">My LIBRARY</a>
		                </button>
		                <br>
		                <br>
		                <button>
		                  <a href="../member/logout.do" style="color: white">로그아웃</a>
		                </button>
		              </form>
		            </div>
		          </div>
     		     </c:if> 
					 <jsp:include page="searchBar.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
</div>
		<!-- End Hero Section -->

		<!-- Start Product Section -->
		<!-- <div class="product-section">
			<div class="container">
				
			</div>
		</div> -->
		<!-- End Product Section -->

		<!-- Start Why Choose Us Section -->
		<div class="why-choose-section" style="padding-bottom: 70px; background-color: #FAFAFA">
			<div class="container">
				<div class="row justify-content-between">
					<div class="col-lg-6">
						<div class="testimonial-section">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-md-6">
						<h2 class="font-weight-bold heading text-primary mb-4 mb-md-0">오늘의 책</h2>
					</div>
					<div class="col-md-6 text-md-end">
						<div id="testimonial-nav">
							<span class="prev" data-controls="prev">Prev</span>
							<span class="next" data-controls="next">Next</span>
						</div>
					</div>
				</div>
							<div class="testimonial-slider">
								<c:forEach var="tvo" items="${tlist }">
									<div class="item">
								   	  <table class="table">
					                      <tr>
					                        <td rowspan="3" style="vertical-align: top;">
					                        <a href="../book/detail.do?no=${tvo.no }">
					                          <img src="${tvo.img }" style="width: 200px; height: 300px;">
					                        </a>
					                        </td>
					                        <td>
					                        </td>
					                      </tr>
					                      <tr>
					                        <td>
					                           <h3 class="h4 text-primary mb-4">${tvo.title }</h3>
					                        </td>
					                      </tr>
					                      <tr>
					                        <td><p class="sub-title">${tvo.description }</p>
					                        
					                        <ul style="list-style: none; padding-left: 0px;margin-left: 0px;">
					                          <li><p style="font-size: 14px;font-weight: 600;">${tvo.publisher }</p></li>
					                          <li><p style="font-size: 14px;font-weight: 600;">${tvo.author }</p></li>
					                        </ul>
					                        </td>
					                      </tr>
					                    </table>
					                   </div>
								   	  </c:forEach>
								
							</div>

						</div>
					</div>
						<div class="testimonial-section">
			<div class="container">
				<div class="row mb-5 align-items-center"  style="margin-top: 10px; margin-bottom: 28px !important;">
					<div class="col-md-6">
						<h2 class="font-weight-bold heading text-primary mb-4 mb-md-0">입고된 책</h2>
					</div>
					
				</div>
							<div class="testimonial-slider">
									<div class="item">
								   	  <table class="table">
					                      <tr>
					                        <td rowspan="3" style="vertical-align: top;">
					                         <a href="../book/detail.do?no=${tlist2[0].no }">
					                          <img src="${tlist2[0].img }" style="width: 200px; height: 300px;">
					                         </a>
					                        </td>
					                        <td>
					                        </td>
					                      </tr>
					                      <tr>
					                        <td> 
					                          <h3 class="h4 text-primary mb-4">${tlist2[0].title }</h3>
					                        </td>
					                      </tr>
					                      <tr>
					                        <td><p class="sub-title">${tlist2[0].description }</p>
					                        
					                        <ul style="list-style: none; padding-left: 0px;margin-left: 0px;">
					                          <li><p style="font-size: 14px;font-weight: 600;">${tlist2[0].publisher }</p></li>
					                          <li><p style="font-size: 14px;font-weight: 600;">${tlist2[0].author }</p></li>
					                        </ul>
					                        </td>
					                      </tr>
					                    </table>
					                   </div>
								   	
								
							</div>

						</div>
					</div>
					</div>

					<div class="col-md-12 col-lg-6 mb-6 mb-lg-0">
					  
		      			 <jsp:include page="room_reserve.jsp"></jsp:include>
		      		
	    			 
	    			 <div style="height: 40px"></div>
	    			 <div style="margin-top: 45px">
						<div class="row" style="display: block;padding-bottom: 20px;padding-top: 65px;">
						  <h2 class="mb-4 section-title" style="float: left;">바로가기</h2>
						</div>



   						 <div class="row my-5">
							<div class="col-lg-6 mb-6">
								<div class="feature">
									<div class="icon">
										<a href="../book/search.do">
											<img src="../img/book_find.png" style="width:50px;" alt="Image" class="imf-fluid">
									</div>
									<h3>도서검색</h3></a>
									<p>도서관 보유 도서 리스트</p>
								</div>
							</div>

							<div class="col-6 col-md-6">
								<div class="feature">
									<div class="icon">
										<a href="../study/room_list.do">
											<img src="../img/room_reserve.png" style="width:50px;" alt="Image" class="imf-fluid">
									</div>
									<h3>열람실 예약</h3></a>
									<p>열람실 운영시간을 참고해주세요</p>
								</div>
							</div>

							<div class="col-6 col-md-6">
								<div class="feature">
									<div class="icon">
										<a href="../shop/list.do">
											<img src="../img/book_mall.png" style="width:50px;" alt="Image" class="imf-fluid">
									</div>
									<h3>중고서적 온라인몰</h3></a>
									<p>다양한 도서를 저렴한 가격으로</p>
								</div>
							</div>

							<div class="col-6 col-md-6">
								<div class="feature">
									<div class="icon">
									<a href="../board/list.do">
										<img src="../img/community.png" style="width:50px;" alt="Image" class="imf-fluid">
									</div>
									<h3>커뮤니티</h3></a>
									<p>다독다독 커뮤니티</p>
								</div>
							</div>

						</div>
					</div>
					</div>
					</div>
				</div>
			</div>
		
		<div class="blog-section" style="margin-top: 40px">
			<jsp:include page="books.jsp"></jsp:include>
		</div>	
		
	
		<!-- 슬라이더 자바스크립트 -->
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
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/tiny-slider.js"></script>
<script src="../js/custom.js"></script>
</body>
</html>