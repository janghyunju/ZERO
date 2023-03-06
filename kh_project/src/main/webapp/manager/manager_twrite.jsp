<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테마 상세 작성 view</title>

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
	
	function addtheme() {
		themeform.submit();
	}	
</script>

</head>
<body class="p-3 mb-2 text-white" style="background-color: #111111">

<header class="p-3 mb-2 text-white" style="background-color: #111111">
      <jsp:include page="../include/menubar.jsp"></jsp:include>
   </header>
	<!-- 게시판 등록 -->
	<form action="./ManagerThemeAddAction.ma" method="post"
		enctype="multipart/form-data" name="themeform">
		
	
	<fieldset>
		<div id="background">
	   		<h1 align="center">Theme</h1>
		
		<div class="form-group">
		<h3><label for="subject" class="form-label mt-4">Subject</label></h3>
			<input name="P_NAME" value="" type="text" class="form-control" id="subject" maxlength="100" placeholder="Subject">
    	</div>	
	


	<fieldset class="form-group">
		<h3 class="mt-4"> Level </h3><br />
			<div class="form-check">
			  <h5>
       	 		<input class="form-check-input" type="radio" id="level1" name="P_LEVEL" value="1" checked="checked">
       	 		<label class="form-check-label" for="level1">Level 1</label> 
       		  </h5>
      		</div>
      	
			<div class="form-check">
	 		  <h5>
        		<input class="form-check-input" type="radio" id="level2" name="P_LEVEL" value="2" >
        		<label class="form-check-label" for="level2">Level 2</label>
        	  </h5>
      		</div>
	 		<div class="form-check">
		 	  <h5>
       			<input class="form-check-input" type="radio" id="level3" name="P_LEVEL"  value="3">
        		<label class="form-check-label" for="level3">Level 3</label> 
      		  </h5>
      		</div>
			<div class="form-check">
			  <h5>
				<input class="form-check-input" type="radio" id="level4" name="P_LEVEL"  value="4">
				<label class="form-check-label" for="level4">Level 4</label> 
			  </h5>
      		</div>
	 		<div class="form-check">
	 		 <h5>
        		<input class="form-check-input" type="radio" id="level5" name="P_LEVEL"  value="5">
        		<label class="form-check-label" for="level5">Level 5</label> 
        	 </h5>
		</div>
	</fieldset>
		<div class="form-group">
     	  <h3><label for="content" class="form-label mt-4" >Content</label> </h3>
				<textarea class="form-control" id="content" name="P_CONTENT" 
						  rows="15" cols="67" placeholder="Content" ></textarea>
		</div>
		
		<div class="form-group">
			<h3><label for="place" class="form-label mt-4">Place</label></h3>
				<input type="text" name="P_PLACE" value="" class="form-control" 
						id="place" placeholder="Place">
		</div>
		<div class="form-group">
			<h3><label for="preview" class="form-label mt-4">Preview</label> </h3>
				<input type="text" name="P_PRE" value="" class="form-control" 
				       id="preview" aria-describedby="emailHelp" placeholder="Preview">
		</div>
		<div class="form-group">   
			<h3><label for="formFile" class="form-label mt-4">File</label></h3>
			<input name="P_FILE" class="form-control" type="file">
		</div>
	
	<br><br><br>
		<div align="center">
			<h4><a href="javascript:addtheme()" class="btn-primary btn-lg" style="background-color: #c6734a">OK</a>&nbsp;&nbsp;&nbsp;
    			<a href="javascript:history.go(-1)" class="btn-primary btn-lg" style="background-color: #c6734a">&#8592;</a>

  			</h4>	
		</div>
	</div>
  </fieldset>
</form>
</body>
</html>