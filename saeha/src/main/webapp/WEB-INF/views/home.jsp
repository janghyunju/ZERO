<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>main</title>
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/css/fontAwesome.css">
<link rel="stylesheet" href="resources/css/light-box.css">
<link rel="stylesheet" href="resources/css/owl-carousel.css">
<link rel="stylesheet" href="resources/css/templatemo-style.css">

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<script src="/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<!-- 채팅방 css시작 -->
<style type="text/css">
#center-text {
	display: flex;
	flex: 1;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100%;
}

#chat-circle {
	position: fixed;
	bottom: 50px;
	right: 50px;
	background: #5A5EB9;
	width: 70px;
	height: 70px;
	border-radius: 50%;
	color: white;
	padding: 16px;
	cursor: pointer;
	border : 2px solid white;
	box-shadow: 0px 3px 16px 0px rgba(0, 0, 0, 0.6), 0 3px 1px -2px
		rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
}

.btn#my-btn {
	background: white;
	padding-top: 13px;
	padding-bottom: 12px;
	border-radius: 45px;
	padding-right: 40px;
	padding-left: 40px;
	color: #5865C3;
}

#chat-overlay {
	background: rgba(255, 255, 255, 0.1);
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	border-radius: 50%;
	display: none;
}

.chat-box {
	display: none;
	background: #efefef;
	position: fixed;
	right: 30px;
	bottom: 50px;
	width: 350px;
	max-width: 85vw;
	max-height: 100vh;
	border-radius: 5px;
	/*   box-shadow: 0px 5px 35px 9px #464a92; */
	box-shadow: 0px 5px 35px 9px #ccc;
}

.chat-box-toggle {
	float: right;
	margin-right: 15px;
	cursor: pointer;
}

.chat-box-header {
	background: #5A5EB9;
	/*height: 35px;*/
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	color: white;
	text-align: center;
	font-size: 20px;
	padding-top: 17px;
}

.chat-box-body {
	position: relative;
	height: 370px;
	height: auto;
	border: 1px solid #ccc;
	overflow: hidden;
}

