<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.manager.db.*"%>
<%@ page import="java.util.*"%>
<%
List themeList = (List) request.getAttribute("themelist");
%>
<!DOCTYPE html>
<html>
<title>메인페이지</title>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/flickity/1.0.0/flickity.css" />
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap')
	;

#test_btn1 {
	margin-right: -4px;
}

#btn_group button {
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
}
</style>
<style type="text/css">
body, div {
	margin: 0;
	padding: 0;
}

header {
	position: fixed;
	height: 60px;
	width: 100%;
	background: rgb(30, 30, 30)
}

.logo {
	float: fixed;
	top: 0px;
	left: 30px;
	height: 54px;
	margin-left: 200px;
	padding-top: 7px;
}

.container {
	background: rgb(30, 30, 30);
}

.gallery-cell {
	width: 20%;
	margin-right: 1px;
}

.gallery-cell:before {
	display: block;
}

.my_div {
    width: 500px;
    height: 100px;
}
 
.my_bg {
    background-image: url("./images/reservation.jpg");
}
</style>
<head>
<meta charset="UTF-8">
<body>
	<!-- MemnuBar -->
	<header>
		<jsp:include page="/include/menubar.jsp"></jsp:include>
	</header>
	<!-- CONTENTS -->
	<div class="container" style="width: 100%"></div>
	<!-- 첫번째 눈동자 사진띄우기 -->
	<img src="./images/mainpage.PNG" style="width: 100%; height: 750px;"></img>
	<!-- 테마소개부분 띄우기 -->
	<div style="width: 100%; height: 730px; background-color: #000000">
		<!-- 이부분 색깔 바꿔주기 -->
		<div style="display: flex; height: 100%;">
			<div style="width: 15%;"></div>
			<div style="width: 70%; height: 100%; background-color: #000000">
				<!-- 색깔 바꿔주기 -->
				<h2
					style="font-size: 40pt; color: #ffffff; font-family: 'Gowun Dodum', sans-serif; width: 100%; height: 80px; line-height: 80px; margin: 0; padding: 0; background-color: #000000"
					align="center">테 마 소 개</h2>
				<h4
					style="font-size: 15pt; color: #ffffff; font-family: 'Gowun Dodum', sans-serif; width: 100%; height: 30px; line-height: 30px; margin: 0; padding: 0; background-color: #000000"
					align="center">60분 안에 이 방을 탈출해야한다.</h4>
				<div
					style="width: 100%; height: 85%; margin: 0; padding: 0; background-color: #000000">
					<div style="width: 100%; height: 100%">
						<div class="gallery js-flickity"
							style="width: 100%; height: 550px"
							data-flickity-options='{ "wrapAround": false, "contain": true }'>
							<%
							for (int i = 0; i < themeList.size(); i++) {
								ManagerBean tl = (ManagerBean) themeList.get(i);
							%>
							<!-- 테마1 소개 -->
							<div class="gallery-cell"
								style="height: 100%; background-color: #000000">
								<div
									style="width: 100%; height: 30%; padding-top: 30px; background-color: #000000"
									align="center">
									<a href="UserThemeListAction.me?num=<%=tl.getP_NUM()%>"><img
										src="themeupload/<%=tl.getP_FILE()%>" style="height: 90%"></img></a>
								</div>
								<div
									style="width: 100%; height: 70%; color: #ffffff; font-size: 16pt; font-family: 'Gowun Dodum', sans-serif; background-color: #000000"
									align="center">
									<%=tl.getP_NAME()%>
									<hr size="5" style="height: 1%; width: 60%" color="ffcc99">
									<div
										style="font-size: 12pt; padding-top: 23px; font-family: 'Gowun Dodum', sans-serif;">
										<%=tl.getP_PLACE()%>
									</div>
									<br>
									<hr size="5" style="height: 1%; width: 60%" font-family: 'Gowun
										Dodum', sans-serif; color="#ffcc99">
									<div style="font-size: 10pt; padding-top: 8px;">
										<%=tl.getP_PRE()%>
									</div>
									<br> <img src="./images/fire<%=tl.getP_LEVEL()%>.png"
										style="height: 5%"></img>
									<div id="btn_group">
										<a href="UserThemeListAction.me?num=<%=tl.getP_NUM()%>">
											<button id="test_btn1">상세보기</button>
										</a>
									</div>
								</div>
							</div>
							&nbsp;
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
			<div style="width: 15%;"></div>
		</div>
	</div>
	<!-- 예약하기/예약관리 창 띄우기 -->
	<div style="display: flex; width: 100%; height: 100px;">
		<div 
			style="width: 50%; height: 100px; font-family: 'Gowun Dodum', sans-serif; font-size: 30pt; line-height: 100px; background-color: #999999"
			align="center" onclick="location.href='BookDetailAction.boo';">예약확인
		</div>
		<div class="my_div my_bg"
			style="width: 50%; height: 100px; font-family: 'Gowun Dodum', sans-serif; font-size: 30pt; line-height: 100px;"
			align="center" onclick="location.href='BookThemeListAction.ma';">예약하기
		</div>
	</div>
	<!-- 맨 하단 contact부분 -->
	<footer
		style="width: 100%; height: 370px; color: #ffffff; font-family: 'Gowun Dodum', sans-serif; font-size: 30pt; background-color: #000000"
		align="left">
		CONTACT
		<div
			style="width: 100%; line-height: 35pt; color: #ffffff; font-family: 'Gowun Dodum', sans-serif; font-size: 20pt; background-color: #000000"
			align="left">×</div>
		<div
			style="width: 100%; line-height: 25pt; color: #ffffff; font-family: 'Gowun Dodum', sans-serif; font-size: 15pt; background-color: #000000"
			align="left">Beat Phobia</div>
		<div
			style="width: 100%; line-height: 12pt; color: #ffffff; font-family: 'Gowun Dodum', sans-serif; font-size: 15pt; background-color: #000000"
			align="left">
			사업자명 : 정은아 구인영 김소희 이학연 장현주 서지효<br> <br> (T: 1544-9970 / F:
			02-562-2378)<br> <br> 주소 : 서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F,
			3F, 4F, 5F, 6F (06690)<br> <br> 입점문의 및 마케팅제휴 :
			mkt@xphobia.net<br> <br> 채용담당 : recruit@xphobia.net<br>
			<br> 기업담당 : enterprise@xphobia.net
		</div>
		<a href="https://www.instagram.com/eunah_0v0/" style="width: 30px"><img
			src="./images/instar.png" style="width: 30px"></img></a>
	</footer>
	<hr style="margin: 0; padding: 0">
	<div
		style="font-size: 10pt; line-height: 10pt; color: #ffffff; background-color: #000000"
		align="center">Copyrightⓒ 2016 Beat Phobia. All right reserved.</div>
	<script>
		window.open("popup2.html", "popup",
				"width=399, height=420, left=0, top=0")
	</script>

	<script
		src="//cdnjs.cloudflare.com/ajax/libs/flickity/1.0.0/flickity.pkgd.js"></script>
	<!-- flickity-prev-next-button next -->
</body>
</html>