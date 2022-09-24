<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<%--체크된 것만 결제되도록 처리
	https://dev-doodoo.tistory.com/204
 --%>
  <div class="container">
    <div class="row" style="width:950px;">
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
          <tr class="warning">
            <th width="10%" class="text-center"></th>
            <th width="10%" class="text-center"></th>
            <th width="40%" class="text-center">상품명</th>
            <th width="10%" class="text-center">가격</th>
            <th width="20%" class="text-center">비고</th>
          </tr>
          <c:forEach var="vo" items="${list }">
            <tr>
              <td width="10%"><input type="checkbox"></td>
              <input type="hidden" value="${vo.no }">
              <td width="10%" class="text-center">
                <img src="${vo.poster }" style="width:40px;height:60px;"></td>
              <td width="40%" >${vo.name }</td>
              <td width="10%" class="text-center"><fmt:formatNumber value="${vo.price}" type="number" maxFractionDigits="3"/>원</td>
              <td width="20%" class="text-center">
                <a href="../shop/purchase.do" class="btn btn-sm btn-success">구매</a>
                <a href="cart_cancel.do?no=${vo.no }" class="btn btn-sm btn-danger">삭제</a>
              </td>
            </tr>
          </c:forEach>
          <tr>
            <td colspan="5" class="text-right">
              <a href="cart_total_delete.do?no=${no }" class="btn btn-sm btn-danger">장바구니 전체삭제</a>
              <a href="../shop/detail.do?no=${no }" class="btn btn-sm btn-danger">상품으로 돌아가기</a>
            </td>
          </tr>
        </table>
      </c:if>
    </div>
  </div>
</body>
</html>