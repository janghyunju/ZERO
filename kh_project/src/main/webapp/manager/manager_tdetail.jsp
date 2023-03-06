<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.manager.db.*" %>
<%
	ManagerBean manager = (ManagerBean)request.getAttribute("themedata");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title > theme detail </title>
<link rel="stylesheet" 
     href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css" 
     integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R" 
     crossorigin="anonymous"> 
</head>

<body class="p-3 mb-2" style="background-color: #111">
<header class="p-3 mb-2 #111 text-white">
        <jsp:include page="../include/menubar.jsp"></jsp:include>
   </header>


<!-- row 한줄로 나옴-->

<div class="card mb-3" align="center" style=" margin-top: 80px; margin-left: 220px; margin-right: 220px; margin-bottom: 20px; ">
<!-- 카드 크기 style 지정 -->
  <h3 class="card-header"> Theme detail </h3>
  <div class="card-body">
    <h5 class="card-title">Title : <%= manager.getP_NAME() %> </h5>
  </div>
  
  <!-- svg 태그 안 width, height 카드 넓이  -->

 	<img src="./themeupload/<%= manager.getP_FILE() %>" 
 	alt="테마 이미지"  width="400px" height="300px" style="margin-left: 330px;">
    <rect width="90%" height="90%" fill="#868e96"></rect>
    
 
	<br>
	<br>
	<p class="text-danger btn-lg"> Level <%=manager.getP_LEVEL() %> </p>
  
  <div class="card-body">
    <p class="card-text"> 
  <%=manager.getP_CONTENT() %> </p>
  </div>
  
  
  <div class="card-body" align="center">
   <a href="./ThemeModify.ma?num=<%= manager.getP_NUM() %>" style="background-color: #c6734a" class="btn primary"> Modify</a> &nbsp;&nbsp;
   <a href="./ThemeDeleteAction.ma?num=<%= manager.getP_NUM()%>" style="background-color: #c6734a" class="btn primary""> Delete</a> &nbsp;&nbsp;
   <a href="javascript:history.go(-1)" style="background-color: #c6734a" class="btn primary">Back</a> &nbsp;&nbsp;
   <a href="./ManagerList.ma" style="background-color: #c6734a" class="btn primary">List</a> &nbsp;&nbsp;
  </div>
</div>


</body>
</html>