<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지게시판 글 쓰기</title>
<script src="//cdn.ckeditor.com/4.20.0/standard/ckeditor.js"></script>
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
<script>
	function addboard() {
		boardform.submit();
	}
</script>
</head>

<body>
	<header>
		<jsp:include page="../include/menubar.jsp"></jsp:include>
	</header>

	<!-- CONTENTS -->
	<div class="container">
		<!-- 메인베너 -->
		<div class="bnr">
			<img alt="bnr" src="images/bnr.jpg" style="width:100%">
			<hr size="5" color="darkorange">
		</div>
		<!-- 게시물 -->
		<div class="layout">
			<div>
				<font size="10px" color="#fff">Notice</font>
			</div>
			<hr size="2" color="orange">
			<div class="list">
				<!-- 게시판 등록 -->
				<form action="./BoardnAddAction.no" method="post" name="boardform" enctype="multipart/form-data">
					<table>
						<tr align="center" valign="middle">
							<td colspan="5">공지 게시판 글쓰기</td>
						</tr>

						<tr>
							<td style="font-family: 돋움; font-size: 12pt" height="16">
								<div align="center">제목</div>
							</td>
							<td><input name="n_subject" type="text" size="50"
								maxlength="100" value="" /></td>
						</tr>
						
						<tr>
							<td style="font-family: 돋움; font-size: 12pt" height="16">
								<div align="center">이미지</div>
							</td>
							<td><input name="n_file" type="file" accept="image/*" value="파일첨부" /></td>
						</tr>

						<tr>
							<td style="font-family: 돋움; font-size: 12pt">
								<div align="center">내용</div>
							</td>
							<td><textarea name="n_content" cols="67" rows="15"></textarea>
							<script type="text/javascript">
								CKEDITOR.replace('n_content', {
									height : 500
								});
							</script>
							</td>
						</tr>

						<tr align="center" valign="middle">
							<td colspan="5"><a href="javascript:addboard()">[등록]</a>&nbsp;&nbsp;
								<a href="javascript:history.go(-1)">[뒤로]</a></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>