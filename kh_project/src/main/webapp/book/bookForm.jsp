<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.manager.db.*"%>
<%@ page import="java.util.*"%>
<%
String id = (String) session.getAttribute("id");
List themeList = (List) request.getAttribute("themelist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<style type="text/css">
body, div {
	margin: 0;
	padding: 0;
	color: #fff;
}

div {
	display: block;
}

header {
	position: fixed;
	height: 60px;
	width: 100%;
	background: #111;
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
	background: #111;
}
div:hover { background-color: '#df723d'; }
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat: 'yy-mm-dd'
		});
	});
	function dateChange(){
		var value = document.getElementById("datepicker");
		var date = document.getElementById("B_DATE");
		date.value = value.value;
	}

	function onChange() {
		var  inwon =document.querySelector('input[name="inwon"]:checked').value;
		var span = document.getElementById("pay");
		span.innerHTML = inwon * 20000;
	}
	function addBook() {
		book.submit();
	}
	
function valueChange(){
		var pnum =document.querySelector('input[name="product"]:checked').value;
		var p1 = document.getElementById("B_PNUM");
		var time =document.querySelector('input[name="time"]:checked').value;
		var p2 = document.getElementById("B_TIME");
		var inwon =document.querySelector('input[name="inwon"]:checked').value;
		var p3 = document.getElementById("B_INWON");
		
		p1.value = pnum;
		p2.value = time;
		p3.value = inwon;		
	}
	
	function displayTest(){
		var a = document.getElementById("pp");
		if(a.style.display == "none"){
			a.style.display = "block";
		}
}
	function displayTest1(){
		var a = document.getElementById("tt");
		if(a.style.display == "none"){
			a.style.display = "block";
		}
}

	function displayTest2(){
		var a = document.getElementById("ii");
		if(a.style.display == "none"){
			a.style.display = "block";
		}
}