.chat-box-body:after {
	content: "";
	background-image:
		url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMTAgOCkiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+PGNpcmNsZSBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMS4yNSIgY3g9IjE3NiIgY3k9IjEyIiByPSI0Ii8+PHBhdGggZD0iTTIwLjUuNWwyMyAxMW0tMjkgODRsLTMuNzkgMTAuMzc3TTI3LjAzNyAxMzEuNGw1Ljg5OCAyLjIwMy0zLjQ2IDUuOTQ3IDYuMDcyIDIuMzkyLTMuOTMzIDUuNzU4bTEyOC43MzMgMzUuMzdsLjY5My05LjMxNiAxMC4yOTIuMDUyLjQxNi05LjIyMiA5LjI3NC4zMzJNLjUgNDguNXM2LjEzMSA2LjQxMyA2Ljg0NyAxNC44MDVjLjcxNSA4LjM5My0yLjUyIDE0LjgwNi0yLjUyIDE0LjgwNk0xMjQuNTU1IDkwcy03LjQ0NCAwLTEzLjY3IDYuMTkyYy02LjIyNyA2LjE5Mi00LjgzOCAxMi4wMTItNC44MzggMTIuMDEybTIuMjQgNjguNjI2cy00LjAyNi05LjAyNS0xOC4xNDUtOS4wMjUtMTguMTQ1IDUuNy0xOC4xNDUgNS43IiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMS4yNSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIi8+PHBhdGggZD0iTTg1LjcxNiAzNi4xNDZsNS4yNDMtOS41MjFoMTEuMDkzbDUuNDE2IDkuNTIxLTUuNDEgOS4xODVIOTAuOTUzbC01LjIzNy05LjE4NXptNjMuOTA5IDE1LjQ3OWgxMC43NXYxMC43NWgtMTAuNzV6IiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMS4yNSIvPjxjaXJjbGUgZmlsbD0iIzAwMCIgY3g9IjcxLjUiIGN5PSI3LjUiIHI9IjEuNSIvPjxjaXJjbGUgZmlsbD0iIzAwMCIgY3g9IjE3MC41IiBjeT0iOTUuNSIgcj0iMS41Ii8+PGNpcmNsZSBmaWxsPSIjMDAwIiBjeD0iODEuNSIgY3k9IjEzNC41IiByPSIxLjUiLz48Y2lyY2xlIGZpbGw9IiMwMDAiIGN4PSIxMy41IiBjeT0iMjMuNSIgcj0iMS41Ii8+PHBhdGggZmlsbD0iIzAwMCIgZD0iTTkzIDcxaDN2M2gtM3ptMzMgODRoM3YzaC0zem0tODUgMThoM3YzaC0zeiIvPjxwYXRoIGQ9Ik0zOS4zODQgNTEuMTIybDUuNzU4LTQuNDU0IDYuNDUzIDQuMjA1LTIuMjk0IDcuMzYzaC03Ljc5bC0yLjEyNy03LjExNHpNMTMwLjE5NSA0LjAzbDEzLjgzIDUuMDYyLTEwLjA5IDcuMDQ4LTMuNzQtMTIuMTF6bS04MyA5NWwxNC44MyA1LjQyOS0xMC44MiA3LjU1Ny00LjAxLTEyLjk4N3pNNS4yMTMgMTYxLjQ5NWwxMS4zMjggMjAuODk3TDIuMjY1IDE4MGwyLjk0OC0xOC41MDV6IiBzdHJva2U9IiMwMDAiIHN0cm9rZS13aWR0aD0iMS4yNSIvPjxwYXRoIGQ9Ik0xNDkuMDUgMTI3LjQ2OHMtLjUxIDIuMTgzLjk5NSAzLjM2NmMxLjU2IDEuMjI2IDguNjQyLTEuODk1IDMuOTY3LTcuNzg1LTIuMzY3LTIuNDc3LTYuNS0zLjIyNi05LjMzIDAtNS4yMDggNS45MzYgMCAxNy41MSAxMS42MSAxMy43MyAxMi40NTgtNi4yNTcgNS42MzMtMjEuNjU2LTUuMDczLTIyLjY1NC02LjYwMi0uNjA2LTE0LjA0MyAxLjc1Ni0xNi4xNTcgMTAuMjY4LTEuNzE4IDYuOTIgMS41ODQgMTcuMzg3IDEyLjQ1IDIwLjQ3NiAxMC44NjYgMy4wOSAxOS4zMzEtNC4zMSAxOS4zMzEtNC4zMSIgc3Ryb2tlPSIjMDAwIiBzdHJva2Utd2lkdGg9IjEuMjUiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIvPjwvZz48L3N2Zz4=');
	opacity: 0.1;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	height: 100%;
	position: absolute;
	z-index: -1;
}

#chat-input {
	background: #f4f7f9;
	width: 100%;
	position: relative;
	height: 47px;
	padding-top: 10px;
	padding-right: 50px;
	padding-bottom: 10px;
	padding-left: 15px;
	border: none;
	resize: none;
	outline: none;
	border: 1px solid #ccc;
	color: #888;
	border-top: none;
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	overflow: hidden;
}

.chat-input>form {
	margin-bottom: 0;
}

#chat-input::-webkit-input-placeholder { /* Chrome/Opera/Safari */
	color: #ccc;
}

#chat-input::-moz-placeholder { /* Firefox 19+ */
	color: #ccc;
}

#chat-input:-ms-input-placeholder { /* IE 10+ */
	color: #ccc;
}

#chat-input:-moz-placeholder { /* Firefox 18- */
	color: #ccc;
}

.chat-submit {
	position: absolute;
	bottom: 3px;
	right: 10px;
	background: transparent;
	box-shadow: none;
	border: none;
	border-radius: 50%;
	color: #5A5EB9;
	width: 35px;
	height: 35px;
}

.chat-logs {
	padding: 15px;
	height: 370px;
	overflow-y: scroll;
}

.chat-logs::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: #F5F5F5;
}

.chat-logs::-webkit-scrollbar {
	width: 5px;
	background-color: #F5F5F5;
}

.chat-logs::-webkit-scrollbar-thumb {
	background-color: #5A5EB9;
}

