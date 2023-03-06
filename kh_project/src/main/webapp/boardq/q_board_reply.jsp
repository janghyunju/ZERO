<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.boardq.db.*"%>
<%
String id = (String) session.getAttribute("id");
BoardqBean board = (BoardqBean) request.getAttribute("boarddata");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 답변 게시판</title>
<script>
	function addboard() {
		boardform.submit();
	}
</script>
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
	function replyboard() {
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
			<img alt="bnr" src="images/bnr.jpg" style="width: 100%">
			<hr size="5" color="darkorange">
		</div>
		<!-- 게시물 -->
		<div class="layout">
			<div>
				<font size="10px" color="#fff">Q&A</font>
			</div>
			<hr size="2" color="orange">
			<div class="list">
				<!-- 게시판 답변 -->
				<form action="./BoardqReplyView.bo" method="post" name="boardform">
					<input type="hidden" name="q_num" value="<%=board.getQ_num()%>">
					<input type="hidden" name="q_re_ref"
						value="<%=board.getQ_re_ref()%>"> <input type="hidden"
						name="q_re_lev" value="<%=board.getQ_re_lev()%>"> <input
						type="hidden" name="q_re_seq" value="<%=board.getQ_re_seq()%>">
					<input type="hidden" name="q_id" value="<%=id%>">

					<table>
						<tr align="center" valign="middle">
							<td colspan="5">문의 답변 게시판</td>
						</tr>
						<tr>
							<td style="font-family: 돋움; font-size: 12" height="16">
								<div align="center">글쓴이</div>
							</td>
							<td><%=id%></td>
						</tr>
						<tr>
							<td style="font-family: 돋움; font-size: 12" height="16">
								<div align="center">제목</div>
							</td>
							<td><input name="q_subject" type="text" size="50"
								maxlength="100" value="Re: <%=board.getQ_subject()%>" /></td>
						</tr>
						<tr>
							<td style="font-family: 돋움; font-size: 12">
								<div align="center">내 용</div>
							</td>
							<td><textarea name="q_content" cols="67" rows="15">
							</textarea><script type="text/javascript">
								CKEDITOR.replace('q_content', {
									height : 500
								});
							</script></td>
						</tr>

						<tr bgcolor="#cccccc">
							<td colspan="2" style="height: 1px;"></td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>

						<tr align="center" vailgn="middle">
							<td colspan="5"><a href="javascript:replyboard()">[등록]</a>&nbsp;&nbsp;
								<a href="javascript:history.go(-1)">[뒤로]</a></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>