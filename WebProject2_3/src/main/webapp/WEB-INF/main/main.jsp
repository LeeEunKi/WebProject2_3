<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/bootstrap_nav.css">
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
    /* Studios Page Custom CSS */
.card-container {
  position: relative;
  width: 100%;
  margin: 20px 0 0 20px;
}
.card {
  height: 200px;
  min-height: 100%;
  width: 100%;
  background-color: #FFF;
  color: #FFF;
  text-align: center;
  margin: auto;

}
.card-subtitle {
  text-transform: uppercase;
  text-align: center;
  color: #888;
  font-size: 14px;
  padding: 7px 0 10px 0;
  margin: 0;
  font-weight: bold;
  letter-spacing: 5px;
}
.card-section {
  border: 0px;
  width: 250px;
  float: left;
  margin: 10px;
}
.card-section img {
  width: 100%;
  height: 330px;
}
.card-description {
  height: 20px;
  color: #4C4C4C;
  text-align: left;
  margin: 0;
  padding: 5px 30px 15px 30px;
}
.card-title {
  font-size: 30px;
  color: #2B2B2B;
  text-align:center;
  font-weight: bold;
  margin: 0;
  padding: 15px 30px 5px 30px;
}
.card hr {
  width: 50px;
}
.card-button {
  border: 1px solid #CDBB00;
  background-color: transparent;
  color: #CDBB00;
  text-align: center;
  width: 110px;
  padding: 10px;
  margin-top:10px;
  margin-bottom: 15px;
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