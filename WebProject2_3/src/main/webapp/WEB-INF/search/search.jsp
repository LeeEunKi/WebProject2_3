<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/search_style.css">
<style type="text/css">
*{
	font-family: 'Noto Sans KR', sans-serif;
}
.subject{
	position: relative;
    color: rgb(103, 114, 148);
    font-size: 18px;
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
   color: #2964D9;
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
    border-top: none;  
    border-bottom: none;
}
.images:hover{
	cursor: pointer;
}

.thumbnail>img {
    margin-right: auto;
    margin-left: auto;
}
a{
	text-decoration: none !important;
}
a:hover{
	text-decoration: underline !important;
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
								<h1>통합검색</h1>
							</div>
						</div>
						<div class="col-lg-7">
							
						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->
     <div class="b-ewha-search-wrap row1">
        <div class="b-search-wrap01">
            <div class="b-search-box01">
                <div class="tablet-hide">
                    <ul>
                        <li class="active"><a href="#a" title="통합검색">통합검색</a></li>
                        <li><a href="#a" title="메뉴검색">도서대출</a></li>
                        <li><a href="#a" title="교내홈페이지">중고서적</a></li>
                        <li><a href="#a" title="전화번호부">열람실예약</a></li>
                        <li><a href="#a" title="교직원">자유게시판</a></li>
                        <li><a href="#a" title="공지사항">공지사항</a></li>
                    </ul>
                </div>
                <div class="tablet-show">
                    <label for="category-op">바로가기</label>
                    <select class="sel-category" id="category-op">
                        <option selected="selected" value="#n">통합검색</option>
                        <option value="#n">중고서적</option>
                        <option value="#n">열람실예약</option>
                        <option value="#n">자유게시판</option>
                        <option value="#n">공지사항</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="b-search-wrap02">
            <div class="b-search-box02">
                <form action="" method="">
                    <fieldset>
                        <legend title="통합검색" class="hide">통합 검색</legend>
                        <div class="top-box">
                            <div class="b-search-input-box">
                                <label class="hide" for="sch-word-rules">검색어 입력</label>
                                <input type="text" id="sch-word-rules" placeholder="Search keywords" :value="ss" :v-model="ss">
                                <button type="button" value="검색" class="sch-btn"><span>검색</span></button>
                                <!-- 검색박스 -->
                                <div class="b-search-auto-box" style="display: none;">
                                    <ul>
                                        <li><a href="#a"></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="b-search-side-box">
                                <div class="b-option-box">
                                    <a href="#a" title="검색옵션">필터</a>
                                    <ul>
                                        <li class="active"><a href="#a">표시</a></li>
                                        <li><a href="#a">숨김</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div class="b-search-box03">
                <div class="left-box">
                    <!-- 추천 검색어 -->
                    <div class="b-box recomand">
                        <h4>
                            추천 검색어
                        </h4>
                        <ul class="b-recomand-ul">
                            <li><a href="#a">등록금</a></li>
                            <li><a href="#a">캠퍼스</a></li>
                            <li><a href="#a">학생증</a></li>
                            <li><a href="#a">개강</a></li>
                            <li><a href="#a">장학</a></li>
                            <li><a href="#a">입학</a></li>
                        </ul>
                    </div>

                   <!-- 검색 결과 건수 -->
                    <div class="b-box">
                        <p class="b-result">
                            <span>{{ss }}</span>에 대한 검색결과는 총 <span>{{count}}</span>건입니다.
                        </p>
                    </div>
                    <!-- 메뉴 검색 -->
                    <div class="b-box">
                        <ul class="b-sch-ul-type01">
                            <li>
                              <table class="table" style="background-color: white;">
                               <tr v-for="vo in book_list">
                                 <td>
	                               <table class="table">
		                                <tr>
		                                  <td rowspan="6"><img :src="vo.img" style="width: 105px; height: 150px;"></td>
		                                </tr>
		                                <tr>
		                                  <td colspan="2" ><span style="font-size: 20px; font-weight: bold;">{{vo.title}}</span></td>
		                                </tr>
		                                <tr>
		                                  <th>저자:</th>
		                                  <td>{{vo.author}}</td>
		                                </tr>
		                                <tr>
		                                  <th>분류:</th>
		                                  <td>{{vo.type}}</td>
		                                </tr>
		                                <tr>
		                                  <th>출판사:</th>
		                                  <td>{{vo.publisher}}</td>
		                                </tr>
		                                <tr>
		                                 <td colspan="2" style="text-align: -webkit-right;">
		                                   <a class="btn" style="inline-size: fit-content; display:inline; ">도서대출</a>
		                                   <a class="btn" style="inline-size: fit-content; display:inline; ">중고책구매</a>
		                                 </td>
		                                </tr>
	                               </table>
                                 </td>
                               </tr>
                              </table>
                            </li>
                        </ul>
                        <div class="text-center">
                          <ul class="pagination">
							  <li><a href="#">1</a></li>
							  <li><a href="#">2</a></li>
							  <li><a href="#">3</a></li>
							  <li class="disabled"><a href="#">4</a></li>
							  <li><a href="#">5</a></li>
						   </ul>
                        </div>
                    </div>
    
                    <!-- 관련 영화  -->
                    <div class="b-box">
                        <h4>관련 영화</h4>
                          <table class="table">
                                <tr>
                                  <td>{{curPage}}</td>
                                </tr>
                                <tr>
                                  <td>{{totalPage}}</td>
                                </tr>
                                <tr>
                                  <td>{{ss}}</td>
                                </tr>
                          </table>
                    </div>

                    <div class="b-box">
                        <div class="b-no-result">
                            <div><img src="#" alt="" ></div>
                            <div>
                                <P class="b-result-tit"><span>{{ss}}</span>에 대한 상세 검색결과가 없습니다.</P>
                                <ul>
                                    <li>단어의 철자가 정확한지 확인해 주시기 바랍니다.</li>
                                    <li>검색어의 단어 수를 줄이거나, 다른 검색어(유사어)로 검색해 보시기 바랍니다.</li>
                                    <li>일반적으로 많이 사용하는 검색어로 다시 검색해 주시기 바랍니다.</li>
                                </ul>
                                <p>검색처리가 <span>대기중</span> 혹은 <span>업데이트</span> 메시지가 뜨면 <span>잠시 후 다시 검색</span>해 보시기 바랍니다. <br>
                                    불편하신 점이나 좋은 의견이 있으면 홈페이지 오류신고 게시판에 의견을 남겨주세요.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  <!-- js -->  
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script  src="../css/search_script.js"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
  <script type="text/javascript">
  new Vue({
	  el:'.row1',
	  data:{
		curPage:1,
		totalPage:0,
		book_list:[],
  		ss:'${ss}',
  		str:'${strArr}',
  		count:0,
  		startPage:0,
  		endPage:0
	  },
	  mounted:function(){		 
		  this.search(this.ss,this.str);
	  },
	  methods:{
		  search:function(ss,str){
			  axios.get("http://localhost:8080/web/search/search_vue.do",{
				  params:{
					  page:this.curPage,
					  ss:ss,
					  str:str
				  }
	 		  }).then(result=>{
				  this.book_list=result.data;
				  this.curPage=result.data[0].curPage;
				  this.totalPage=result.data[0].totalPage;
				  this.ss=result.data[0].ss;
				  this.str=result.data[0].str;
				  this.count=result.data[0].count;
				  this.startPage=result.data[0].startPage;
				  this.endPage=result.data[0].endPage;
				  console.log(this.book_list);
			  })
		  }
	  }
  })
  </script>
</body>
</html>