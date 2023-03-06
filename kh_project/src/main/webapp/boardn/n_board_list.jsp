<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="net.boardn.db.*"%>

<%
String id = null;

if (session.getAttribute("id") != null) {
	id = (String) session.getAttribute("id");
}

List boardList = (List) request.getAttribute("n_boardlist");

int listcount = ((Integer) request.getAttribute("n_listcount")).intValue();
int nowpage = ((Integer) request.getAttribute("n_page")).intValue();
int maxpage = ((Integer) request.getAttribute("n_maxpage")).intValue();
int startpage = ((Integer) request.getAttribute("n_startpage")).intValue();
int endpage = ((Integer) request.getAttribute("n_endpage")).intValue();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 게시판</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap')
	;

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

	<!-- CONTENTS -->
	<div class="container">
		<!-- 메인베너 -->
		<div class="bnr">
			<img alt="bnr" src="images/bnr.jpg" style="width: 100%">
			<hr size="5" color="#df723d">
		</div>
		<!-- 게시물 -->
		<div style="display: flex; height: 100%;">
			<div style="width: 20%; height: 100%;"></div>
			<div style="width: 60%; height: 100%;">

				<div style="height: 50px;"></div>
				<br>
				<div style="background-color: rgb(55, 55, 55); padding: 30px;">
					<div>
						<font size="6px" color="#fff"
							style="font-family: 'Gowun Dodum', sans-serif">공지사항</font>
					</div>
					<hr size="2" color="#ffcc99">
					<div class="textbox">
						<!-- 게시판 리스트 -->
						<table class="table table-hover" style="width: 100%;">
							<tr align="center" valign="middle" bgcolor="#ffcc99">
								<td height="26" colspan="4">공지 게시판</td>
							</tr>

							<tr align="center" valign="middle" bordercolor="#333333">
								<td style="font-family: Tahoma; font-size: 10pt;" width="8%"
									height="26">
									<div align="center">번호</div>
								</td>

								<td style="font-family: Tahoma; font-size: 10pt;" width="8%"
									height="26">
									<div align="center">이미지</div>
								</td>

								<td style="font-family: Tahoma; font-size: 10pt;" width="50%">
									<div align="center">제목</div>
								</td>

								<td style="font-family: Tahoma; font-size: 10pt;" width="17%">
									<div align="center">날짜</div>
								</td>

							</tr>
							<%
							for (int i = 0; i < boardList.size(); i++) {
								BoardnBean bl = (BoardnBean) boardList.get(i);
							%>

							<tr align="center" valign="middle" bordercolor="#333333"
								onmouseover="this.style.backgroundColor='#a8Ffa8'"
								onmouseout="this.style.backgroundColor=''">
								<td height="33" style="font-family: Tahoma; font-size: 10pt;"><%=bl.getN_num()%>
								</td>
								<td><div>
										<img src="boardnupload/<%=bl.getN_file()%>"
											style="height: 150px">
									</div></td>
								<td style="font-family: Tahoma; font-size: 10pt;">
									<div align="center">
										<a href="./BoardnDetailAction.no?n_num=<%=bl.getN_num()%>">
											<%=bl.getN_subject()%> <!-- 전달되는 것은 num이지만 보여주는 것은 subject -->
										</a>
									</div>
								</td>

								<td style="font-family: Tahoma; font-size: 10pt;">
									<div align="center"><%=bl.getN_date()%></div>
								</td>

							</tr>

							<%
							}
							%>

							<tr align="center" height="20">
								<td colspan="7" style="font-family: Tahoma; font-size: 10pt;">
									<%
									if (nowpage <= 1) {
									%> [이전]&nbsp; <%
 } else {
 %> <a href="./BoardnList.no?n_page=<%=nowpage - 1%>">[이전]</a>&nbsp; <%
 }
 %> <%
 for (int a = startpage; a <= endpage; a++) {
 	if (a == nowpage) {
 %> [<%=a%>] <%
 } else {
 %> <a href="./BoardnList.no?n_page=<%=a%>">[<%=a%>]
								</a>&nbsp; <%
 }
 %> <%
 }
 %> <%
 if (nowpage >= maxpage) {
 %> [다음] <%
 } else {
 %> <a href="./BoardnList.no?n_page=<%=nowpage + 1%>">[다음]</a> <%
 }
 %>
								</td>
							</tr>

							<tr align="right">
								<td colspan="5">
									<%
									if (id != null && id.equals("admin")) {
									%> <!-- 회원이 null이 아니고 admin이면 아래의 회원관리를 할 수 있다 --> <a
									href="./BoardnWrite.no">[글쓰기]</a> <!-- !!!!!!파일 받아오기 ./MemberListAction.me 아님!!!!!!!!!! -->
									<%
									}
									%>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="width: 100%; height: 50px; background-color: #111"></div>
	</div>
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
			style="width: 100%; font-family: 'Gowun Dodum', sans-serif; line-height: 12pt; color: #ffffff; font-family: 'Gowun Dodum', sans-serif; font-size: 15pt; background-color: #000000"
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
		style="font-size: 10pt; font-family: 'Gowun Dodum', sans-serif; line-height: 10pt; color: #ffffff; background-color: #000000"
		align="center">Copyrightⓒ 2016 Beat Phobia. All right reserved.
	</div>
</body>
</html>