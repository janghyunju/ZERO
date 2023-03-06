<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.manager.db.*" %>
<%
	BoardnBean boardn = (BoardnBean)request.getAttribute("boardndata"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title > Theme detail </title>
<link rel="stylesheet" 
     href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css" 
     integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R" 
     crossorigin="anonymous">
         
</head>

<body class="p-3 mb-2" style="background-color: #111">
<header class="p-3 mb-2 #111 text-white">
        <jsp:include page="../include/menubar.jsp"></jsp:include>
   </header>


<div class="card mb-3" align="center" style=" margin-top: 80px; margin-left: 220px; margin-right: 220px; margin-bottom: 20px; ">
<!-- 카드 크기 style 지정 -->
  <h3 class="card-header"> Notice detail </h3>
  <div class="card-body">
    <h5 class="card-title">Title :<%= boardn.getN_subject() %> </h5>
     <h6 class="card-subtitle text-muted"><%= boardn.getN_date() %></h6>
  </div>
  
  <!-- svg 태그 안 width, height 카드 넓이  -->
 
 <% if(!(boardn.getN_file() == null)){ %>
  <img src="./boardnupload/<%= boardn.getN_file() %>" 
  alt="공지 이미지" width="300px" height="300px" style="margin-left: 330px;">
  <rect width="90%" height="90%" fill="#868e96"> </rect>
 <% } %>
	
 
	<br>
	<br>

  
  <div class="card-body">
    <p class="card-text"> 
   <%= boardn.getN_content() %></p>
  </div>
  
  
  <div class="card-body" align="center">
   <a href="./NoticeModify.ma?num=<%= boardn.getN_num() %>" style="background-color: #c6734a" class="btn primary"> Modify</a> &nbsp;&nbsp;
   <a href="./NoticeDeleteAction.ma?num=<%= boardn.getN_num() %>" style="background-color: #c6734a" class="btn primary"> Delete</a> &nbsp;&nbsp;
   <a href="javascript:history.go(-1)" style="background-color: #c6734a" class="btn primary">Back</a> &nbsp;&nbsp;
   <a href="./ManagerList.ma" style="background-color: #c6734a" class="btn primary">List</a> &nbsp;&nbsp;
  </div>
</div>


</body>
</html>