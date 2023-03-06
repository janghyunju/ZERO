<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>오시는 길</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap')
	;
</style>
<style type="text/css">
div, img, br, hr {
	margin: 0;
	padding: 0;
}

header {
	position: fixed;
	height: 60px;
	width: 100%;
	background: rgb(30, 30, 30)
}

.container {
	background: rgb(30, 30, 30);
}

.layout {
	margin-top: 40px;
	margin-bottom: 30px;
	margin-left: 300px;
	margin-right: 300px;
	padding-top: 50px;
	padding-bottom: 100px;
	padding-right: 100px;
	padding-left: 100px;
	background-color: rgb(60, 60, 60);
}

.list {
	padding: 20px;
	background: #fff
}
</style>
</head>
<body>
	<header>
		<jsp:include page="./include/menubar.jsp"></jsp:include>
	</header>
	<!-- 메인베너 -->
	<div class="bnr">
		<img alt="bnr" src="images/bnr.jpg" style="width: 100%">
		<hr size="5" color="darkorange">
	</div>
	<!-- 지도를 표시할 div 입니다 -->
	<div
		style="font-size: 35pt; color: #ffffff; font-family: 'Gowun Dodum', sans-serif; background-color: #000000"
		align="center">오시는 길</div>
	<div
		style="font-size: 10pt; color: #ffffff; font-family: 'Gowun Dodum', sans-serif; background-color: #000000"
		align="center">KH방탈출로 오시는 길입니다.</div>
	<div style="display: flex">
		<div style="width: 10%; height: 500px; background-color: #000000"></div>
		<div id="map"
			style="width: 80%; height: 500px; background-color: #000000"></div>
		<div style="width: 10%; height: 500px; background-color: #000000"></div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a32bb90a89df26c4733aa74983543e53"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.499, 127.0329), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(37.499, 127.0329);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		var iwContent = '<div style="padding:5px;">KH방탈출 <br><a href="https://map.kakao.com/link/map/KH방탈출,37.499, 127.0329" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/KH방탈출,37.499, 127.0329" style="color:blue" target="_blank">길찾기</a></div>', 
		// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		iwPosition = new kakao.maps.LatLng(37.499, 127.0329); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			position : iwPosition,
			content : iwContent
		});

		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker);
	</script>
	<!-- 오시는 방법 -->
	<div style="display: flex">
		<div style="width: 10%; height: 350px; background-color: #000000"></div>
		<div
			style="width: 80%; height: 350px; background-color: #000000; font-size: 18pt; font-family: 'Gowun Dodum', sans-serif"
			align="left">
			<div style="display: flex">
				<div
					style="width: 50%; height: 350px; font-size: 25pt; color: #ffffff; background-color: #000000"
					align="center">
					<br>오시는 방법<br> <br>
					<div style="background-color: #000000; font-size: 16pt">
						버스 : 역삼역 포스코P&S타워 정류장<br> <img src="./images/bluebus.png"
							style="width: 4%"></img> 146 / 740 / 341 / 360 <br> <img
							src="./images/redbus.png" style="width: 4%"></img> 1100 / 1700 /
						2000 / 7007 / 8001<br> <br> 지하철 : 지하철 2호선 역삼역 3번출구 100m
					</div>
				</div>
				<div
					style="width: 50%; height: 350px; color: #ffffff; font-size: 25pt; background-color: #000000"
					align="center">
					<br>주소 및 전화번호<br> <br>
					<div style="background-color: #000000; font-size: 16pt;">
						주소 : 서울특별시 강남구 테헤란로<br> 14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F <br>
						<br>(T: 1544-9970 / F: 02-562-2378)
					</div>
				</div>
			</div>
		</div>
		<div style="width: 10%; height: 350px; background-color: #000000"></div>
	</div>
	<div
		style="font-size: 35pt; font-family: 'Gowun Dodum', sans-serif; color: #ffffff; background-color: #000000"
		align="center">매장안내</div>
	<div style="display: flex">
		<div style="width: 10%; height: 850px; background-color: #000000"></div>
		<div style="width: 40%; height: 850px; background-color: #999999">
			<div style="width: 100%; height: 425px; background-color: #000000">
				<img src="./images/map_1.png"
					style="width: 60%; padding-left: 130px; padding-top: 40px"></img>
				<div
					style="width: 100%; font-size: 20pt; font-family: 'Gowun Dodum', sans-serif; color: #ffffff;"
					align="center">
					<br>&lt;그 남자 그 여자&gt;
				</div>
			</div>
			<div style="width: 100%; height: 425px; background-color: #000000">
				<img src="./images/흰둥이.jpg"
					style="width: 60%; padding-left: 130px; padding-top: 40px"></img>
				<div
					style="width: 100%; font-size: 20pt; font-family: 'Gowun Dodum', sans-serif; color: #ffffff;"
					align="center">
					<br>&lt;흰둥이&gt;
				</div>
			</div>
		</div>
		<div style="width: 40%; height: 850px; background-color: #000000">
			<div style="width: 100%; height: 425px; background-color: #000000">
				<img src="./images/map_3.png"
					style="width: 60%; padding-left: 130px; padding-top: 40px"></img>
				<div
					style="width: 100%; font-size: 20pt; font-family: 'Gowun Dodum', sans-serif; color: #ffffff;"
					align="center">
					<br>&lt;시간거래소&gt;
				</div>
			</div>
			<div style="width: 100%; height: 425px; background-color: #000000">
				<img src="./images/map_4.png"
					style="width: 60%; padding-left: 130px; padding-top: 40px"></img>
				<div
					style="width: 100%; font-size: 20pt; font-family: 'Gowun Dodum', sans-serif; color: #ffffff;"
					align="center">
					<br>&lt;시그널 2018&gt;<br>
				</div>
			</div>
		</div>
		<div style="width: 10%; height: 850px; background-color: #000000"></div>
	</div>
	</div>
</body>
</html>