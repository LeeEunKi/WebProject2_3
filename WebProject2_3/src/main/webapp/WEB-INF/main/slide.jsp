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
 <div class="col-sm-8" style="height: 505px;">
	 <div class="slider" style="margin-top: 30px;">
	 	<div class="slide_viewer" style="height: 435px;">
		    <ul class="slides">
		      <li>
		        <img src="../img/sample1.jpg"> <!-- random image -->
		      </li>
		      <li>
		        <img src="../img/sample2.jpg"> <!-- random image -->
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
</body>
</html>