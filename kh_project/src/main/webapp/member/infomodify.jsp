<%@page import="net.member.db.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
MemberBean member = (MemberBean) request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

.container {
	background: #111;
}

</style>
<script>
	function check_pw() {
		var pw = document.getElementById('pw').value;
	console.log(document.getElementById('pw').value);
	console.log(document.getElementById('pw2').value);
		if (document.getElementById('pw').value != ''&& document.getElementById('pw2').value != '') {
			if (document.getElementById('pw').value == document.getElementById('pw2').value) {
				document.getElementById('check').innerHTML = '비밀번호가 일치합니다.';
				document.getElementById('check').style.color = 'blue';
			} else {
				document.getElementById('check').innerHTML = '비밀번호가 일치하지 않습니다.';
				document.getElementById('check').style.color = 'red';
			}
		}
	}
</script>

<title>회원정보수정</title>
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
					<h3 style="color: #fff">회원정보 수정</h3>
					<div style="width: 100%; height: 4px; background-color: #df723d"></div>
<div>
	<h2>
	  <a>
	    <img src="images/logo.png">
	  </a>
	</h2>
</div>

<div style="background: white; padding-left: 20px">
<form action="./MemberModifyAction.me" method="post">
  <table style="height: 250px; width: 300px">
    <tr>
      <td>회원구분</td>
      <td><input type="radio" value="개인회원" checked="checked">개인회원</td>
    </tr>
		    <tr>
		      <td>아이디 :</td>
		      <td><input type="text" name="KH_ID" value="<%=member.getKH_ID()%>" readonly></td>
		    </tr>
		    <tr>
			  <td>이 름 : </td>
			  <td><input type="text" name="KH_NAME" value="<%=member.getKH_NAME()%>"></td>
			</tr>
			<tr> 
			  <td>전화번호: </td>
			  <td><input type="text" name="KH_TEL" value="<%=member.getKH_TEL()%>"></td>
			</tr>
		<p>
			<tr>
			  <td>비밀번호: </td>
			  <td><input type="password" onKeyUp="check_pw()" id="pw" name="KH_PW"></td><br /> 
			  <td><input type="hidden" name="KH_PW2" onKeyUp="check_pw()" id="pw2" value="<%=member.getKH_PW()%>"></td>
			</tr>
			<tr>
			  <td><input type="submit" value="수정"></td> 
			  <td><font id="check" size="2"></font></td>
			</tr>
		</p>
</table>
	</form>
	<hr />
</div>
			</div>
		</div>
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