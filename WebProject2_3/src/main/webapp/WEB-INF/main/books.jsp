<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<div class="container">
				<div class="row mb-5">
					<div class="col-md-6">
						<h2 class="section-title">히트 도서</h2>
					</div>
					<!-- <div class="col-md-6 text-start text-md-end">
						<a href="#" class="more">View All Posts</a>
					</div> -->
				</div>

				<div class="row">
				<c:forEach var="bhvo" items="${bhlist} }">
					<div class="col-12 col-sm-6 col-md-3 mb-3 mb-md-0">
						<div class="post-entry">
							<a href="../book/detail.do?no=${bhvo.no }" class="post-thumbnail"><img src="${bhvo.img }" alt="Image" class="img-fluid"></a>
							<div class="post-content-entry">
								<h3><a href="#">${bhvo.title }</a></h3>
								<div class="meta">
									<span>저자 <a href="../book/detail.do?no=${bhvo.no }">${bhvo.author }</a></span> <span>대출횟수: <a href="../book/detail.do?no=${bhvo.no }">${bhvo.hit }</a></span>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
</div>