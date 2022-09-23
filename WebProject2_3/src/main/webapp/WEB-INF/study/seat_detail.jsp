<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-sm-7">
	<div class="plane-container">
	  <div class="plane">
	  <div class="row">
           <div style="height: 50px;"><h4>제 <strong>{{roomNo}}</strong> 열람실 좌석 현황</h4></div>
   	  </div>
	   <c:forEach begin="0" end="9" varStatus="i">
	     <div class="row">
	     <c:forEach begin="1" end="10" varStatus="j">
	        <div v-for="svo in seat_data"  :class="['seat', svo.state=='occupied'?'occupied':'']" 
	           v-if="svo.no === ${j.index+(i.index*10)}" @click="toggle" data="${j.index+(i.index*10) }">
	         {{svo.no}} 
	        </div>
     	      </c:forEach>
	     </div>
	   </c:forEach>
	  </div>
	</div>
</div>
</body>
</html>