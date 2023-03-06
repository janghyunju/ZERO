<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="net.boardn.db.*"%>

<%
String id = (String) session.getAttribute("id");
BoardnBean board = (BoardnBean) request.getAttribute("boarddata");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
<script src="//cdn.ckeditor.com/4.20.0/standard/ckeditor.js"></script>

<script type="text/javascript">
	function modifyboard() {
		modifyform.submit();
	}
</script>
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
				<!-- 게시판 수정 -->
				<form action="BoardnModifyAction.no" method="post" name="modifyform" enctype="multipart/form-data">
					<input type="hidden" name="n_num" value="<%=board.getN_num()%>">
					<input type="hidden" name="n_id" value="<%=id%>">
					<table>
						<tr align="center" valign="middle">
							<td colspan="5">게시글 수정하기</td>
						</tr>
						<tr>
							<td height="16" style="font-family: 돋움; font-size: 12">
								<div align="center">제목</div>
							</td>
							<td><input name="n_subject" size="50" maxlength="100"
								value="<%=board.getN_subject()%>"></td>
						</tr>
						<tr>
							<td style="font-family: 돋움; font-size: 12pt" height="16">
								<div align="center">이미지</div>
							</td>
							<td><input name="n_file" type="file" accept="image/*" value="파일첨부" /><%=board.getN_file()%></td>
						</tr>
						<tr>
							<td style="font-family: 돋움; font-size: 12">
								<div align="center">내용</div>
							</td>
							<td><textarea name="n_content" cols="67" rows="15"><%=board.getN_content()%></textarea>
														<script type="text/javascript">
								CKEDITOR.replace('n_content', {
									height : 500
								});
							</script>
							</td>
						</tr>

						<tr bgcolor="#cccccc">
							<td colspan="2" style="height: 1px;"></td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;&nbsp;</td>
						</tr>

						<tr align="center" valign="middle">
							<td colspan="5"><font size=2> <a
									href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp; <a
									href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
							</font></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>