<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('#searchBtn').click(function(){
		let cnt=$('input[name=checked]:checkbox:checked').length;
		if(cnt<1){
			alert("분류를 한개 이상 선택하세요!");
			return;
		}
		if($('#search_text').val().trim()==""){
			alert("검색어를 입력하세요!");
			return;
		}

		$('#searchForm').submit();
	})
})
</script>
</head>
<body>
<div class="srchBox">
	    <form method="post" action="../search/search.do" id="searchForm">
		  <label for="ch_1">
		    <input type="checkbox" id="ch_1" name="checked" value="T" checked="checked">
		 	   도서명
		  </label>
		  <label for="ch_2">
		    <input type="checkbox" id="ch_1" name="checked" value="A">
		   	 저자명
		  </label>
		  <label for="ch_3">
		    <input type="checkbox" id="ch_3" name="checked" value="G">
		 	   장르
		  </label>
		  <div class="srch">
		    <input type="text" class="searchTxt" id="search_text" name="ss" title="검색어를 입력해주세요"
		    placeholder="검색어를 입력해주세요." autocomplete="off">
		    <!-- <input type="button" id="searchBtn" value="검색"> -->
		    <img src="../img/search.png" id="searchBtn" style="cursor: pointer;">
		  </div>
	    </form>
	</div>
</body>
</html>