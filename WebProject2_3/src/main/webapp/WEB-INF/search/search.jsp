<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
td{
	
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
                        <li class="active"><a title="바로가기">바로가기</a></li>
                        <li><a href="../book/search.do" title="도서대출">도서대출</a></li>
                        <li><a href="../shop/list.do" title="중고서적">중고서적</a></li>
                        <li><a href="../study/room_list.do" title="열람실예약">열람실예약</a></li>
                        <li><a href="../board/list.do" title="자유게시판">자유게시판</a></li>
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
                    <fieldset>
                        <legend title="통합검색" class="hide">통합 검색</legend>
                        <div class="top-box">
                            <div class="b-search-input-box">
                              <div class="chk_box" style="display:inline; ">
							    <input style="width: fit-content;" type="checkbox" id="ch_1" name="checked" value="T" checked="checked">도서명
							    <input style="width: fit-content;" type="checkbox" id="ch_1" name="checked" value="A">저자명
							    <input style="width: fit-content;" type="checkbox" id="ch_3" name="checked" value="G">장르
                              </div>
                                <label class="hide" for="sch-word-rules">검색어 입력</label>
                                <input style="inline-size: min-content; width: 420px;" type="text" id="sch-word-rules" placeholder="Search keywords" :value="result_ss" v-model="ss" ref="ss">
                                <button type="button" value="검색" class="sch-btn" v-on:click="search()"><span style="color: white;">검색</span></button>
                                <!-- 검색박스 -->
                                <div class="b-search-auto-box" style="display: none;">
                                    <ul>
                                        <li><a href="#a"></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </fieldset>
            </div>
             <div class="b-search-box03">
                <div class="left-box">

                   <!-- 검색 결과 건수 -->
                    <div class="b-box">
                        <p class="b-result">
                            <span>{{result_ss }}</span>에 대한 검색결과는 총 <span>{{count}}</span>건입니다. 
                        </p>
                    </div>
                    <!-- 메뉴 검색 -->
                    <div class="b-box" v-show="isShow">
                        <ul class="b-sch-ul-type01">
                            <li>
                              <table class="table" style="background-color: white; width: 760px;">
                               <tr v-for="vo in book_list">
                                 <td>
	                               <table class="table">
		                                <tr>
		                                  <td rowspan="6" width="20%"><img :src="vo.img" style="width:100%;"></td>
		                                </tr>
		                                <tr>
		                                  <td colspan="2" width="80%"><span style="font-size: 20px; font-weight: bold;">{{vo.title}}</span></td>
		                                </tr>
		                                <tr>
		                                  <th width="8%">저자:</th>
		                                  <td>{{vo.author}} </td>
		                                </tr>
		                                <tr>
		                                  <th width="8%">분류:</th>
		                                  <td>{{vo.type}}</td>
		                                </tr>
		                                <tr>
		                                  <th width="15%">출판사:</th>
		                                  <td>{{vo.publisher}}</td>
		                                </tr>
		                                <tr>
		                                 <td colspan="2" style="text-align: -webkit-right;">
		                                   <a :href="'../book/detail.do?no='+vo.no" class="btn" style="inline-size: fit-content; display:inline; ">도서대출</a>
		                                   <a :href="'../shop/detail.do?no='+vo.shop_no+'&page=1'" class="btn" style="inline-size: fit-content; display:inline; ">중고책구매</a>
		                                 </td>
		                                </tr>
	                               </table>
                                 </td>
                               </tr>
                              </table>
                            </li>
                        </ul>
                        <div class="row">
                          <div class="text-center">
                            <button class="btn move-btn" v-on:click="prev()">이전</button> {{curPage}} page/ {{totalPage}} pages <button class="btn move-btn" v-on:click="next()">다음</button>
                          </div>
                        </div>
                    </div>
    
                    <div class="b-box" v-show="noCountShow">
                        <div class="b-no-result">
                            <div><img src="#" alt="" ></div>
                            <div>
                                <P class="b-result-tit"><span>{{result_ss}}</span>에 대한 상세 검색결과가 없습니다.</P>
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
                <div class="right-box">
                    <div class="b-box">
                        <h4>
                        	    관련 영화 목록
                        </h4>
                        <div class="b-word-box active">
                            <ul>
                                <li v-for="mvo in movie_list">
                                  <table>
                                    <tr>
                                      <td rowspan="4" width="30%">
                                        <img :src="mvo.image" style="width: 110px; height: 150px;">
                                      </td>
                                      <td width="70%"><a :href="mvo.link" target="_blank" v-html="mvo.title"></a></td>
                                    </tr>
                                    <tr>
                                      <td width="70%">{{mvo.actor}}</td>
                                    </tr>
                                    <tr>
                                      <td width="70%">{{mvo.director}}</td>
                                    </tr>
                                    <tr>
                                      <td width="70%">
                                      <span style="color: orange;">
                                        {{mvo.userRating}}
                                      </span>
                                      </td>
                                    </tr>
                                  </table>
                                </li>
                            </ul>
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
  $(function(){
	  $('.move-btn').click(function(){
		  $('html, body').scrollTop(300);
	  })
  })
  new Vue({
	  el:'.row1',
	  data:{
		curPage:1,
		totalPage:0,
		book_list:[],
		movie_list:[],
  		ss:'',
  		result_ss:'${ss}',
  		str:'${strArr}',
  		count:0,
  		startPage:0,
  		endPage:0,
  		noCountShow:false,
  		isShow:true
	  },
	  mounted:function(){	
		  let ss='${ss}';
		  this.send(ss);
	  },
	  methods:{
		  send:function(ss){
			  this.movieFind(ss);
			  axios.get("http://localhost:8080/web/search/search_vue.do",{
				  params:{
					  page:this.curPage,
 					  ss:ss,
					  str:this.str
				  }
	 		  }).then(result=>{
				  this.book_list=result.data;
				  this.curPage=result.data[0].curPage;
				  this.totalPage=result.data[0].totalPage;
 				  this.result_ss=result.data[0].ss;
				 /* this.str=result.data[0].str; */
				  this.count=result.data[0].count;
				  if(this.count==0){
					  this.isShow=false;
					  this.noCountShow=true;
				  }
				  else{
					  this.isShow=true;
					  this.noCountShow=false;
				  }
				  console.log(this.book_list);
			  })
		  },
		  search:function(){
			  if(this.ss==""){
				  alert("검색어를 입력하세요!");
				  this.$refs.ss.focus();
				  return;
			  }
			  this.curPage=1;
			  this.send(this.ss);
		  },
		  movieFind:function(ss){
			  axios.get("http://localhost:8080/web/search/search_moive_vue.do",{
				  params:{
 					  ss:ss,
				  }
			  }).then(result=>{
				  this.movie_list=result.data;
				  console.log(this.movie_list);
			  })
		  },
		  prev:function(){
			  this.curPage=this.curPage>1?this.curPage-1:this.curPage;
			  this.send(this.result_ss);
		  },
		  next:function(){
			  this.curPage=this.curPage<this.totalPage?this.curPage+1:this.curPage;
			  this.send(this.result_ss);
		  }
	  }
  })
  </script>
</body>
</html>