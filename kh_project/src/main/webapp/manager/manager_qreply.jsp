<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.manager.db.*" %>
<%
BoardqBean board = (BoardqBean)request.getAttribute("boardqdata");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> q&a 답글</title>
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
<script type="text/javascript">
function replyboard() {			
	boardform.submit();
}
</script>
</head>
<body class="p-3 mb-2 text-white" style="background-color: #111111">

<header class="p-3 mb-2 text-white" style="background-color: #111111">
      <jsp:include page="../include/menubar.jsp"></jsp:include>
</header>
<!— 게시판 답변 —>

<form action="./BoardqReplyAction.mb" method="post" name="boardform">
<input type="hidden" name="Q_NUM" value="<%= board.getQ_num() %>" />
<input type="hidden" name="Q_RE_REF" value="<%= board.getQ_re_ref() %>" />
<input type="hidden" name="Q_RE_LEV" value="<%= board.getQ_re_lev() %>" />
<input type="hidden" name="Q_RE_SEQ" value="<%= board.getQ_re_seq() %>" />


<div id="background">
	<h1 align="center">Reply</h1>
	<div class="form-group" >
		<h3 style="display:inline;"><label for="subject" class="form-label mt-4">Subject</label></h3>
		<h5 style="display:inline;"><small class="text-muted"> &nbsp;&nbsp;Admin</small></h5>		
		<input name="Q_SUBJECT" value="Re: <%= board.getQ_subject() %>" type="text" 
		       class="form-control" id="subject" maxlength="100">
	</div>	

	<div class="form-group">
     	<h3><label for="content" class="form-label mt-4" >Content</label></h3>
		<textarea class="form-control" id="content" name="Q_CONTENT" 
				   rows="15" cols="67" placeholder="Content"></textarea>
	</div>

<br><br><br>

	<div align="center">
		<h4><a href="javascript:replyboard()" class="btn-primary btn-lg" style="background-color: #c6734a">&#10004;</a>&nbsp;&nbsp;&nbsp;
   			<a href="javascript:history.go(-1)" class="btn-primary btn-lg" style="background-color: #c6734a">&#8592;</a>
		</h4>
	</div>	
</div>

</form>
</body>
</html>