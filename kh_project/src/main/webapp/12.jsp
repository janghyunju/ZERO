<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>메인페이지</title>
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

</style>
<head>
<meta charset="UTF-8">
<body>
	<!-- MemnuBar -->
	<header>
		<jsp:include page="include/menubar.jsp"></jsp:include>
		<h1 class="logo">
			<a href="./index.jsp"><img alt="logo" src="images/logo.png"></a>
		</h1>
	</header>
	<!-- CONTENTS -->
	<div class="container" style="width: 100%">
	</div>
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
					/* 색깔바꿔주기 */
					align="center">60분 안에 이 방을 탈출해야한다.</h4>
				<div
					style="width: 100%; height: 85%; margin: 0; padding: 0; background-color: #000000">
					<div style="display: flex; width: 100%; height: 100%">
						<div style="width: 10%; height: 430px; background-color: #000000"></div>
						<div style="width: 20%; height: 430px; background-color: #000000">
							<!-- 테마1 소개 -->
							<div
								style="width: 100%; height: 46%; padding-top: 30px; background-color: #000000"
								align="center">
								<a href="https://www.naver.com"><img
									src="./images/icon1.png" style="width: 65%"></img></a>
							</div>
							<div
								style="width: 100%; height: 50%; color: #ffffff; font-size: 16pt; font-family: 'Gowun Dodum', sans-serif; background-color: #000000"
								align="center">
								그 남자 그 여자
								<hr size="5" style="width: 60%" color="ffcc99">
								<div
									style="font-size: 12pt; padding-top: 30px; font-family: 'Gowun Dodum', sans-serif;">
									최대 5players / SF<br> Phobia 건대점
								</div>
								<br>
								<hr size="5" style="width: 60%" font-family: 'Gowun
									Dodum', sans-serif; color="#ffcc99">
								<div style="font-size: 10pt; padding-top: 8px;">
									내 앞에 나타난<br> 신비로운 그 여자 그 남자
								</div>
								<br> <img src="./images/fire.png" style="width: 30%"></img>
								<div id="btn_group">
									<form action="https://www.naver.com">
										<button id="test_btn1">예약하기</button>
									</form>
								</div>
							</div>
						</div>
						<!-- 테마2 소개 -->
						<div
							style="width: 20%; height: 430px; padding-top: 30px; background-color: #000000"
							align="center">
							<div style="width: 100%; height: 46%; background-color: #000000">
								<a href="./BoardqList.bo"><img src="./images/icon2.png"
									style="width: 65%"></img></a>
							</div>
							<div
								style="width: 100%; height: 50%; color: #ffffff; font-family: 'Gowun Dodum', sans-serif; font-size: 16pt; background-color: #000000">
								전래동 자살사건
								<hr size="5" style="width: 60%" color="#ffcc99">
								<div
									style="font-size: 12pt; padding-top: 30px; font-family: 'Gowun Dodum', sans-serif;">
									최대 3players / 스릴러<br> Phobia 신림점
								</div>
								<br>
								<hr size="5" style="width: 60%" color="#ffcc99">
								<div
									style="font-size: 10pt; padding-top: 8px; font-family: 'Gowun Dodum', sans-serif;">
									그저께 그 사건,<br>과연 자살일까?
								</div>
								<br> <img src="./images/fire2.png" style="width: 40%"></img>
								<div id="btn_group">
									<form action="https://www.naver.com">
										<button id="test_btn1">예약하기</button>
									</form>
								</div>
							</div>

						</div>
						<!-- 테마3 소개 -->
						<div
							style="width: 20%; height: 430px; padding-top: 30px; background-color: #000000"
							align="center">
							<div style="width: 100%; height: 46%; background-color: #000000">
								<a href="https://www.naver.com"><img
									src="./images/icon3.png" style="width: 65%"></img></a>
							</div>
							<div
								style="width: 100%; height: 50%; color: #ffffff; font-family: 'Gowun Dodum', sans-serif; font-size: 16pt; background-color: #000000">
								시간거래소
								<hr size="5" style="width: 60%" color="#ffcc99">
								<div
									style="font-size: 12pt; padding-top: 30px; font-family: 'Gowun Dodum', sans-serif;">
									최대 4players / 판타지<br> Phobia 강남점
								</div>
								<br>
								<hr size="5" style="width: 60%" color="ffcc99">
								<div
									style="font-size: 10pt; padding-top: 8px; font-family: 'Gowun Dodum', sans-serif;">
									시간을 삽니다.<br>당신의 시간은 얼마일까요?
								</div>
								<br> <img src="./images/fire3.png" style="width: 50%"></img>
								<div id="btn_group">
									<form action="https://www.naver.com">
										<button id="test_btn1">예약하기</button>
									</form>
								</div>
							</div>
						</div>
						<!-- 테마4 소개 -->
						<div
							style="width: 20%; height: 430px; padding-top: 30px; background-color: #000000"
							align="center">
							<div style="width: 100%; height: 46%; background-color: #000000">
								<a href="https://www.naver.com"><img
									src="./images/icon4.png" style="width: 65%"></img></a>
							</div>
							<div
								style="width: 100%; height: 50%; color: #ffffff; font-family: 'Gowun Dodum', sans-serif; font-size: 16pt; background-color: #000000">
								시그널 2018
								<hr size="5" style="width: 60%" color="#ffcc99">
								<div
									style="font-size: 12pt; padding-top: 30px; font-family: 'Gowun Dodum', sans-serif;">
									최대 2players / SF<br> Phobia 건대점
								</div>
								<br>
								<hr size="5" style="width: 60%" color="ffcc99">
								<div
									style="font-size: 10pt; padding-top: 8px; font-family: 'Gowun Dodum', sans-serif;">
									-- ---들리세요?<br>과거에서 들려오는 목소리
								</div>
								<br> <img src="./images/fire.png" style="width: 30%"></img>
								<div id="btn_group">
									<form action="https://www.naver.com">
										<button id="test_btn1">예약하기</button>
									</form>
								</div>
							</div>
						</div>
						<div style="width: 10%; height: 430px; background-color: #000000"></div>
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
			align="center">
			<a href="https://www.naver.com">예약확인</a>
		</div>
		<div
			style="width: 50%; height: 100px; font-family: 'Gowun Dodum', sans-serif; font-size: 30pt; line-height: 100px; background-color: #ff6633"
			align="center">
			<a href="https://www.naver.com">예약하기</a>
		</div>
	</div>
	<!-- 맨 하단 contact부분 -->
	<footer
		style="width: 100%; height: 370px; color: #ffffff; font-family: 'Gowun Dodum', sans-serif; font-size: 30pt; background-color: #000000"
		align="left">
		CONTACT
		<div
			style="width: 100%; line-height: 35pt; color: #ffffff; font-family: 'Gowun Dodum', sans-serif; font-size: 15pt; background-color: #000000"
			align="left">×</div>
		<div
			style="width: 100%; line-height: 25pt; color: #ffffff; font-family: 'Gowun Dodum', sans-serif; font-size: 15pt; background-color: #000000"
			align="left">Beat Phobia</div>
		<div
			style="width: 100%; line-height: 12pt; color: #ffffff; font-family: 'Gowun Dodum', sans-serif; font-size: 15pt; background-color: #000000"
			align="left">
			사업자명 : 정은아 구인영 김소희 이학연 장현주 서지효<br> <br> (T: 1544-9970 / F: 02-562-2378)<br>
			<br> 주소 : 서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F (06690)<br> <br> 입점문의 및
			마케팅제휴 : mkt@xphobia.net<br> <br> 채용담당 : recruit@xphobia.net<br>
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
</body>
</html>