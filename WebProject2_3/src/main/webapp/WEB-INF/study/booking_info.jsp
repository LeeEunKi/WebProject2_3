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
<div class="col-sm-5" style="background-color: white; height: 445px; padding: 40px; ">
 <div class="box project-box"> 
  <div class="row1" style="margin-bottom: 25px;">
    <div class="seat"></div>
    <small>사용 가능</small>
    <div class="seat occupied"></div>
    <small>사용 중</small>
    <div class="seat selected state1"></div>
    <small>선택된 좌석</small>
  </div>
  <div class="row1 text-center" style="height: 50px;">
    <h3>예약 정보</h3>
    <hr>
  </div>
  <div class="row1">
    <table class="table">
      <tr>
        <th width="30%">열람실</th>
        <td width="70%">제 <strong>{{roomNo}}</strong> 열람실</td>
      </tr>
      <tr>
        <th width="30%">예약자명</th>
        <td width="70%" > {{member_name}} </td>
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
         <c:if test="${sessionScope.id!=null }">
          <button type="button" class="btn btn-sm btn-info" @click="booking()">예약하기</button>
         </c:if>
     	 <c:if test="${sessionScope.id==null }">
          <span style="font-size: 15px; color: red; font-style: italic;">예약은 로그인시 사용 가능합니다.</span>
         </c:if>
        </td>
      </tr>
    </table>
  </div>
 </div> 
</div> 
</body>
</html>