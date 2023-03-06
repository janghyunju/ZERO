<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 상세 작성 view</title>
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
	function addboardn() {
		nboardform.submit();
	}
</script>
</head>
<body class="p-3 mb-2 text-white" style="background-color: #111">

<header class="p-3 mb-2 text-white" style="background-color: #111">
      <jsp:include page="../include/menubar.jsp"></jsp:include>
</header>
<form action="./ManagerNoticeAddAction.ma" method="post" 
      enctype="multipart/form-data" name="nboardform">
		<fieldset>
			<div id="background">
	   			<h1 align="center">Notice</h1>
		
			<div class="form-group">
				<h3><label for="title" class="form-label mt-4">Subject</label></h3>
					<input name="N_SUBJECT" value="" type="text" class="form-control" id="title" maxlength="100" placeholder="Subject">
    		</div>	

			<div class="form-group">
     	 		<h3><label for="content" class="form-label mt-4" >Content</label> </h3>
					<textarea class="form-control" id="content" name="N_CONTENT" 
						       rows="15" cols="67" placeholder="Content" ></textarea>
			</div>
	
			<div class="form-group">   
				<h3><label for="formFile" class="form-label mt-4">File</label></h3>
					<input name="N_FILE" class="form-control" type="file">
			</div>

		<br><br><br>
			<div align="center">
				<h4><a href="javascript:addboardn()" class="btn-primary btn-lg" style="background-color: #c6734a">OK</a>&nbsp;&nbsp;&nbsp;
    			    <a href="javascript:history.go(-1)" class="btn-primary btn-lg" style="background-color: #c6734a">&#8592;</a>

				</h4></div>	
			</div>
  </fieldset>
</body>
</html>