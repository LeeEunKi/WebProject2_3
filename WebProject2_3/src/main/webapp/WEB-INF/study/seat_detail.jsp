<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	      <div class="seat occupied">1</div>
	      <div class="seat occupied">2</div>
	      <div class="seat occupied">3</div>
	      <div class="seat occupied">4</div>
	      <div class="seat occupied">5</div>
	      <div class="seat occupied">6</div>
	      <div class="seat occupied">7</div>
	      <div class="seat occupied">8</div>
	      <div class="seat occupied">9</div>
	      <div class="seat occupied">10</div>
	    </div>
	    <div class="row">
	      <div class="seat">11</div>
	      <div class="seat">12</div>
	      <div class="seat">13</div>
	      <div class="seat">14</div>
	      <div class="seat">15</div>
	      <div class="seat occupied">16</div>
	      <div class="seat occupied">17</div>
	      <div class="seat occupied">18</div>
	      <div class="seat occupied">19</div>
	      <div class="seat occupied">20</div>
	    </div>
	    <div class="row">
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat occupied"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	    </div>
	    <div class="row">
	      <div class="seat occupied"></div>
	      <div class="seat occupied"></div>
	      <div class="seat occupied"></div>
	      <div class="seat"></div>
	      <div class="seat occupied"></div>
	      <div class="seat occupied"></div>
	      <div class="seat occupied"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	    </div>
	    <div class="row">
	      <div class="seat occupied"></div>
	      <div class="seat occupied"></div>
	      <div class="seat occupied"></div>
	      <div class="seat occupied"></div>
	      <div class="seat occupied"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat occupied"></div>
	      <div class="seat occupied"></div>
	      <div class="seat occupied"></div>
	    </div>
	    <div class="row">
	      <div style="height: 50px;"></div>
	    </div>
	    <div class="row">
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	    </div>
	    <div class="row">
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	    </div>
	    <div class="row">
	      <div class="seat occupied"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	    </div>
	    <div class="row">
	      <div class="seat occupied"></div>
	      <div class="seat occupied"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat occupied"></div>
	      <div class="seat occupied"></div>
	      <div class="seat occupied"></div>
	    </div>
	    <div class="row">
	      <div class="seat occupied"></div>
	      <div class="seat occupied"></div>
	      <div class="seat occupied"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	      <div class="seat"></div>
	    </div>
	  </div>
	</div>
</div>
<div class="col-sm-5">
 <div class="state">
	  <ul class="showcase">
	    <li>
	      <div class="seat"></div>
	      <small>선택 가능</small>
	    </li>
	    <li>
	      <div class="seat selected"></div>
	      <small>선택 됨</small>
	    </li>
	    <li>
	      <div class="seat occupied"></div>
	      <small>선택 완료</small>
	    </li>
	  </ul>
	  <div class="information">
	    <p class="text">
	      <span id="count">0</span>자리가 선택되었습니다 (<span id="total"
	                                                  >0</span
	      >원)
	    </p>
	  </div>
	</div>
</div>
<!-- partial -->
</body>
</html>