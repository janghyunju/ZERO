<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.boardr.db.*"%>
<%
BoardrBean board = (BoardrBean) request.getAttribute("boarddata");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
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
<body>
	<div class="container">
		<!-- 메인베너 -->
		<div class="bnr">
			<img alt="bnr" src="images/bnr.jpg" style="width:100%">
			<hr size="5" color="darkorange">
		</div>
		<!-- 게시판 리스트 -->
		<div class="layout">
			<div>
				<font size="10px" color="#fff">Review</font>
			</div>
			<hr size="2" color="orange">
			<div class="list">
				<!-- 게시판 수정 -->
				<table>
					<tr align="center" valign="middle">
						<td colspan="5">게시글 상세보기</td>
					</tr>

					<tr>
						<td style="font-family: 돋움; font-size: 12pt" height="16">
							<div align="center">제목&nbsp;&nbsp;</div>
						</td>
						<td style="font-family: 돋움; font-size: 12pt"><%=board.getR_subject()%>
						</td>
					</tr>

					<tr bgcolor="#cccccc">
						<td colspan="2" style="height: 1px;"></td>
					</tr>

					<tr>
						<td style="font-family: 돋움; font-size: 12pt">
							<div align="center">내용</div>
						</td>
						<td style="font-family: 돋움; font-size: 12pt">
							<table style="table-layout: fixed">
								<tr>
									<td valign="top" style="font-family: 돋움; font-size: 12pt">
										<%=board.getR_content()%>
									</td>
								</tr>
							</table>
						</td>
					</tr>

					<tr bgcolor="#cccccc">
						<td colspan="2" style="height: 1px;"></td>
					</tr>

					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>

					<tr align="center" valign="middle">
						<td colspan="5"><font size=2> 
								<%-- <a href="./BoardrReplyAction.re?r_num=<%=board.getR_num()%>">[답변]</a>&nbsp;&nbsp; --%>
								<a href="./BoardrModify.re?r_num=<%=board.getR_num()%>">[수정]</a>&nbsp;&nbsp;
								<a href="./BoardrDeleteAction.re?r_num=<%=board.getR_num()%>">[삭제]</a>&nbsp;&nbsp;
								<a href="./BoardrList.re">[목록]</a>&nbsp;&nbsp;
						</font></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>