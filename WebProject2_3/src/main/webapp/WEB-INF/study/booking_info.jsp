<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-sm-5" style="background-color: white; height: 445px; padding: 40px; ">
  <div class="row" style="margin-bottom: 25px;">
    <div class="seat"></div>
    <small>사용 가능</small>
    <div class="seat occupied"></div>
    <small>사용 중</small>
    <div class="seat selected state1"></div>
    <small>선택된 좌석</small>
  </div>
  <div class="row text-center" style="height: 50px;">
    <h3>예약 정보</h3>
    <hr>
  </div>
  <div class="row">
    <table class="table">
      <tr>
        <th width="30%">열람실</th>
        <td width="70%">제 <strong>{{roomNo}}</strong> 열람실</td>
      </tr>
      <tr>
        <td width="30%">좌석번호</td>
        <td width="70%">
         <span v-if="selected_no!=0">
         	{{selected_no}}
         </span>
        </td>
      </tr>
      <tr>
        <td width="30%">시작 시간</td>
        <td width="70%">
         <span>{{now_date}} &nbsp; {{now_time}}</span>
        </td>
      </tr>
      <tr>
        <td width="30%">종료 시간</td>
        <td width="70%">
          <span>{{now_date}} &nbsp; {{after_time}}</span>
        </td>
      </tr>
      <tr>
        <td colspan="2" style="text-align-last: center;">
          <button type="button" class="btn btn-sm btn-info">예약하기</button>
        </td>
      </tr>
    </table>
  </div>
</div> 
</body>
</html>