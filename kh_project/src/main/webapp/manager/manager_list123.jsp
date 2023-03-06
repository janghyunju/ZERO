<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="net.manager.db.*" %>
<%-- <%@ page import="net.boardn.db.*"%> --%>
<%

	List themeList = (List)request.getAttribute("themelist");
	int listcount = ((Integer)request.getAttribute("tlistcount")).intValue();
	int tnowpage = ((Integer)request.getAttribute("tpage")).intValue();
	int tmaxpage = ((Integer)request.getAttribute("tmaxpage")).intValue();
	int tstartpage = ((Integer)request.getAttribute("tstartpage")).intValue();
	int tendpage = ((Integer)request.getAttribute("tendpage")).intValue();
	
	List boardqlist = (List)request.getAttribute("boardqlist");
	int qlistcount = ((Integer)request.getAttribute("qlistcount"));
	int qnowpage = ((Integer)request.getAttribute("qpage"));
	int qmaxpage = ((Integer)request.getAttribute("qmaxpage"));
	int qstartpage = ((Integer)request.getAttribute("qstartpage"));
	int qendpage = ((Integer)request.getAttribute("qendpage"));
	
	List boardrlist = (List)request.getAttribute("boardrlist");
	int rlistcount = ((Integer)request.getAttribute("rlistcount"));
	int rnowpage = ((Integer)request.getAttribute("rpage"));
	int rmaxpage = ((Integer)request.getAttribute("rmaxpage"));
	int rstartpage = ((Integer)request.getAttribute("rstartpage"));
	int rendpage = ((Integer)request.getAttribute("rendpage"));
	
 	List boardnlist = (List)request.getAttribute("boardnlist");
	int nlistcount = ((Integer)request.getAttribute("nlistcount"));
	int nnowpage = ((Integer)request.getAttribute("npage"));
	int nmaxpage = ((Integer)request.getAttribute("nmaxpage"));
	int nstartpage = ((Integer)request.getAttribute("nstartpage"));
	int nendpage = ((Integer)request.getAttribute("nendpage"));
	 
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<title>관리자 게시판</title>
 <link href="resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- 공지게시판 리스트 -->
<table class="table table-dark table-borderless">
		<tr>
			<td>리뷰 게시판</td>
			<td colspan="2" >
				<font>글 개수: ${ nlistcount }</font>
			</td>
		</tr>
		
		<tr>
			<td>
				<div align="left">번호</div>
			</td>
			<td>
				<div align="center">제목</div>
			</td>
				<td>
				<div align="center">날짜</div>
			</td>
				<td>
				<div align="center">조회수</div>
			</td>
		</tr>
		
	 	<%
			for(int i = 0; i < boardnlist.size(); i++) {
				BoardnBean bn = (BoardnBean)boardnlist.get(i);
		%>
		<tr>
			<td>
				<%= bn.getN_num()%>
			</td>
			
			<td>
				<div align="left">

				<a href="./NoticeDetailAction.ma?num=<%=bn.getN_num()%>">
					<%=bn.getN_subject() %>
				</a>
				</div>
			</td>
			
			<td>
				<div align="center"><%=bn.getN_date() %></div>
			</td>
			
			<td>
				<div align="center"><%=bn.getN_readcount() %></div>
			</td>
		</tr>
		<% } %> 
		<tr align="center">
			<td>
				<% if (nnowpage <= 1) { %>
				[이전]&nbsp;
				<% } else {  %>
				<a href="./ManagerList.ma?npage=<%=nnowpage-1 %>">[이전]</a>&nbsp;
				<% } %>
				
				<%for (int a = nstartpage; a <= nendpage; a++) { 
					if (a == nnowpage) {%>
					[<%=a %>]
					<% } else { %>
					<a href="./ManagerList.ma?npage=<%=a %>">[<%=a %>]</a>
					&nbsp;
					<% } %>
				<% } %>
				
				<% if (nnowpage >= nmaxpage) { %>
				[다음]
				<% } else { %>
				<a href="./ManagerList.ma?npage=<%=nnowpage + 1 %>">[다음]</a>
				<% } %>
			</td>
		</tr>
		<tr align="right">
			<td colspan="5">
				<a href="./BoardnWrite.ma">[공지계시판 글쓰기]</a>
			</td>
		</tr>		
	</table>
	<br>
	<br>


<!-- 리뷰게시판 리스트 -->
	<table class="table table-dark table-borderless">
		<tr>
			<td>리뷰 게시판</td>
			<td colspan="2" >
				<font>글 개수: ${ rlistcount }</font>
			</td>
		</tr>
		
		<tr>
			<td>
				<div align="left">번호</div>
			</td>
			<td>
				<div align="center">제목</div>
			</td>
				<td>
				<div align="center">작성자</div>
			</td>
				<td>
				<div align="center">날짜</div>
			</td>
				<td>
				<div align="center">조회수</div>
			</td>
		</tr>
		
		<%
			for(int i = 0; i < boardrlist.size(); i++) {
				BoardrBean br = (BoardrBean)boardrlist.get(i);
		%>
		<tr>
			<td>
				<%= br.getR_num() %>
			</td>
			
			<td>
				<div align="left">

				<a href="./BoardrDetailAction.mb?num=<%=br.getR_num()%>">
					<%=br.getR_subject() %>
				</a>
				</div>
			</td>
			
			<td>
				<div align="center"><%=br.getR_id() %></div>
			</td>
			
			<td>
				<div align="center"><%=br.getR_date() %></div>
			</td>
			
			<td>
				<div align="center"><%=br.getR_readcount() %></div>
			</td>
		</tr>
		<% } %>
		<tr align="center">
			<td>
				<% if (rnowpage <= 1) { %>
				[이전]&nbsp;
				<% } else {  %>
				<a href="./ManagerList.ma?rpage=<%=rnowpage-1 %>">[이전]</a>&nbsp;
				<% } %>
				
				<%for (int a = rstartpage; a <= rendpage; a++) { 
					if (a == rnowpage) {%>
					[<%=a %>]
					<% } else { %>
					<a href="./ManagerList.ma?rpage=<%=a %>">[<%=a %>]</a>
					&nbsp;
					<% } %>
				<% } %>
				
				<% if (rnowpage >= rmaxpage) { %>
				[다음]
				<% } else { %>
				<a href="./ManagerList.ma?rpage=<%=rnowpage + 1 %>">[다음]</a>
				<% } %>
			</td>
		</tr>
	</table>
	<br>
	<br>
	
