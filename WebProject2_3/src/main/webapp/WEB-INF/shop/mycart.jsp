<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	let price = 0;
	$('#ckall').click(function(){
	    if($("input[name=ckall]").prop("checked")){
	        $("input[name=usedbooks]").prop("checked",true);   // 전체 체크
	        let total = 0;
	        $('input[name=usedbooks]').each(function(){
        		let book_price = parseInt($(this).attr("data-price"));
        		total = total + book_price;
	        })
	        console.log(total);
	        $('#totalprice').text(total+'원');
	    }else{
	        $("input[name=usedbooks]").prop("checked",false);
	        //$('#totalprice').text('0원');// 전체 체크 해제
	    }
	});
	$('input[type=checkbox]').click(function(){
		if($(this).attr("data-checked")=='f'){
		console.log(this);
		$(this).attr("data-checked",'t');
		price = price + parseInt($(this).attr("data-price"));
		console.log(price);
		$('#totalprice').text(price+'원');
		}else{
			$(this).attr("data-checked",'f')
			price = price - parseInt($(this).attr("data-price"));
			$('#totalprice').text(price+'원');
		}
	})
})
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
#books {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#books td, #books th {
  border: 1px solid #ddd;
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
</style>
</head>
<body>
<%--체크된 것만 결제되도록 처리
	https://dev-doodoo.tistory.com/204
 --%>
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
        <table id="books">
          <tr class="warning">
            <th width="10%" class="text-center"><input type="checkbox" id="ckall" name="ckall"></th>
            <th width="10%" class="text-center"></th>
            <th width="60%" class="text-center">상품명</th>
            <th width="10%" class="text-center">가격</th>
            <th width="10%" class="text-center">비고</th>
          </tr>
          <form method="post" action="../shop/purchase.do">
	          <c:forEach var="vo" items="${list }">
	            <tr>
	              <td width="10%" class="text-center"><input type="checkbox" name="usedbooks" value="${vo.no }" data-checked="f" data-price="${vo.price }"></td>
	              	<input type="hidden" value="${vo.no }">
	              <td width="10%" class="text-center">
	                <img src="${vo.poster }" style="width:40px;height:60px;"></td>
	              <td width="60%" >${vo.name }<br>${vo.author}&nbsp;|&nbsp;${vo.publisher }</td>
	              <td width="10%" class="text-center"><fmt:formatNumber value="${vo.price}" type="number" maxFractionDigits="3"/>원</td>
	              <td width="10%" class="text-center"><a href="../shop/cart_cancel.do?no=${vo.no }" class="btn btn-sm btn-danger">삭제</a></td>
	            </tr>
	          </c:forEach>
	          <tr><td colspan="5" class="text-right">
	          	<h3 id="totalprice"></h3>
                <button type="submit" class="btn btn-sm btn-success">선택한 상품 구매</a>
              </td></tr>
          </form>
          <tr>
            <td colspan="5" class="text-right">
              <a href="cart_total_delete.do?no=${no }" class="btn btn-sm btn-danger">장바구니 전체삭제</a>
              <a href="../shop/detail.do?no=${no }" class="btn btn-sm btn-danger">상품으로 돌아가기</a>
            </td>
          </tr>
        </table>
      </c:if>
</body>
</html>