<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.manager.db.*"%>
<%
	BoardrBean boardr = (BoardrBean)request.getAttribute("boardrdata"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review detail</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css"
	integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R"
	crossorigin="anonymous">
<style>
#background {
	margin-top: 200px;
	margin-bottom: 100px;
	margin-left: 200px;
	width : 1000px;
	height: 1000px;
}
</style>
</head>
<body class="p-3 mb-2" style="background-color: #111111">

	<header class="p-3 mb-2 text-white" style="background-color: #11111">
		<jsp:include page="../include/menubar.jsp"></jsp:include>
	</header>
<div align="center"><br><br>
	<div class="card mb-3" style=width:60%;>
		<h3 class="card-header" align="left">Review</h3>
		<div class="card-body">
			<h5 class="card-title" align="left"><%= boardr.getR_subject() %></h5>
			<h6 class="card-subtitle text-muted" align="left"><%= boardr.getR_id() %></h6>
		</div>

		<div class="card-body">
			<p class="card-text"><%=boardr.getR_content() %></p>
		</div>

		<div class="card-body" align="center">
			<a href="./BoardrDelete.mb?num=<%= boardr.getR_num() %>"
				class="card-link">&#9003;</a> <a href="javascript:history.go(-1)"
				class="card-link">&#8592;</a> <a href="./ManagerList.ma"
				class="card-link">list</a>
		</div>
		<div class="card-footer text-muted" align="left">
			<%= boardr.getR_date() %>
		</div>
	</div>
	
</div>

</body>
</html>