<!-- qna 게시판 리스트  -->

<table class="table table-dark table-borderless">
		<tr>
			<td>qna 게시판</td>
			<td colspan="2">
				<font size="2">글 개수: ${ qlistcount }</font>
			</td>
		</tr>
		
		<tr>
			<td>
				<div align="left">번호</div>
			</td>
			<td>
				<div align="center">제목</div>
			</td>
				<td>
				<div align="center">작성자</div>
			</td>
				<td>
				<div align="center">날짜</div>
			</td>
				<td>
				<div align="center">조회수</div>
			</td>
		</tr>
		
		<%
			for(int i = 0; i < boardqlist.size(); i++) {
				BoardqBean bq = (BoardqBean)boardqlist.get(i);
		%>
		<tr>
			<td>
				<%= bq.getQ_num() %>
			</td>
			
			<td>
				<div align="center">
				<%if(bq.getQ_re_lev() != 0){ %>
					<%for(int a = 0; a <= bq.getQ_re_lev() * 2; a++){ %>
					&nbsp;
					<% } %>
					▶
				<% } else { %>
					
				<% } %>
				<a href="./BoardqDetailAction.mb?num=<%=bq.getQ_num() %>">
					<%=bq.getQ_subject() %>
				</a>
				</div>
			</td>
			
			<td>
				<div align="center"><%=bq.getQ_id() %></div>
			</td>
			
			<td>
				<div align="center"><%=bq.getQ_date() %></div>
			</td>
			
			<td>
				<div align="center"><%=bq.getQ_readcount() %></div>
			</td>
		</tr>
		<% } %>
		<tr align="center">
			<td colspan="7">
				<% if (qnowpage <= 1) { %>
				[이전]&nbsp;
				<% } else {  %>
				<a href="./ManagerList.ma?qpage=<%=qnowpage-1 %>">[이전]</a>&nbsp;
				<% } %>
				
				<%for (int a = qstartpage; a <= qendpage; a++) { 
					if (a == qnowpage) {%>
					[<%=a %>]
					<% } else { %>
					<a href="./ManagerList.ma?qpage=<%=a %>">[<%=a %>]</a>
					&nbsp;
					<% } %>
				<% } %>
				
				<% if (qnowpage >= qmaxpage) { %>
				[다음]
				<% } else { %>
				<a href="./ManagerList.ma?qpage=<%=qnowpage + 1 %>">[다음]</a>
				<% } %>
			</td>
		</tr>
	</table>
	<br>
	<br>


<!-- 테마 리스트 -->
	<table class="table table-dark table-borderless">
		<tr>
			<td colspan="3">등록한 테마</td>
			<td colspan="2" align="center">
				<font>글 개수: ${ tlistcount }</font>
			</td>
		</tr>
		
		<tr>
			<td>
				<div align="left">테마번호</div>
			</td>
			<td>
				<div align="center">테마 사진</div>
			</td>
			<td>
				<div align="center">테마이름</div>
			</td>
			<td>
				<div align="center">난이도</div>
			</td>
				<td>
				<div align="center">설명</div>
			</td>
		</tr>
		
		<%
			for(int i = 0; i < themeList.size(); i++) {
				ManagerBean tl = (ManagerBean)themeList.get(i);
		%>
		<tr>
			<td>
				<%= tl.getP_NUM() %>
			</td>
			
			<td>
				<div align="center">
				<img src="themeupload/<%=tl.getP_FILE()%>">
				</div>
			</td>
			
			
			<td>
				<div align="center">
				<a href="./ThemeDetailAction.ma?num=<%=tl.getP_NUM() %>">
					<%=tl.getP_NAME() %>
				</a>
				</div>
			</td>
			
			
			<td>
				<div align="center"><%=tl.getP_LEVEL() %></div>
			</td>
			
			<td>
				<div><%=tl.getP_CONTENT() %></div>
			</td>
		</tr>
		<% } %>
		<tr align="center">
			<td>
				<% if (tnowpage <= 1) { %>
				[이전]&nbsp;
				<% } else {  %>
				<a href="./ManagerList.ma?page=<%=tnowpage-1 %>">[이전]</a>&nbsp;
				<% } %>
				
				<%for (int a = tstartpage; a <= tendpage; a++) { 
					if (a == tnowpage) {%>
					[<%=a %>]
					<% } else { %>
					<a href="./ManagerList.ma?page=<%=a %>">[<%=a %>]</a>
					&nbsp;
					<% } %>
				<% } %>
				
				<% if (tnowpage >= tmaxpage) { %>
				[다음]
				<% } else { %>
				<a href="./ManagerList.ma?page=<%=tnowpage + 1 %>">[다음]</a>
				<% } %>
			</td>
		</tr>
		<tr align="right">
			<td colspan="5">
				<a href="./ManagerWrite.ma">[테마 생성]</a>
			</td>
		</tr>		
	</table>
</body>
</html>