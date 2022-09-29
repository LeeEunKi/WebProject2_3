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
#books {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#books td, #books th {
  padding: 8px;
}

#books tr:nth-child(even){background-color: #f2f2f2;}

#books tr:hover {background-color: #ddd;}

#books th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #6a8b7f;
  color: white;
}
.container{
  margin-top: 50px;
}
.row{
  margin : 0px auto;
}
h3{
font-family:'yangjin' !important;
}
*{
font-family:'Pretendard-Regular';
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
      <h3>구매내역</h3>
      	<c:if test="${listsize==0 }">
      		<h4 style="text-align:left; margin:50px auto;">구매 내역이 없습니다.</h4>
      	</c:if>
      	<c:if test="${listsize!=0 }">
	        <table id="books">
	          <tr class="warning">
	            <th width="10%" class="text-center">주문번호</th>
	            <th width="10%" class="text-center">제품 이미지</th>
	            <th width="50%" class="text-center">상품명</th>
	            <th width="10%" class="text-center">가격</th>
	            <th width="10%" class="text-center">주문일</th>
	          </tr>
		          <c:forEach var="vo" items="${list }">
		            <tr>
		              <td width="10%" class="text-center">${vo.no }</td>
		              <td width="10%" class="text-center">
		                <img src="${vo.poster }" style="width:40px;height:60px;"></td>
		              <td width="50%" >
		              	<a href="../shop/detail_before.do?no=${vo.no }">${vo.title }</a>
		              	<br>${vo.author}&nbsp;|&nbsp;${vo.publisher }</td>
		              <td width="10%" class="text-center"><fmt:formatNumber value="${vo.price}" type="number" maxFractionDigits="3"/>원</td>
		              <td width="10%" class="text-center">${vo.dbday }</td>
		            </tr>
		          </c:forEach>
	        </table>
        </c:if>
    </div>
  </div>
</body>
</html>