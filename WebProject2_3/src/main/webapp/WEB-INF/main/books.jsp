<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<div class="container">
				<div class="row mb-5" style="padding-left: 24px;margin-bottom: 28px !important;">
					<div class="col-md-6">
						<h2 class="font-weight-bold heading text-primary mb-4 mb-md-0">히트 도서</h2>
						<p class="sub-title">회원분들이 가장 많이 빌려간 바로 그 책</p>
					</div>
					<!-- <div class="col-md-6 text-start text-md-end">
						<a href="#" class="more">View All Posts</a>
					</div> -->
				</div>

				<div class="row">
				<c:forEach var="bhvo" items="${bhlist }">
					<div class="col-12 col-sm-6 col-md-3 mb-3 mb-md-0">
						<div class="post-entry text-center">
							<a href="../book/detail.do?no=${bhvo.no }" class="post-thumbnail"><img src="${bhvo.img }" alt="Image" class="img-fluid"></a>
							<div class="post-content-entry" style="padding-left: 45px;padding-right: 45px;">
								<h3><a href="#">${bhvo.title }</a></h3>
								<div class="meta">
									<span>저자 <a href="../book/detail.do?no=${bhvo.no }">${bhvo.author }</a></span> 
									<br>
									<span>대출횟수: <a href="../book/detail.do?no=${bhvo.no }">${bhvo.hit }</a></span>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
</div>