</script>
</head>
<body>
	<header>
		<jsp:include page="../include/menubar.jsp"></jsp:include>
	</header>

	<div class="container">
		<div class="bnr">
			<img alt="bnr" src="./images/bnr_reserve.jpg">
			<hr size="5" color="darkorange">
		</div>

		<div style="display: flex; height: 100%;">
			<div style="width: 20%; height: 100%;"></div>
			<div style="width: 60%; height: 100%;">

				<div style="height: 50px; margin-top: 50px;">
					<table style="width: 100%">
						<tr>
							<td
								style="width: 33.33%; background-color: #df723d; padding: 15px;">&nbsp;
								step.01 예약하기</td>
							<td
								style="width: 33.33%; background-color: #636363; padding: 15px;">&nbsp;
								step.02 결제하기</td>
							<td
								style="width: 33.33%; background-color: #636363; padding: 15px;">&nbsp;
								step.03 예약완료</td>
						</tr>
					</table>
				</div>

				<br>
				<div style="background-color: rgb(55, 55, 55); padding: 30px;">

					<form name="book" action="BookAction.boo" method="post">
						<div style="padding: 5px; float: right;">o 예약가능 x예약불가
							&nbsp;&nbsp; 예약가이드</div>
						<input type="hidden" value="<%=id%>" name="B_ID" >
						<div>
						
							<table style="width: 100%;">
								<tr style="background-color: #000; height: 50px;">
									<th style="width: 24%">날짜</th>
									<th style="width: 15%">지점</th>
									<th style="width: 25%">테마</th>
									<th style="width: 13%">시간</th>
									<th style="width: 13%">인원</th>
								</tr>

								<tr style="background-color: #fff; color: black; vertical-align: top; height: 500px;">
								
									<td>
										<div id="datepicker" onclick="dateChange();"></div>
										<div style="display: flex; float: right;">
										<input id="B_DATE" name="B_DATE" value="날짜를 선택해주세요">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" onclick="dateChange();" value="확인" >
										</div>
									</td>
									
									<td>
										<div  style="background-color: #efefef; display: flex;"
											onclick="displayTest()" >
											<p style="color: black; text-align: center;">역삼점</p>
										</div>
									</td>
						
									<td>
									<div id="pp" onclick="displayTest1()"  style="display: none;">
										<%
										for (int i = 0; i < themeList.size(); i++) {
											ManagerBean tl = (ManagerBean) themeList.get(i);
										%>

										<div 
											style="padding-inline-start: 20px; background-color: #efefef; display: flex; margin-bottom: 10px;">
											<input type="radio" name="product" onclick="valueChange(); " value="<%=tl.getP_NUM() %>" >
											   <span><img 	src="themeupload/<%=tl.getP_FILE()%>"	style="width: 40px; height: 40px;"></span> 
											<p style="color: black; text-align: center;">
												&nbsp;&nbsp;<%=tl.getP_NAME()%></p>
										</div>
										<% } %>
										</div>
										<input type="hidden" id="B_PNUM" name="B_PNUM" >
									</td>
									
									<td>
									<div id="tt" onclick="displayTest2()"  style="display: none;">
										<div 
											style="padding-inline-start: 30px; background-color: #efefef; display: flex; margin-bottom: 10px;">
										<input type="radio" name="time" value="10:00" onclick="valueChange();">
											<p style="color: black; text-align: center;">10 : 00</p>
										</div>
										<div
											style="padding-inline-start: 30px; background-color: #efefef; display: flex; margin-bottom: 10px;">
											<input type="radio" name="time"  value="12:00" onclick="valueChange();">
											<p style="color: black; text-align: center;">12 : 00</p>
										</div>
										<div
											style="padding-inline-start: 30px; background-color: #efefef; display: flex; margin-bottom: 10px;">
											<input type="radio" name="time"  value="14:00" onclick="valueChange();">
											<p style="color: black; text-align: center;">14 : 00</p>
										</div>
										<div
											style="padding-inline-start: 30px; background-color: #efefef; display: flex; margin-bottom: 10px;">
											<input type="radio" name="time"  value="16:00" onclick="valueChange();">
											<p style="color: black; text-align: center;">16 : 00</p>
										</div>
									</div>
										<input type="hidden" id="B_TIME" name="B_TIME">
									</td>
									
									<td>
									<div id="ii" style="display: none;">
										<div
											style="padding-inline-start: 30px; background-color: #efefef; display: flex; margin-bottom: 10px;" >
											 <input type="radio" name="inwon" onclick="javascript:valueChange(); onChange();" value="2" >
											<p style="color: black; text-align: center;">2 명</p>
										</div>
										<div
											style="padding-inline-start: 30px; background-color: #efefef; display: flex; margin-bottom: 10px;">
											 <input type="radio" name="inwon" onclick="javascript:valueChange(); onChange();" value="3">
											<p style="color: black; text-align: center;">3 명</p>
										</div>
										<div
											style="padding-inline-start: 30px; background-color: #efefef; display: flex; margin-bottom: 10px;">
											 <input type="radio" name="inwon" onclick="javascript:valueChange(); onChange();"value="4">
											<p style="color: black; text-align: center;">4 명</p>
										</div>
										<div
											style="padding-inline-start: 30px; background-color: #efefef; display: flex; margin-bottom: 10px;" >
											 <input type="radio" name="inwon" onclick="javascript:valueChange(); onChange();" value="5">
											<p style="color: black; text-align: center;">5 명</p>
										</div>
									</div>
										<input type="hidden" id="B_INWON" name="B_INWON">
									</td>
									
								</tr>
								<tr
									style="background-color: #fff; color: black; text-align: center;">
									<td colspan="3" style="font-size: 15px; font-weight: bold">금액 : <span id="pay"></span> 원
									</td>
									<td colspan="2">
										<div
											style="width: 100px; align: center; height: 25px; background-color: #df723d; text-align: center; font-weight: bold; padding: 10px;">
											<a href="javascript:addBook()">예약하기</a>
										</div>
									</td>
							</table>
							<br>
						</div>
					</form>
				</div>
			</div>

			<div style="width: 20%;"></div>
			
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