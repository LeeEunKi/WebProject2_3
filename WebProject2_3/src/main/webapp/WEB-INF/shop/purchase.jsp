<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    $(function(){
        var IMP = window.IMP; //생략가능
        IMP.init('imp06552126');
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'KH Books 도서 결제',
            amount : ${totalPrice},
            buyer_email : '${id}',
            buyer_name : '${name}',
            buyer_tel : '${phone}',
            buyer_addr : '${address}',
            buyer_postcode : '${postcode}',
        }, function(rsp) {
            if ( rsp.success ) {
            	
            } else {
                //구매 내역으로 이동
                location.href="../mypage/order.do";
                alert('결제에 성공하였습니다!');
            }
        });
        
    });
    </script>
 	
</body>
</html>
