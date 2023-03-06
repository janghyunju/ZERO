<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="net.book.db.*"%>
<% 
   String id=(String)session.getAttribute("id");
   	List bookList = (List)request.getAttribute("booklist");
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약확인페이지</title>
<style type="text/css">
body, div {
	margin: 0;
	padding: 0;
}

header {
	position: fixed;
	height: 60px;
	width: 100%;
	background: #111;
}

.container {
	background: #111;
}

h2 {
	color: #fff
}

.textbox {
	background-color: #fff;
	color: black;
	padding: 30px;
	margin-bottom: 30px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../include/menubar.jsp"></jsp:include>
	</header>

	<div class="container">
		<div class="bnr">
			<img alt="bnr" src="./images/reser_confirm_bg.jpg" style="width: 100%;">
			<hr size="5" color="#df723d">
		</div>

		<div style="display: flex; height: 100%;">
			<div style="width: 20%; height: 100%;"></div>
			<div style="width: 60%; height: 100%;">

				<div style="height: 50px; margin-top: 50px;">
					<table style="width: 100%">
						<tr style="color: white;">
							<td
								style="width: 33.33%; background-color: #636363; padding: 15px;">&nbsp;
								step.01 예약하기</td>
							<td
								style="width: 33.33%; background-color: #636363; padding: 15px;">&nbsp;
								step.02 결제하기</td>
							<td
								style="width: 33.33%; background-color: #df723d; padding: 15px;">&nbsp;
								step.03 예약완료</td>
						</tr>
					</table>
				</div>

				<br>
				<div style="background-color: rgb(55, 55, 55); padding: 30px;">
					<h2>예약현황</h2>
					<%	if(id != null){ %>
					<div class="textbox">
						<b><%=id%>님의 예약내역입니다.</b> <br> <br>

<table>
						<% for(int i=0; i < bookList.size(); i++) {
								BookBean  bl = (BookBean)bookList.get(i);   %>
	<tr>
		<th>[<%=bl.getB_PRODUCT() %>] </th>
		<td><%=bl.getB_DATE()%></td>
		<td><%=bl.getB_TIME() %></td>
		<td><%=bl.getB_INWON() %>명</td>
			<td>&nbsp;&nbsp;</td>
		<th> 예약확정 </th>
		<td>&nbsp;&nbsp;</td>
		<td><button onclick="Confirm();">예약취소</button></td>
		<script type="text/javascript">
		function Confirm(){
		const confirm = window.confirm('예약을 취소하시겠습니까?');
		if(confirm == true)
			location.href='DeleteBook.boo?num='+<%=bl.getB_NUM()%>;
		}
		</script>

	</tr>
		<% } %>
</table>
						<% } else { %>
						<div class="textbox">
							<b>예약 내역이 없습니다.</b> <br> <br>
							<% }  %>
						</div>
						<h2>취소안내</h2>
						<div class="textbox">
							<p style="color: red">
								<b><strong>※ 예약한 게임 시작 한시간 전까지 연락이 되지 않는 경우에는 예약이
										취소 될 수 있습니다.</strong></b>
							</p>
							<p>1.결제 변경 및 취소는 예약한 게임 시작 시간 24시간 이전에만 가능합니다.</p>
							<p>2.게임 시작시간이 지나 도착하거나, 나타나지 않으면 게임에 참여할 수 없고 환불 또한 불가 합니다.</p>
							<p>3.19세이상 게임의 경우 신분증 제시를 요청할 수 있습니다.</p>
							<p>4.과도한 음주자는 게임전 음주 측정을 실시하여 혈중 알코올 농도 0.1% 이상인 경우 입장이 제한 될
								수 있습니다.</p>
							<p>5.공간이 폐쇄되어 갇히거나 신체가 구속될 수 있으므로 해당 사항에 거부감이 있거나 질환이 있으신 분은
								참가가 어렵습니다.</p>
							<p>6.Quest에서 경험한 퀴즈나 퍼즐등 세부적인 내용을 발설하는 경우에는 스포일러 금지 조항에 의해
								입장제한 대상이 될 수 있습니다.</p>
							<p>7.당일 예약은 신용카드, 체크카드만 가능합니다. 다른 결제 수단은 지점을 내방 하셔야 합니다.</p>
						</div>
						<font color="#fff">예약취소하시겠습니까?</font>
					</div>

					<div style="width: 20%;"></div>
				</div>
			</div>
			<div style="width: 100%; height: 50px; background-color: #111"></div>
		</div>
		</div>
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
</body>
</html>