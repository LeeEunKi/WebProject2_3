<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/room_style.css">
<style type="text/css">
thead{
	border: 1px;
    color: #F0F5FA;
    font-weight: bold;
    border-style: solid;
    border-color: #BFC3C5;
    background-color: #0054A6;
}
</style>
</head>
<body>
<div class="container">
<div class="row">
  <h1>열람실 좌석 현황</h1>
</div>
<hr>
<div class="row text-center">
 <button type="button" class="btn btn-lg btn-success" style="margin-right: 20px;">제 1 열람실</button>
 <button type="button" class="btn btn-lg btn-success" style="margin-right: 20px;">제 2 열람실</button>
 <button type="button" class="btn btn-lg btn-success" style="margin-right: 20px;">제 3 열람실</button>
</div>
<div>
  <h4>제 1열람실 좌석 현황</h4>
  <table class="table table-bordered">
    <thead> 
      <tr style="text-align-last: center;">
        <th>열람실 명</th>
        <th>전체좌석</th>
        <th>사용좌석</th>
        <th>잔여좌석</th>
        <th>이용률(%)</th>
      </tr>
    </thead>  
    <tbody>  
      <tr class="text-center">
       <td>제 1열람실</td>
       <td>100</td>
       <td>30</td>
       <td>70</td>
       <td>70%</td>
      </tr>
      <tr class="text-center">
       <td>제 2열람실</td>
       <td>100</td>
       <td>30</td>
       <td>70</td>
       <td>70%</td>
      </tr>
      <tr class="text-center">
       <td>제 3열람실</td>
       <td>100</td>
       <td>30</td>
       <td>70</td>
       <td>70%</td>
      </tr>
     </tbody> 
  </table>
  <div id="seat-area">
   <div class="row"> 
    <jsp:include page="./seat_detail.jsp"></jsp:include>
   </div> 
  </div>
</div>
</div>
</body>
<script  src="../css/room_script.js"></script>
</html>