@media only screen and (max-width: 500px) {
	.chat-logs {
		height: 40vh;
	}
}

.chat-msg.user>.msg-avatar img {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	float: left;
	width: 15%;
}

.chat-msg.self>.msg-avatar img {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	float: right;
	width: 15%;
}

.cm-msg-text {
	background: white;
	padding: 10px 15px 10px 15px;
	color: #666;
	max-width: 75%;
	float: left;
	margin-left: 10px;
	position: relative;
	margin-bottom: 20px;
	border-radius: 30px;
}

.chat-msg {
	clear: both;
}

.chat-msg.self>.cm-msg-text {
	float: right;
	margin-right: 10px;
	background: #5A5EB9;
	color: white;
}

.cm-msg-button>ul>li {
	list-style: none;
	float: left;
	width: 50%;
}

.cm-msg-button {
	clear: both;
	margin-bottom: 70px;
}
</style>

<!-- 채팅방 css끝 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<body>
		<!-- test용 로그인/마이페이지버튼 -->
		<div><a href="/sae_member/login">로그인</a></div>
		<!-- test용 로그인/마이페이지버튼 -->
		<!-- test용 리뷰게시판 -->
		<div><a href="/sae_goodsboard/list">리뷰게시판</a></div>
		<!-- test용 리뷰게시판 -->
		<!-- test용 리뷰게시판 -->
		<div><a href="/sae_program/program">프로그램 등록</a></div>
		<div><a href="/sae_program/programlist?pg_type=1">프로그램1</a></div>
		<div><a href="/sae_program/programlist?pg_type=2">프로그램2</a></div>
		<!-- test용 리뷰게시판 -->
		<div><a href="/sae_ticket/ticketList">입장권</a></div>
		<div><a href="/sae_faq/faqList">faq</a></div>
		<div><a href="/sae_product/productmain">상품</a></div>
		<div><a href="/sae_coupon/couponregisterView">쿠폰</a></div><br>
		<div><a href="/sae_cart/cartlist">장바구니</a></div>
		<div><a href="/sae_boardn/nlist">공지사항</a></div>
		
	<header class="nav-down responsive-nav hidden-lg hidden-md">
		<button type="button" id="nav-toggle" class="navbar-toggle"
			data-toggle="collapse" data-target="#main-nav">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<!--/.navbar-header-->

		<div id="main-nav" class="collapse navbar-collapse">
			<nav>
				<ul class="nav navbar-nav">
					<li><a href="#top">Home</a></li>
					<li><a href="#featured">Featured</a></li>
					<li><a href="#projects">Recent Projects</a></li>
					<li><a href="#video">Presentation</a></li>
					<li><a href="#blog">Blog Entries</a></li>
					<li><a href="#contact">Contact Us</a></li>
				</ul>
			</nav>
		</div>
	</header>

	<div class="sidebar-navigation hidde-sm hidden-xs">
		<div class="logo">
			<a href="#">Saha<em>mano</em></a>
		</div>
		<nav>
			<ul>
				<li><a href="#top"> <span class="rect"></span> <span
						class="circle"></span> Home
				</a></li>
				<li><a href="#featured"> <span class="rect"></span> <span
						class="circle"></span> Programs
				</a></li>
				<li><a href="#projects"> <span class="rect"></span> <span
						class="circle"></span> Saeha Shop
				</a></li>
				<li><a href="#video"> <span class="rect"></span> <span
						class="circle"></span> Presentation
				</a></li>
				<li><a href="#blog"> <span class="rect"></span> <span
						class="circle"></span> Board Entires
				</a></li>
				<li><a href="#contact"> <span class="rect"></span> <span
						class="circle"></span> Contact Us
				</a></li>
			</ul>
		</nav>
		<ul class="social-icons">
			<li><a href="#"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#"><i class="fa fa-twitter"></i></a></li>
			<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
			<li><a href="#"><i class="fa fa-rss"></i></a></li>
			<li><a href="#"><i class="fa fa-behance"></i></a></li>
		</ul>
	</div>

	<div class="slider">
		<div class="Modern-Slider content-section" id="top">
			<!-- Item -->
			<div class="item item-1">
				<div class="img-fill">
					<div class="image"></div>
					<div class="info">
						<div>
							<h1>
								Beautiful Template<br>Sentra
							</h1>
							<p>
								Sentra is free Bootstrap CSS Template by templatemo website.<br>
								Please share our site link to your friends.
							</p>
							<div class="white-button button">
								<a href="#featured">Discover More</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- // Item -->
			<!-- Item -->
			<div class="item item-2">
				<div class="img-fill">
					<div class="image"></div>
					<div class="info">
						<div>
							<h1>
								Please tell <br>your friends
							</h1>
							<p>
								Support templatemo by sharing a link to your friends. <br>Thank
								you for helping us.
							</p>

							<div class="white-button button">
								<a href="#featured">Share More</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- // Item -->
			<!-- Item -->
			<div class="item item-3">
				<div class="img-fill">
					<div class="image"></div>
					<div class="info">
						<div>
							<h1>
								Suspendisse suscipit<br>nulla sed
							</h1>
							<p>
								Vestibulum ante ipsum primis in faucibus orci luctus et ultrices
								<br>posuere cubilia Curae; Sed at massa turpis.
							</p>

							<div class="white-button button">
								<a href="#featured">Learn More</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- // Item -->
		</div>
	</div>


	<div class="page-content">
		<section id="featured" class="content-section">
			<div class="section-heading">
				<h1>
					Ongoing<br>
					<em>Programs</em>
				</h1>
				<p>
					Praesent pellentesque efficitur magna, <br>sed pellentesque
					neque malesuada vitae.
				</p>
			</div>
			<div class="section-content">
				<div class="owl-carousel owl-theme">
					<%
					for (int i = 0; i < 3; i++) {
					%>
					<div class="item">
						<div class="image">
							<img src="resources/img/program1.jpg" alt="">
							<div class="featured-button button">
								<a href="#projects">Continue Reading</a>
							</div>
						</div>
						<div class="text-content">
							<h4>Lorem ipsum dolor</h4>
							<span>Proin et sapien</span>
							<p>#1 You are allowed to use Sentra Template for your
								business or client websites. You can use it for commercial or
								non-commercial or educational purposes.</p>
						</div>
					</div>
					<div class="item">
						<div class="image">
							<img src="resources/img/program2.jpg" alt="">
							<div class="featured-button button">
								<a href="#projects">Continue Reading</a>
							</div>
						</div>
						<div class="text-content">
							<h4>Phasellus a lacus ac odio</h4>
							<span>Maximus</span>
							<p>
								#2 You are NOT allowed to re-distribute this on any template
								website. You <strong>can post</strong> a screenshot and a link
								back to original template page on your blog or site. Thank you.
							</p>
						</div>
					</div>
					<div class="item">
						<div class="image">
							<img src="resources/img/program3.jpg" alt="">
							<div class="featured-button button">
								<a href="#projects">Continue Reading</a>
							</div>
						</div>
						<div class="text-content">
							<h4>Proin sit amet fringilla</h4>
							<span>Vulputate</span>
							<p>#3 Aliquam mollis lacus eget metus efficitur lobortis.
								Suspendisse libero lacus, accumsan vitae commodo tristique,
								luctus gravida metus.</p>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</section>
		<section id="projects" class="content-section">
			<div class="section-heading">
				<h1>
					Popular<br>
					<em>Products</em>
				</h1>
				<p>
					Praesent pellentesque efficitur magna, <br>sed pellentesque
					neque malesuada vitae.
				</p>
			</div>
			<div class="section-content">
				<div class="masonry">
					<div class="row">
						<div class="item">
							<div class="col-md-8">
								<a href="resources/img/portfolio_big_1.jpg"
									data-lightbox="image"><img src="resources/img/product3.jpg"
									alt="image 1"></a>
							</div>
						</div>
						<div class="item second-item">
							<div class="col-md-4">
								<a href="resources/img/portfolio_big_2.jpg"
									data-lightbox="image"><img src="resources/img/product4.jpg"
									alt="image 2"></a>
							</div>
						</div>
						<div class="item">
							<div class="col-md-4">
								<a href="resources/img/portfolio_big_3.jpg"
									data-lightbox="image"><img src="resources/img/product1.PNG"
									alt="image 3"></a>
							</div>
						</div>
						<div class="item">
							<div class="col-md-4">
								<a href="resources/img/portfolio_big_4.jpg"
									data-lightbox="image"><img src="resources/img/product2.jpg"
									alt="image 4"></a>
							</div>
						</div>
						<div class="item">
							<div class="col-md-8">
								<a href="resources/img/portfolio_big_5.jpg"
									data-lightbox="image"><img
									src="resources/img/portfolio_5.jpg" alt="image 5"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section id="video" class="content-section">
			<div class="row">
				<div class="col-md-12">
					<div class="section-heading">
						<h1>
							The Story of <em>Jami-dang</em> in Gyeongbokgung
						</h1>
						<p>Jamidang is a palace built for bedrooms during the reign of
							King Sejong.</p>
					</div>
					<div class="text-content">
						<p>What traces were found in the 2022 excavation survey of
							Gyeongbokgung Palace Jamidang? Check out the story of building
							sites and blue tiles from the Joseon Dynasty in the video.</p>
					</div>
					<div class="accent-button button">
						<a href="#blog">Continue Reading</a>
					</div>
				</div>
				<div class="col-md-12">
					<div class="box-video">
						<div class="video-container">
							<iframe width="100%" height="520"
								src="https://www.youtube.com/embed/4kcek6eo4tc"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
								allowfullscreen></iframe>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section id="blog" class="content-section">
			<div class="section-heading">
				<h1>
					Board<br>
					<em>Entries</em>
				</h1>
				<p>
					Curabitur hendrerit mauris mollis ipsum vulputate rutrum. <br>Phasellus
					luctus odio eget dui imperdiet.
				</p>
			</div>
			<div class="section-content">
				<div class="tabs-content">
					<div class="wrapper">
						<ul class="tabs clearfix" data-tabgroup="first-tab-group">
							<li><a href="#tab1" class="active">NOTICE</a></li>
							<li><a href="#tab2">FAQ</a></li>
							<li><a href="#tab3"></a></li>
							<li><a href="#tab4"></a></li>
						</ul>
						<section id="first-tab-group" class="tabgroup">
							<div id="tab1">
								<ul>
									<%
									for (int i = 0; i < 6; i++) {
									%>
									<li>
										<div class="item">
											<div class="text-content">
												<h4>Integer ultrices augue</h4>
												<span>25 July 2018</span>
											</div>
										</div>
									</li>
									<%
									}
									%>
								</ul>
							</div>
							<div id="tab2">
								<ul>
									<%
									for (int i = 0; i < 6; i++) {
									%>
									<li>
										<div class="item">
											<div class="text-content">
												<h4>Integer ultrices augue</h4>
												<span>25 July 2018</span>
											</div>
										</div>
									</li>
									<%
									}
									%>

								</ul>
							</div>
							<div id="tab3">
								<ul>
									<li>
										<div class="item">
											<img src="resources/img/blog_2.jpg" alt="">
											<div class="text-content">
												<h4>Cras commodo odio ut</h4>
												<span>26 May 2018</span>
												<p>Nam vel egestas nisi. Nullam lobortis magna at enim
													venenatis luctus. Nam finibus, mauris eu dictum iaculis,
													dolor tortor cursus quam, in volutpat augue lectus sed
													magna. Integer mollis lorem quis ipsum maximus finibus.</p>

												<div class="accent-button button">
													<a href="#contact">Continue Reading</a>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="item">
											<img src="resources/img/blog_1.jpg" alt="">
											<div class="text-content">
												<h4>Lorem ipsum dolor sit</h4>
												<span>22 May 2018</span>
												<p>Nam vel egestas nisi. Nullam lobortis magna at enim
													venenatis luctus. Nam finibus, mauris eu dictum iaculis,
													dolor tortor cursus quam, in volutpat augue lectus sed
													magna. Integer mollis lorem quis ipsum maximus finibus.</p>

												<div class="accent-button button">
													<a href="#contact">Continue Reading</a>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="item">
											<img src="resources/img/blog_3.jpg" alt="">
											<div class="text-content">
												<h4>Integer ultrices augue</h4>
												<span>8 May 2018</span>
												<p>Nam vel egestas nisi. Nullam lobortis magna at enim
													venenatis luctus. Nam finibus, mauris eu dictum iaculis,
													dolor tortor cursus quam, in volutpat augue lectus sed
													magna. Integer mollis lorem quis ipsum maximus finibus.</p>

												<div class="accent-button button">
													<a href="#contact">Continue Reading</a>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<div id="tab4">
								<ul>
									<li>
										<div class="item">
											<img src="resources/img/blog_1.jpg" alt="">
											<div class="text-content">
												<h4>Lorem ipsum dolor sit</h4>
												<span>26 April 2018</span>
												<p>Nam vel egestas nisi. Nullam lobortis magna at enim
													venenatis luctus. Nam finibus, mauris eu dictum iaculis,
													dolor tortor cursus quam, in volutpat augue lectus sed
													magna. Integer mollis lorem quis ipsum maximus finibus.</p>

												<div class="accent-button button">
													<a href="#contact">Continue Reading</a>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="item">
											<img src="resources/img/blog_3.jpg" alt="">
											<div class="text-content">
												<h4>Integer ultrices augue eu</h4>
												<span>24 April 2018</span>
												<p>Nam vel egestas nisi. Nullam lobortis magna at enim
													venenatis luctus. Nam finibus, mauris eu dictum iaculis,
													dolor tortor cursus quam, in volutpat augue lectus sed
													magna. Integer mollis lorem quis ipsum maximus finibus.</p>

												<div class="accent-button button">
													<a href="#contact">Continue Reading</a>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="item">
											<img src="resources/img/blog_2.jpg" alt="">
											<div class="text-content">
												<h4>Cras commodo odio ut</h4>
												<span>20 April 2018</span>
												<p>Nam vel egestas nisi. Nullam lobortis magna at enim
													venenatis luctus. Nam finibus, mauris eu dictum iaculis,
													dolor tortor cursus quam, in volutpat augue lectus sed
													magna. Integer mollis lorem quis ipsum maximus finibus.</p>

												<div class="accent-button button">
													<a href="#contact">Continue Reading</a>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</section>
					</div>
				</div>
			</div>
		</section>


		<section id="chat">
			<div id="chat-circle" class="btn btn-raised">
				<div id="chat-overlay"></div>
				<i class="material-icons">채팅<br>하기</i>
			</div>
			<!-- 채팅 방 -->
			<div class="chat-box">
				<div class="chat-box-header">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;채팅하기 <span
						class="chat-box-toggle"><i class="material-icons">close</i></span>
				</div>
				<div class="chat-box-body">
					<div class="chat-box-overlay"></div>
					<div class="chat-logs"></div>
					<!--chat-log -->
				</div>
				<div class="chat-input">
					<form>
						<input type="text" id="chat-input" placeholder="Send a message..." />
						<button type="submit" class="chat-submit" id="chat-submit">
							<i class="material-icons">send</i>
						</button>
					</form>
				</div>
			</div>

			<script type="text/javascript">
				var wsUri = "ws://localhost:8080/chat-ws";

				websocket = new WebSocket(wsUri);
				websocket.onopen = function(msg) {
					onOpen(msg);
				};
				websocket.onclose = function(evt) {
					onClose(evt)
				};
				websocket.onmessage = function(evt) {
					onMessage(evt)
				};
				websocket.onerror = function(evt) {
					onError(evt)
				};

				function onOpen(msg) {
					writeToScreen("연결완료");

				}

				function onClose(evt) {
					writeToScreen("연결해제");
				}
				function onError(evt) {
					writeToScreen(evt);
				}

				function doSend(message) {
					writeToScreen(message);
					websocket.send(message);
				}

				function writeToScreen(message) {
					console.log(message);
				}

				var INDEX = 0;

				document.querySelector("#chat-submit").addEventListener(
						'click', function(e) {
							e.preventDefault();
							var msg = $("#chat-input").val();
							if (msg.trim() == '') {
								return false;
							}
							generate_message(msg, 'self');

							doSend(msg);

							var buttons = [ {
								name : 'Existing User',
								value : 'existing'
							}, {
								name : 'New User',
								value : 'new'
							} ];

						});

				function onMessage(evt) {
					writeToScreen(evt.data);
					generate_message(evt.data, 'user');
				}

				function generate_message(msg, type) {
					INDEX++;
					var str = "";
					str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg "+type+"\">";
					str += "          <span class=\"msg-avatar\">";
					str += "            <img src=\"resources\/img\/chat1.jpg\">";
					str += "          <\/span>";
					str += "          <div class=\"cm-msg-text\">";
					str += msg;
					str += "          <\/div>";
					str += "        <\/div>";
					$(".chat-logs").append(str);
					$("#cm-msg-" + INDEX).hide().fadeIn(300);
					if (type == 'self') {
						$("#chat-input").val('');
					}
					$(".chat-logs").stop().animate({
						scrollTop : $(".chat-logs")[0].scrollHeight
					}, 1000);
				}

				function generate_button_message(msg, buttons) {
					/* Buttons should be object array 
					  [
					    {
					      name: 'Existing User',
					      value: 'existing'
					    },
					    {
					      name: 'New User',
					      value: 'new'
					    }
					  ]
					 */
					INDEX++;
					var btn_obj = buttons
							.map(
									function(button) {
										return "              <li class=\"button\"><a href=\"javascript:;\" class=\"btn btn-primary chat-btn\" chat-value=\""+button.value+"\">"
												+ button.name + "<\/a><\/li>";
									}).join('');
					var str = "";
					str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg user\">";
					str += "          <span class=\"msg-avatar\">";
					str += "            <img src=\"resources\/img\/chat2.jpg\">";
					str += "          <\/span>";
					str += "          <div class=\"cm-msg-text\">";
					str += msg;
					str += "          <\/div>";
					str += "          <div class=\"cm-msg-button\">";
					str += "            <ul>";
					str += btn_obj;
					str += "            <\/ul>";
					str += "          <\/div>";
					str += "        <\/div>";
					$(".chat-logs").append(str);
					$("#cm-msg-" + INDEX).hide().fadeIn(300);
					$(".chat-logs").stop().animate({
						scrollTop : $(".chat-logs")[0].scrollHeight
					}, 1000);
					$("#chat-input").attr("disabled", true);
				}

				$(document).delegate(".chat-btn", "click", function() {
					var value = $(this).attr("chat-value");
					var name = $(this).html();
					$("#chat-input").attr("disabled", false);
					generate_message(name, 'self');
				});

				$("#chat-circle").click(function() {
					$("#chat-circle").toggle('scale');
					$(".chat-box").toggle('scale');
				});

				$(".chat-box-toggle").click(function() {
					$("#chat-circle").toggle('scale');
					$(".chat-box").toggle('scale');
				});
			</script>
			<!-- 채팅 방 -->
		</section>



		<section class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</section>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="resources/js/vendor/jquery-1.11.2.min.js"><\/script>')
	</script>

	<script src="resources/js/vendor/bootstrap.min.js"></script>
	<script src="resources/js/plugins.js"></script>
	<script src="resources/js/main.js"></script>

	<script>
		// Hide Header on on scroll down
		var didScroll;
		var lastScrollTop = 0;
		var delta = 5;
		var navbarHeight = $('header').outerHeight();

		$(window).scroll(function(event) {
			didScroll = true;
		});

		setInterval(function() {
			if (didScroll) {
				hasScrolled();
				didScroll = false;
			}
		}, 250);

		function hasScrolled() {
			var st = $(this).scrollTop();

			// Make sure they scroll more than delta
			if (Math.abs(lastScrollTop - st) <= delta)
				return;

			// If they scrolled down and are past the navbar, add class .nav-up.
			// This is necessary so you never see what is "behind" the navbar.
			if (st > lastScrollTop && st > navbarHeight) {
				// Scroll Down
				$('header').removeClass('nav-down').addClass('nav-up');
			} else {
				// Scroll Up
				if (st + $(window).height() < $(document).height()) {
					$('header').removeClass('nav-up').addClass('nav-down');
				}
			}

			lastScrollTop = st;
		}
	</script>

</body>
</html>