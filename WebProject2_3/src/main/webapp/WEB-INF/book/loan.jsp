<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style type="text/css">
.subject{
	position: relative;
    color: rgb(103, 114, 148);
    font-size: 25px;
    font-family: Medium, sans-serif;
    font-weight: bold;
    letter-spacing: -0.45px;
     margin-bottom: 15px; 
}
.side{
    width: 200px;
    border-right-style: inherit;
    border-right-width: thin;
    border-right-color: graytext;
}
.active_a{
   font-weight: bold;
}
.table>tbody>tr>td,
.table>tbody>tr>td, 
.table>tbody>tr>th, 
.table>tfoot>tr>td, 
.table>tfoot>tr>th, 
.table>thead>tr>td, 
.table>thead>tr>th {
    padding: 8px;
    vertical-align: top;  
}


/*
 CSS for the main interaction
*/
.tabset > input[type="radio"] {
  position: absolute;
  left: -200vw;
}

.tabset .tab-panel {
  display: none;
}

.tabset > input:first-child:checked ~ .tab-panels > .tab-panel:first-child,
.tabset > input:nth-child(3):checked ~ .tab-panels > .tab-panel:nth-child(2),
.tabset > input:nth-child(5):checked ~ .tab-panels > .tab-panel:nth-child(3),
.tabset > input:nth-child(7):checked ~ .tab-panels > .tab-panel:nth-child(4),
.tabset > input:nth-child(9):checked ~ .tab-panels > .tab-panel:nth-child(5),
.tabset > input:nth-child(11):checked ~ .tab-panels > .tab-panel:nth-child(6) {
  display: block;
}

/*
 Styling
*/
body {
  font: 16px/1.5em "Overpass", "Open Sans", Helvetica, sans-serif;
  color: #333;
  font-weight: 300;
}

.tabset > label {
  position: relative;
  display: inline-block;
  padding: 15px 15px 25px;
  border-bottom: 0;
  cursor: pointer;
  font-weight: 600;
}

.tabset > label::after {
  content: "";
  position: absolute;
  display: none;
}

.tabset > label:hover,
.tabset > input:focus + label {
  color: #207856;
}

.tabset > label:hover::after,
.tabset > input:focus + label::after,
.tabset > input:checked + label::after {
  background: #207856;
}

.tabset > input:checked + label {
  border-color: #ccc;
  border-bottom: none;
  margin-bottom: -1px;
}

.tab-panel {
  padding: 30px 8px;
  border-top: 1px solid #ccc;
}

/*
 Demo purposes only
*/
*,
*:before,
*:after {
  box-sizing: border-box;
}

.tabset {
  max-width: 65em;
}
a{
	text-decoration: none !important;
}
a:hover{
	text-decoration: none; !important;
}
.li{
	padding-bottom: 7px;
}



.sidebar {
  margin: 0;
  padding: 0;
  width: 200px;

  position: absolute;
  height: 50%;
  overflow: hidden;
}

.sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}
 
.sidebar a.active {
  background-color: #3b5d50;
  color: white;
}
.sidebar a:hover:not(.active) {
  background-color: #777;
  color: white;
}

.sidebar span {
  display: block;
  color: black;
  padding: 8px 16px;
  text-decoration: none;
}
 
.sidebar span.active {
  background-color: #3b5d50;
  color: white;
}

.sidebar span:hover:not(.active) {
  background-color: #777;
  color: white;
}


div.content {
  margin-left: 200px;
  padding: 1px 16px;
}

@media screen and (max-width: 700px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
	.sidebar{
		display:flex;
	}
  div.content {
		margin-left: 0;
	}
}

@media screen and (max-width: 400px) {
	.sidebar{
		display:flex;
		flex-direction:column;
		text-align:center;
	}
}
</style>
</head>
<body>
 <!-- Start Hero Section -->
    <div class="hero">
      <div class="container">
        <div class="row justify-content-between">
          <div class="col-lg-5">
            <div class="intro-excerpt">
              <h1>도서검색</h1>
            </div>
          </div>
          <div class="col-lg-7">
            
          </div>
        </div>
      </div>
    </div>
  <!-- End Hero Section -->
  <div style="height: 30px"></div>
  <div class="container">
     <div class="row row1">

            <!— Start Column 1 —>
        <div class="col-lg-2 col-md-2 col-sm-12" style="border-right-style: solid; border-right-color: rgb(231, 234, 238);display: inline-block;float: right;">
				<div class="sidebar">
				  <a href="../book/totalsearch.do">도서검색</a>
				  <a href="../book/search.do">인기도서</a>
				  <a href="../book/categorysearch.do">주제별 도서</a>
             </div>
        </div>
        
        

      <div class="col-lg-10 col-md-10 col-sm-12 content">
        <h3 style="margin-bottom: 0px">상세보기</h3>
        <hr style="margin-bottom: 0px">
        

            <div style="height: 20px"></div>
          
				
				<table id="books">
			          <tr class="warning">
			            <th width="10%" class="text-center">주문번호</th>
			            <th width="10%" class="text-center">제품 이미지</th>
			            <th width="50%" class="text-center">상품명</th>
			            <th width="10%" class="text-center">가격</th>
			            <th width="10%" class="text-center">주문일</th>
			            <th width="10%" class="text-center">비고</th>
			          </tr>
		            <!-- no,title,author,type,publisher,img,TO_CHAR(pub_date,'YYYY-MM-DD') AS dbday, description -->
		        </table>
</body>
</html>