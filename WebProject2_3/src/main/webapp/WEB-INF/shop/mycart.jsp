<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px;
}
.row{
  margin : 0px auto;
  width : 1200px;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
      <h3>나의 장바구니</h3>
      <c:if test="${sessionScope.cart==null }">
        <table class="table">
          <tr>
            <td class="text-center">
              <h3>장바구니가 비었습니다.</h3>
            </td>
          </tr>
        </table>
      </c:if>
      <c:if test="${sessionScope.cart!=null }">
        <table class="table">
          <tr class="success">
            <th class="text-center">번호</th>
            <th class="text-center"></th>
            <th class="text-center">상품명</th>
            <th class="text-center">가격</th>
            <th class="text-center">수량</th>
            <th class="text-center">비고</th>
          </tr>
          <c:forEach var="vo" items="${list }">
            <tr>
              <td class="text-center">${vo.no }</td>
              <td class="text-center">
                <img src="${vo.poster }" style="width:30px;height:30px;"></td>
              <td>${vo.name }</td>
              <td class="text-center">${vo.price }</td>
              <td class="text-center">
                <a href="#" class="btn btn-sm btn-success">구매</a>
                <a href="cart_cancel.do?no=${vo.no }" class="btn btn-sm btn-danger">삭제</a>
              </td>
            </tr>
          </c:forEach>
          <tr>
            <td colspan="6" class="text-right">
              <a href="cart_total_delete.do?no=${no }" class="btn btn-sm btn-danger">장바구니 전체삭제</a>
              <a href="detail.do?no=${no }" class="btn btn-sm btn-danger">상품으로 돌아가기</a>
            </td>
          </tr>
        </table>
      </c:if>
    </div>
  </div>
</body>
</html>