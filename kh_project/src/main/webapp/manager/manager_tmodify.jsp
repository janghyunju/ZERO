<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "net.manager.db.*" %>

<%
	ManagerBean manager = (ManagerBean)request.getAttribute("managerdata");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Theme Modify</title>

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
	function modifytheme(){
		modifyform.submit();
	}
</script>

</head>
<body class="p-3 mb-2 text-white" style="background-color: #111">

<header class="p-3 mb-2 #111 text-white">
        <jsp:include page="../include/menubar.jsp"></jsp:include>
   </header>
   
<form action="./ThemeModifyAction.ma" method="post" enctype="multipart/fomr-data" name="modifyform">
<input type="hidden" name="P_NUM" value="<%= manager.getP_NUM() %>" />
<!-- 문자열 형태로 출력 -->



 <fieldset>
     <div id="background">
   <h1 align="center"> Theme Modify</h1>

 <div class="form-group">
     <h3> <label for="title" class="form-label mt-4">Theme name</label> </h3>
      <input name="P_NAME" value="<%= manager.getP_NAME() %>"
      type="text" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Title">
    </div>
    

  
 <fieldset class="form-group">
     <h3 class="mt-4"> Level </h3>
     <br>
  
	<div class="form-check">
		<h5>
        <input class="form-check-input" type="radio" name="P_LEVEL" id="optionsRadios1" value="1" checked="">
        <label class="form-check-label" for="optionsRadios1"> 
          Level 1</label> 
        </h5>
      </div>
	 <div class="form-check">
	 	<h5>
        <input class="form-check-input" type="radio" name="P_LEVEL" id="optionsRadios2" value="2">
        <label class="form-check-label" for="optionsRadios2"> 
          Level 2</label>
        </h5>
      </div>
	 <div class="form-check">
		 <h5>
        <input class="form-check-input" type="radio" name="P_LEVEL" id="optionsRadios3" value="3">
        <label class="form-check-label" for="optionsRadios3"> 
          Level 3</label> 
      	</h5>
      </div>
	 <div class="form-check">
	 	 <h5>
        <input class="form-check-input" type="radio" name="P_LEVEL" id="optionsRadios4" value="4">
        <label class="form-check-label" for="optionsRadios4"> 
          Level 4</label> 
         </h5>
      </div>
	 <div class="form-check">
	 	<h5>
        <input class="form-check-input" type="radio" name="P_LEVEL" id="optionsRadios5" value="5">
        <label class="form-check-label" for="optionsRadios5"> 
          Level 5</label> 
         </h5>
      </div>
      </fieldset>
 


       <div class="form-group">
     <h3> <label for="content" class="form-label mt-4" >Content</label> </h3>
      <textarea class="form-control" id="content" rows="15" cal="67" name="P_CONTENT" >
      <%= manager.getP_CONTENT() %></textarea>
    </div>


	<div class="form-group">
    <% if(!(manager.getP_FILE() == null)){ %>
     <h3> <label for="formFile" class="form-label mt-4">File</label> </h3>
      <input name="P_FILE" class="form-control" type="file" id="formFile">
    </div>
	
	<div class="form-group">
     <h3> <label for="preview" class="form-label mt-4">Preview</label> </h3>
      <input name="P_PRE" value="<%= manager.getP_PRE() %>"
      type="text" class="form-control" id="preview" aria-describedby="emailHelp" placeholder="Title">
    </div>
    
	<div class="form-group">
     <h3> <label for="place" class="form-label mt-4">PLACE</label> </h3>
      <input name="P_PLACE" value="<%= manager.getP_PLACE() %>"
      type="text" class="form-control" id="place" aria-describedby="emailHelp" placeholder="Title">
    </div>
<% } %>
	
	
	<div align="center">
	<h4> 
	<!--btn-lg 버튼 크기 설정 -->
	<a href="javascript:modifytheme()" style="background-color: #c6734a" class="btn primary btn-lg"> Done </a>
	&nbsp;&nbsp;&nbsp;
	<a href="javascript:history.go(-1)" style="background-color: #c6734a" class="btn primary btn-lg"> Back </a>
	</h4>
	</div>
	
	</div>
 </fieldset>
</form>
</body>
</html>