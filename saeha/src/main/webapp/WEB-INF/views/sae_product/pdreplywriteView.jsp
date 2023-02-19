<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var nform = $("form[name='pdwriteForm']")
	
	$(".pdwritebtn").on("click", function(){
		nform.attr("action", "/sae_product/pdreplywrite");
		nform.attr("method", "post");
		nform.submit();
		});
	});
</script>
<body>

<div align="center">
<h1>답변 등록</h1>

<form method="post" action="/sae_product/pdreplywrite">
<table>
		<tr>
			<td>
			<h3><label for="title">제목</label></h3>
			<input type="text" id="title" name="py_title" />
			</td>
		</tr>
		<tr>
			<td>
			<h3><label for="content">내용</label></h3>
			<textarea id="content" name="py_content"></textarea>
			</td>
		</tr>
		<tr>
			<td>
			<button class="pdwritebtn" type="submit">등록</button>
			</td>
		</tr>
</table>
</form>
</div>
</body>
</html>