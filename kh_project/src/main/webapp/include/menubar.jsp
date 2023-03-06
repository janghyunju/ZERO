<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바모듈</title>
<style type="text/css">
.logo {
	float: fixed;
	top: 0px;
	left: 30px;
	height: 54px;
	margin-left: 200px;
	padding-top: 0px;
	margin-top: 8px;
}

body, div {
	margin: 0;
	padding: 0;
}

#header {
	margin-right: 300px;
	padding: 0;
}

#header>a {
	display: inline-block;
	padding: 10px 0;
	margin-left: 30px;
}

/*메인메뉴 */
ul li {
	list-style: none;
}

a {
	text-decoration: none;
	color: inherit;
}

.menu {
	float: right;
	font: bold 16px "malgun gothic";
	text-align: center;
	height: 50px;
	width: 1000px;
}

.menu>ul>li {
	display: inline-block;
	float: left;
	width: 200px;
	position: relative;
}

.menu>ul>li:hover {
	background-color: rgb(223, 114, 61, .9);
}

.menu>ul>li>a {
	display: block;
	padding: 10px 0;
	color: #fff;
}

/* 서브메뉴 */
.submenu {
	text-align: left;
}

.submenu li {
	display: block;
	width: 200px;
	position: relative;
}

.submenu li a {
	display: none;
	padding: 10px 0;
	color: black;
}

.menu  ul  li:hover>.submenu  li  a {
	display: block;
}

.submenu>li>a:hover {
	text-decoration: underline;
	color: #fff;
}

/* 사이드메뉴 */
#menuicon:checked+label+div {
	right: 0;
}

#menuicon {
	display: none;
}

#menuicon+label {
	display: block;
	width: 55px;
	height: 35px;
	position: fixed;
	top: 8px;
	right: 8px;
	cursor: pointer;
}

#menuicon+label span {
	display: block;
	position: absolute;
	width: 100%;
	height: 5px;
	border-radius: 30px;
	background: rgb(223, 114, 61, .8);
}

#menuicon+label span:nth-child(1) {
	top: 0;
}

#menuicon+label span:nth-child(2) {
	top: 50%;
	transform: translateY(-50%);
}

#menuicon+label span:nth-child(3) {
	bottom: 0;
}

.sidemenu {
	width: 180px;
	height: 100%;
	background: rgba(0, 0, 0, .8);
	position: fixed;
	top: 50px;
	right: -180px;
	z-index: 1;
	transition: all .35s;
}

.sidemenu>ul>li {
	display: inline-block;
	float: left;
	width: 100px;
	position: relative;
	margin-top: 10px;
}

.sidemenu>ul>li>a {
	display: block;
	padding: 10px 0;
	font-size: 15px;
	color: gray;
}

.sidemenu>ul>li:hover {
	font-weight: bolder;
}
</style>
</head>
<body>

	<div id="header">
			<a href="./index.jsp"><img alt="logo" src="./images/logo.png"></a>
		<div class="menu">
			<ul>
				<li><a href="IndexAction.ma">테마종류</a></li>
				<li><a href="BookThemeListAction.ma">예약하기</a></li>
				<li><a href="BoardnList.no">커뮤니티</a>
					<ul class="submenu">
						<li><a href="BoardnList.no">공지사항</a></li>
						<li><a href="BoardrList.re">후기게시판</a></li>
						<li><a href="BoardqList.bo">문의게시판</a></li>
					</ul></li>
				<li><a href="./map.jsp">오시는길</a></li>
			</ul>
		</div>
	</div>

	<input type="checkbox" id="menuicon">
	<label for="menuicon"> <span></span> <span></span> <span></span>
	</label>
	<div class="sidemenu">
	<ul>
<%
String id = null;
 id = (String)session.getAttribute("id");
 if(session.getAttribute("id") == null){ %>
		<li><a href="MemberJoin.me">회원가입</a></li>
		<li><a href="MemberLogin.me">로그인</a></li>
  <%}else{ %>
  <li><a href="MemberLogoutAction.me">로그아웃</a></li>
    <% if(session.getAttribute("id").equals("admin")) { %>
		<li><a href="ManagerList.ma">관리자페이지</a></li>
<% } %>
<% }%>
		<li><a href="BookDetailAction.boo">예약확인</a></li>
		<li><a href="MemberInfoAction.me">내 정보</a></li>
		<li><a href="BoardqList.bo">1:1 문의</a></li>
  
	</ul>
</div>

</body>
</html>