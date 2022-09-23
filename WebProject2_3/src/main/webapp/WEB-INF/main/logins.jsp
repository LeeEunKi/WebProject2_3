<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row1{
	margin: 0px auto;
	width: 350px
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#logBtn').click(function(){
		let id=$('#id').val();
		if(id.trim()==="")
		{
			$('#id').focus();
			return;
		}
		let pwd=$('#pwd').val();
		if(pwd.trim()==="")
		{
			$('#pwd').focus();
			return;
		}
		let ck=$("#ck").is(":checked");
		$.ajax({
			type:'post',
			url:'../member/login_ok.do',
			data:{"id":id,"pwd":pwd,"ck":ck},
			success:function(result)
			{
				let res=result.trim();
				if(res==='NOID')
				{
					alert("아이디 존재하지 않습니다!!");
					$('#id').val("");
					$('#pwd').val("");
					$('#id').focus();
				}
				else if(res==='NOPWD')
				{
					alert("비밀번호가 틀립니다!!");
					$('#pwd').val("");
					$('#pwd').focus();
				}
				else
				{
					location.href="../main/main.do";
				}
			}
		})
	})
})
</script>
</head>
<body>
	<c:if test="${sessionScope.id==null }">
          <div class="login-page">
            <div class="box">
              <form class="login-box">
                <input type="text" placeholder="username" class="input-sm" value="${id }">
                <input type="password" placeholder="password" class="input-sm">
				<input type=button value="로그인" class="btn btn-sm btn-danger" id="logBtn">
                <p class="message">Not registered? <a href="#">Create an account</a></p>
              </form>
            </div>
          </div>
          </c:if>
          <c:if test="${sessionScope.id!=null }">
          <div class="login-page">
            <div class="box">
            	<h3>"${sessionScope.name}"님 반갑습니다.</h3>
            </div>
            </div>
          </c:if>
</body>
</html>