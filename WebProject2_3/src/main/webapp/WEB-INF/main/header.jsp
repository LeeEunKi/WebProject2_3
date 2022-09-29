<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- Start Header/Navigation -->
		<nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">
			<div class="container">
				<a class="navbar-brand" href="../main/main.do">다독다독<span>.</span></a>

				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarsFurni">
					<ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
						<li class="nav-item active">
							<a class="nav-link" href="../main/main.do">Home</a>
						</li>
						<li><a class="nav-link" href="../book/search.do">도서 대출</a></li>
						<li><a class="nav-link" href="../study/room_list.do">열람실 예약</a></li>
						<li><a class="nav-link" href="../shop/list.do">중고책 온라인몰</a></li>
						<li><a class="nav-item nav-link" href="../board/list.do">커뮤니티</a></li>
					</ul>

					<ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
						<li><a class="nav-link" href="#"><img src="../images/user.svg"></a></li>
						<li><a class="nav-link" href="../shop/cart_list.do"><img src="../images/cart.svg"></a></li>
					</ul>
				</div>
			</div>
		</nav>
</body>
</html>