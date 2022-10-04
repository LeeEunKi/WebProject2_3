<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Untree.co">
  <link rel="shortcut icon" href="favicon.png">

  <meta name="description" content="" />
  <meta name="keywords" content="bootstrap, bootstrap4" />

		<!-- Bootstrap CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
		<link href="css/tiny-slider.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co </title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">

h1 {
   text-align: center
}

h2 {
  text-align: center;
  padding: 20px 0;
}

.p {
  text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let fileIndex=0; // 전역변수
$(function(){
	$('#writeBtn').on('click',function(){
		let name=$('#name').val();
		if(name.trim()=="")
		{
			$('#name').focus();
			return;
		}
		
		let subject=$('#subject').val();
		if(subject.trim()=="")
		{
			$('#subject').focus();
			return;
		}
		
		let content=$('#content').val();
		if(content.trim()=="")
		{
			$('#content').focus();
			return;
		}
		
		let pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			return;
		}
		
		$('#frm').submit();
	})
	
	
	// 추가 
	$('#addBtn').click(function(){
		$('#user-table > tbody').append(
		   '<tr id="m'+(fileIndex)+'">'
		  +'<td width=20%>파일 '+(fileIndex+1)+'</td>'
		  +'<td width=80%><input type=file name=files['+(fileIndex)+']></td>'
		  +'</tr>'
		)
		fileIndex=fileIndex+1;
	})
	// 취소
	$('#removeBtn').click(function(){
		if(fileIndex>0)
		{
		    $('#m'+(fileIndex-1)).remove();
		    fileIndex=fileIndex-1;
		}
	})
})
</script>
</head>
<body>

		<!-- Start Hero Section -->
			<div class="hero">
				<div class="container">
					<div class="row justify-content-between">
						<div class="col-lg-5">
							<div class="intro-excerpt">
								<h1>정보공유 게시판</h1>
							</div>
						</div>
						<div class="col-lg-7">
							
						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->
		
  &nbsp;&nbsp;<h2><b>글 작성 페이지</b></h2>
  <div class="container">
    <div class="row row1">
      <%--  enctype="multipart/form-data" 파일업로드 프로토콜 (생략이 되면 파일업로드를 할 수 없다 )--%>
      <form method=post action="insert_ok.do" id="frm" enctype="multipart/form-data">
      <table class="table">
       <tr>
         <th width=20% class="text-right">이름</th>
         <td width=80%>
           <input type=text name=name id=name size=20 class="input-sm">
         </td>
       </tr>
       <tr>
         <th width=20% class="text-right">제목</th>
         <td width=80%>
           <input type=text name=subject id=subject size=50 class="input-sm">
         </td>
       </tr>
       <tr>
         <th width=20% class="text-right">내용</th>
         <td width=80%>
           <textarea rows="10" cols="50" name=content id=content></textarea>
         </td>
       </tr>
       <tr>
         <th width=20% class="text-right">첨부파일</th>
         <td width=80%>
           <table class="table">
             <tr>
               <td class="text-right">
                 <input type=button value="추가" class="btn btn-xs btn-danger" id="addBtn">
                 <input type=button value="취소" class="btn btn-xs btn-primary" id="removeBtn">
               </td>
             </tr>
           </table>
           <table class="table" id="user-table">
             <tbody>
               
             </tbody>
           </table>
         </td>
       </tr>
       <tr>
         <th width=20% class="text-right">비밀번호</th>
         <td width=80%>
           <input type=password name=pwd id=pwd size=15 class="input-sm">
         </td>
       </tr>
       <tr>
        <td colspan="2" class="text-center">
          <input type=button value="글쓰기" class="btn btn-sm btn-warning" id="writeBtn">
          <input type=button value="취소" class="btn btn-sm btn-info"
            onclick="javascript:history.back()">
        </td>
       </tr>
      </table>
      </form>
    </div>
  </div>
</body>
</html>