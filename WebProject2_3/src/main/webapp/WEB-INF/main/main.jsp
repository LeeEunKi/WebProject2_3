<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
      /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }

    .carousel-inner img {
      width: 100%; /* Set width to 100% */
      min-height: 200px;
    }

    /* Hide the carousel text when the screen is less than 600 pixels wide */
    @media (max-width: 600px) {
      .carousel-caption {
        display: none; 
      }
    }

/*
박스 레이아웃
*/

@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.box {
  position: relative;
  z-index: 1;
  background: #FAFAFA;
  max-width: 360px;
  margin: 0 auto 20px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.1), 0 5px 5px 0 rgba(0, 0, 0, 0.15);
}
.box input {
  font-family: 'Pretendard-Regular';/*"Roboto", sans-serif;*/
  outline: 0 !important;
  background: #FFF !important;
  width: 100% !important;
  border: 0 !important;
  margin: 0 0 15px !important;
  padding: 15px !important;
  box-sizing: border-box !important;
  font-size: 14px !important;
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
  </style>
<title>Insert title here</title>
</head>
<body>
 <div class="container-fluid">
  <tiles:insertAttribute name="header"/>
  <tiles:insertAttribute name="content"/>
  <tiles:insertAttribute name="footer"/>
 </div> 
</body>
</html>