<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.member.db.*"%>
<%
	MemberBean member = (MemberBean) request.getAttribute("member");
	int count = (int) request.getAttribute("count");
%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body, div {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
}

header {
	position: fixed;
	height: 60px;
	width: 100%;
	background: #111;
}

}
td {
	text-align: center;
}

span {
	font-size: 13;
}

.container {
	background: #111;
}

.textbox {
	background-color: #fff;
	color: black;
	padding: 30px;
	margin-bottom: 30px;
}

table {align ="center";
	border-style: solid;
	border-color: #df723d
}
</style>

<meta charset="UTF-8">
<title>내 정보 보기</title>
</head>
<body>
	<header>
		<jsp:include page="../include/menubar.jsp"></jsp:include>
	</header>

	<div class="container">
		<div class="bnr">
			<img alt="bnr" src="./images/mypage_bg.jpg" style="width: 100%">
			<hr size="5" color="#df723d">
		</div>

		<div style="display: flex; height: 100%;">
			<div style="width: 20%; height: 100%;"></div>
			<div style="width: 60%; height: 100%;">
				<div style="height: 50px;"></div>
				<br>
				<div
					style="background-color: rgb(55, 55, 55); padding: 30px; padding-left: 50px; padding-right: 50px;">
					<h3 style="color: #fff">MY PAGE</h3>
					<div style="width: 100%; height: 4px; background-color: #df723d"></div>

					<div class="textbox">
						<div align="center">
							<table style="width: 100%; border-color: #df723d">
								<tr>
									<td rowspan="2" align="center">
										<h5>
											<b>고객정보</b>
										</h5> <img src="./images/memberimg.png" width="50%">
										<p style="color: #df723d; font-size: 16px;">[ BEAT PHOBIAN
											]</p>
										<p><%=member.getKH_NAME()%><span>님</span>
										</p>
									</td>
									<td colspan="2" align="center" style="font-style: bolder">
										. 회원명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=member.getKH_NAME()%><span>님</span>
									</td>
									<td colspan="2" align="center">.
										이용횟수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=count%> 회
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center">.
										전화번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=member.getKH_TEL()%></td>
									<td colspan="2" align="center">. 쿠
										폰&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 개</td>
								</tr>
							</table>
						</div>
						<br> <br>
						<h4>Quick Link</h4>
						<hr>
						<div align="center">
							<table border="1" style="width: 100%; height: 200px">
								<tr align="center">
									<td align="center"
										onmouseover="this.style.background='lightgray'"
										onmouseout="this.style.background='white'">
										<div onclick="location.href='./MemberModifyView.me';"> 
											<img src="./images/profile.png" style="height: 5%" />
											<h6>
												PROFILE<br> 회원정보변경
											</h6>

											<div style="font-size: 1px; color: gray">
												회원님의 정보를 확인하고<br> 변경할 수 있습니다.
											</div>
										</div>
									</td>
									<td align="center"
										onmouseover="this.style.background='lightgray'"
										onmouseout="this.style.background='white'">
										<div onclick="location.href='#';">
											<img src="./images/order.png" style="height: 15%" />
											<h6>
												ORDER<br> 예약내역조회
											</h6>

											<div style="font-size: 1px; color: gray">
												회원님의 퀘스트 예약 내역을<br> 조회할 수 있습니다.
											</div>
										</div>
									</td>
									<td align="center"
										onmouseover="this.style.background='lightgray'"
										onmouseout="this.style.background='white'">
										<div onclick="location.href='#';">
											<img src="./images/quest.png" style="height: 15%" />
											<h6>
												QnA<br> 나의 문의 내역
											</h6>

											<div style="font-size: 1px; color: gray">
												나의 문의 내역을 확인하고<br> 답을 확인할 수 있습니다.
											</div>
										</div>
									</td>
									<td align="center"
										onmouseover="this.style.background='lightgray'"
										onmouseout="this.style.background='white'">
										<div onclick="location.href='#';">
											<img src="./images/coupon.png" style="height: 15%" />
											<h6>
												COUPON<br> 쿠폰
											</h6>
											<div style="font-size: 1px; color: gray">
												쿠폰 확인학고, 그 내역을<br> 조회할 수 있습니다.
											</div>
										</div>
									</td>
								</tr>
							</table>
						</div>

						<br> <br> <br>
						<div align="center">
							<button onclick="Confirm();">
								회원탈퇴
							</button>
		<script type="text/javascript">
		function Confirm() {
			const confirm = window.confirm('탈퇴하시겠습니까?');
			if (confirm == true)
				location.href = 'MemberDeleteAction.me';
		}
								</script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="width: 100%; height: 50px; background-color: #111"></div>

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