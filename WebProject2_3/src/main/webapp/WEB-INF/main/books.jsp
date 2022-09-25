<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-lg-8">
	<h2 class="heading" style="padding-left: 13px">인기도서</h2>
	<hr style="margin-bottom: 0px">
	
	  <div class="card1" v-for="vo in book_list" style="display: inline-block;">
	    <a :href="'../book/detail.do?no='+vo.no"><img :src="vo.img" align="midde" alt="Random Unsplash image" class="img" style="width: 300px ;height: 420px"/>
	    <h4>{{vo.title}}</h4>
	    <p>{{vo.author}}</p>
	    <p>{{vo.publisher}}</p>
	    </a>
	  </div>  

 
      <div style="height: 20px"></div>
       
</div>

<div>

</div>