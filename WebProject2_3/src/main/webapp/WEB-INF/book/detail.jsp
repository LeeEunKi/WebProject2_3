<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="container">
		<div class="row row1">
				<div class="col-lg-3 side" style="border-right-style: solid; border-right-color: rgb(231, 234, 238);">
         			<div class="ui vertical text menu sidemenu" style="margin-bottom: 15px">
         			   <a href="../book/totalsearch.do"><h3 class="subject">통합자료검색</h3></a>
            			
          			</div>
          			<div class="ui vertical text menu sidemenu" style="margin-bottom: 15px">
         			   <a href="../book/search.do"><h3 class="subject">인기도서</h3></a>
            			
          			</div>
          			<div class="ui vertical text menu sidemenu" style="margin-bottom: 15px">
         			   <h3 class="subject">주제별검색</h3>
            			
          			</div>
			    </div>
			    <div class="col-sm-9">
		          <div class="row row1 text-center">
				      <h2 style="font-weight: 700;display: inline; padding-left: 25px">도서명: </h2>
				      <input style="position: relative; top: -3px;" type="text" size="40" class="input-lg" :value="title" ref="title" v-model="title">
				      <!-- vo-model은 아래 new Vue 안에 있는 data title='' 값을 바꿔주는 역할  -->
				      <input type="button" value="검색" class="btn btn-lg btn-primary" style="position: relative; top: -6px;" v-on:click="titleSearch()">
				  </div>
				 </div>

	<div class="col-sm-9">
				<h3 style="margin-bottom: 0px">검색 결과</h3>
				<h5 style="margin-top: 5px">Horizontal card11s</h5>
				<hr style="margin-bottom: 0px">
	</div>
	</div>
  </div>
</body>
</html>