<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<style type="text/css">

.slider .indicators .indicator-item {
  background-color: #666666;
  border: 3px solid #ffffff;
  -webkit-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
  -moz-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
}
.slider .indicators .indicator-item.active {
  background-color: #ffffff;
}
.slider {
  width: auto;
}

.slider .indicators {
  bottom: 60px;
  z-index: 100;
  /* text-align: left; */
}
.img{
 object-fit:cover
}

</style>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script type="text/javascript">
        $(document).ready(function(){
        	  $('.slider').slider();
        	});
</script>
</head>
<body>
  <div class="conBox01" style="background-color: #F2DBCE;">  
    <div class="row">
      <div class="col-sm-8" style="height: 505px;">
		 <div class="slider" style="margin-top: 30px;">
		 	<div class="slide_viewer" style="height: 435px;">
			    <ul class="slides">
			      <li>
			        <img src="../img/sample1.jpg"> <!-- random images -->
			      </li>
			      <li>
			        <img src="../img/sample2.jpg"> <!-- random images -->
			      </li>
			      <li>
			        <img src="../img/sample4.jpg"> <!-- random image -->
			      </li>
			      <li>
			        <img src="../img/sample6.jpg"> <!-- random image -->
			      </li>
			    </ul>
		    </div>
		  </div>
      
      
      </div>
        <div class="col-sm-4" style="margin-top: 15px;">
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
          <div class="box" style="height: 180px;">
            <p>Some text...</p>
          </div>
        </div>
    </div>
  </div>


  <div class="row"    style=" height: 400px;">
    <div class="col-sm-8"  style=" height: 400px;" >
       <div class="slider" style="margin-top: 15px;">
          <div class="slide_viewer" style="height: 410px;">
            <div class="slide_group">
              <div class="slide" style="background-color: white;">
                <div class="col-sm-4" style="margin: 30px;">
                  <img src="https://s-media-cache-ak0.pinimg.com/564x/f9/8e/2d/f98e2d661445620266c0855d418aab71.jpg">
                </div>
                <div class="col-sm-4" style="margin-top: 30px;">
                   <div class="row">
                     오늘의 책
                   </div>
                   <div class="row">
                     제목
                   </div>
                   <div class="row">
                     내용
                   </div>
                </div>
              </div>
              <div class="slide">
              </div>
              <div class="slide">
              </div>
              <div class="slide">
              </div>
            </div>
          </div>
        </div><!-- End // .slider -->
        <div class="slide_buttons" style="margin-top: 25px;">
        </div>
         <div class="directional_nav">
          <div class="previous_btn" title="Previous">
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="65px" height="65px" viewBox="-11 -11.5 65 66">
              <g>
                <g>
                  <path fill="#474544" d="M-10.5,22.118C-10.5,4.132,4.133-10.5,22.118-10.5S54.736,4.132,54.736,22.118
              c0,17.985-14.633,32.618-32.618,32.618S-10.5,40.103-10.5,22.118z M-8.288,22.118c0,16.766,13.639,30.406,30.406,30.406 c16.765,0,30.405-13.641,30.405-30.406c0-16.766-13.641-30.406-30.405-30.406C5.35-8.288-8.288,5.352-8.288,22.118z"/>
                  <path fill="#474544" d="M25.43,33.243L14.628,22.429c-0.433-0.432-0.433-1.132,0-1.564L25.43,10.051c0.432-0.432,1.132-0.432,1.563,0	c0.431,0.431,0.431,1.132,0,1.564L16.972,21.647l10.021,10.035c0.432,0.433,0.432,1.134,0,1.564	c-0.215,0.218-0.498,0.323-0.78,0.323C25.929,33.569,25.646,33.464,25.43,33.243z"/>
                </g>
              </g>
            </svg>
          </div>
          <div class="next_btn" title="Next">
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="65px" height="65px" viewBox="-11 -11.5 65 66">
              <g>
                <g>
                  <path fill="#474544" d="M22.118,54.736C4.132,54.736-10.5,40.103-10.5,22.118C-10.5,4.132,4.132-10.5,22.118-10.5	c17.985,0,32.618,14.632,32.618,32.618C54.736,40.103,40.103,54.736,22.118,54.736z M22.118-8.288	c-16.765,0-30.406,13.64-30.406,30.406c0,16.766,13.641,30.406,30.406,30.406c16.768,0,30.406-13.641,30.406-30.406 C52.524,5.352,38.885-8.288,22.118-8.288z"/>
                  <path fill="#474544" d="M18.022,33.569c 0.282,0-0.566-0.105-0.781-0.323c-0.432-0.431-0.432-1.132,0-1.564l10.022-10.035 			L17.241,11.615c 0.431-0.432-0.431-1.133,0-1.564c0.432-0.432,1.132-0.432,1.564,0l10.803,10.814c0.433,0.432,0.433,1.132,0,1.564 L18.805,33.243C18.59,33.464,18.306,33.569,18.022,33.569z"/>
                </g>
              </g>
            </svg>
          </div>
        </div><!-- End // .directional_nav -->
    </div>
    <div class="col-sm-4 text-center">
      <div class="well" style="height: 250px;background-color: #fff;">
       <jsp:include page="room_reserve.jsp"></jsp:include>
      </div>
    </div>  
  </div>
  <hr>
  	<div class="container text-center"> 
		<jsp:include page="quickmenu.jsp"></jsp:include>
	</div>
</body>
</html>
