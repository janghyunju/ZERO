<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "net.manager.db.*" %>

<%
	BoardnBean boardn = (BoardnBean)request.getAttribute("boardndata");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Modify</title>

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
	function noticemodify() {
		modifynform.submit();	
	}
</script>

</head>
<body class="p-3 mb-2 text-white" style="background-color: #111">

<header class="p-3 mb-2 #111 text-white">
        <jsp:include page="../include/menubar.jsp"></jsp:include>
   </header>


<form action="./NoticeModifyAction.ma" method="post" enctype="multipart/fomr-data" name="modifynform">
<input type="hidden" name="N_NUM" value="<%= boardn.getN_num() %>" />


  <fieldset>
     <div id="background">
   <h1 align="center"> Notice Modify</h1>
   
    <div class="form-group">
     <h3> <label for="title" class="form-label mt-4">Title</label> </h3>
      <input name="N_SUBJECT" value="<%= boardn.getN_subject() %>"
      type="email" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Title">
    </div>
    
    <div class="form-group">
    <h4> <label for="date" class="form-label mt-4"> Date <label>
      		<%= boardn.getN_date() %> </h4>  
    </div>
    
    <div class="form-group">
     <h3> <label for="content" class="form-label mt-4" >Content</label> </h3>
      <textarea class="form-control" rows="15" cal="67" id="content" name="N_CONTENT" >
      <%= boardn.getN_content() %></textarea>
    </div>
    
    <div class="form-group">
    <% if(!(boardn.getN_file() == null)){ %>
     <h3> <label for="formFile" class="form-label mt-4">File</label> </h3>
      <input name="N_FILE" class="form-control" type="file" id="formFile">
    </div>
	<% } %>
	
	<div align="center">
	<h4> 
	<!--btn-lg 버튼 크기 설정 -->
	<a href="javascript:noticemodify()" style="background-color: #c6734a" class="btn primary btn-lg"> Done </a>
	&nbsp;&nbsp;&nbsp;
	<a href="javascript:history.go(-1)" style="background-color: #c6734a" class="btn primary btn-lg"> Back </a>
  	</h4>	
	</div>
	
	</div>
  </fieldset>

</form>
</body>
</html>