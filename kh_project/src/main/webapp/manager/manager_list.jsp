<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="net.manager.db.*"%>

<%
List themeList = (List) request.getAttribute("themelist");
int listcount = ((Integer) request.getAttribute("tlistcount")).intValue();
int tnowpage = ((Integer) request.getAttribute("tpage")).intValue();
int tmaxpage = ((Integer) request.getAttribute("tmaxpage")).intValue();
int tstartpage = ((Integer) request.getAttribute("tstartpage")).intValue();
int tendpage = ((Integer) request.getAttribute("tendpage")).intValue();

List boardqlist = (List) request.getAttribute("boardqlist");
int qlistcount = ((Integer) request.getAttribute("qlistcount"));
int qnowpage = ((Integer) request.getAttribute("qpage"));
int qmaxpage = ((Integer) request.getAttribute("qmaxpage"));
int qstartpage = ((Integer) request.getAttribute("qstartpage"));
int qendpage = ((Integer) request.getAttribute("qendpage"));

List boardrlist = (List) request.getAttribute("boardrlist");
int rlistcount = ((Integer) request.getAttribute("rlistcount"));
int rnowpage = ((Integer) request.getAttribute("rpage"));
int rmaxpage = ((Integer) request.getAttribute("rmaxpage"));
int rstartpage = ((Integer) request.getAttribute("rstartpage"));
int rendpage = ((Integer) request.getAttribute("rendpage"));

List boardnlist = (List) request.getAttribute("boardnlist");
int nlistcount = ((Integer) request.getAttribute("nlistcount"));
int nnowpage = ((Integer) request.getAttribute("npage"));
int nmaxpage = ((Integer) request.getAttribute("nmaxpage"));
int nstartpage = ((Integer) request.getAttribute("nstartpage"));
int nendpage = ((Integer) request.getAttribute("nendpage"));
%>



<!doctype html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지</title>
<style type="text/css">
.margin {
	margin-right: 20px;
}
</style>
<!--   <link 기본코드
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
    rel="stylesheet" 
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" 
    crossorigin="anonymous"> -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css"
	integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/flickity/1.0.0/flickity.css" />
</head>
<body class="p-3 mb-2 text-white" style="background-color: #0a0a0a">
	<header class="p-3 mb-2 text-white" style="background-color: #0a0a0a">
		<jsp:include page="../include/menubar.jsp"></jsp:include>
	</header>
	<br>
	<br>
	<br>
	<!-- 공지 게시판 -->
	<div class="container text-center">
		<div class="row">
			<div class="col">
				<table class="table">
					<thead class="table table-striped">
						<h1>Notice</h1>
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<a href="./BoardnWrite.ma"><button type="button"
									class="btn btn-primary" style="background-color: #c6734a">공지등록</button></a>
						</div>
						<td style="font-family: Tahoma; font-size: 10pt" width="8%"
							height="26">
							<div align="center">번호</div>
						</td>
						<td style="font-family: Tahoma; font-size: 10pt" width="50%">
							<div align="center">제목</div>
						</td>
						<td style="font-family: Tahoma; font-size: 10pt" width="14%">
							<div align="center">날짜</div>
						</td>
						<td style="font-family: Tahoma; font-size: 10pt" width="17%">
							<div align="center">조회수</div>
						</td>
					</thead>
					<%
					for (int i = 0; i < boardnlist.size(); i++) {
						BoardnBean bn = (BoardnBean) boardnlist.get(i);
					%>
					<tbody>
						<td style="font-family: Tahoma; font-size: 10pt" width="8%"
							height="26">
							<div align="center"><%=bn.getN_num()%></div>
						</td>
						<td style="font-family: Tahoma; font-size: 10pt" width="50%">
							<div align="center">
								<a href="./NoticeDetailAction.ma?num=<%=bn.getN_num()%>"> <%=bn.getN_subject()%>
								</a>
							</div>
						</td>
						<td style="font-family: Tahoma; font-size: 10pt" width="14%">
							<div align="center"><%=bn.getN_date()%></div>
						</td>
						<td style="font-family: Tahoma; font-size: 10pt" width="17%">
							<div align="center"><%=bn.getN_readcount()%></div>
						</td>
					</tbody>
					<%
					}
					%>
				</table>
				<div>
					<ul class="pagination justify-content-center">
						<%
						if (nnowpage <= 1) {
						%>
						<li class="page-item disabled"><a href="#" class="page-link"
							href="#">&laquo;</a></li>
						<%
						} else {
						%>
						<li class="page-item"><a class="page-link"
							href="./ManagerList.ma?npage=<%=nnowpage - 1%>">&laquo;</a></li>
						<%
						}
						%>
						<%
						for (int a = nstartpage; a <= nendpage; a++) {
							if (a == nnowpage) {
						%>
						<li class="page-item active"><a class="page-link" href="#"><%=a%></a>
						</li>
						<%
						} else {
						%>
						<li class="page-item"><a href="./ManagerList.ma?npage=<%=a%>"
							class="page-link"><%=a%></a></li>
						<%
						}
						%>
						<%
						}
						%>

						<%
						if (nnowpage >= nmaxpage) {
						%>
						<li class="page-item"><a class="page-link" href="#">&raquo;</a>
						</li>
						<%
						} else {
						%>
						<li class="page-item"><a class="page-link"
							href="./ManagerList.ma?npage=<%=nnowpage + 1%>">&raquo;</a></li>
						<%
						}
						%>
					</ul>
				</div>

			</div>

			<!-- 리뷰게시판 -->
			<div class="container text-center">
				<div class="row">
					<div class="col">
						<table class="table">
							<thead class="table table-striped">
								<h1>Review</h1>
								<td style="font-family: Tahoma; font-size: 9pt" width="8%"
									height="26">
									<div align="center">번호</div>
								</td>
								<td style="font-family: Tahoma; font-size: 9pt" width="30%">
									<div align="center">제목</div>
								</td>
								<td style="font-family: Tahoma; font-size: 9pt" width="14%">
									<div align="center">작성자</div>
								</td>
								<td style="font-family: Tahoma; font-size: 9pt" width="20%">
									<div align="center">날짜</div>
								</td>
								<td style="font-family: Tahoma; font-size: 9pt" width="11%">
									<div align="center">조회수</div>
								</td>
							</thead>
							<%
							for (int i = 0; i < boardrlist.size(); i++) {
								BoardrBean br = (BoardrBean) boardrlist.get(i);
							%>
							<tbody>
								<td style="font-family: Tahoma; font-size: 9pt" width="8%"
									height="26">
									<div align="center"><%=br.getR_num()%></div>
								</td>
								<td style="font-family: Tahoma; font-size: 9pt" width="30%">
									<div align="center">
										<a href="./BoardrDetailAction.mb?num=<%=br.getR_num()%>">
											<%=br.getR_subject()%>
										</a>
									</div>
								</td>
								<td style="font-family: Tahoma; font-size: 9pt" width="14%">
									<div align="center"><%=br.getR_id()%></div>
								</td>
								<td style="font-family: Tahoma; font-size: 9pt" width="20%">
									<div align="center"><%=br.getR_date()%></div>
								</td>
								<td style="font-family: Tahoma; font-size: 9pt" width="11%">
									<div align="center"><%=br.getR_readcount()%></div>
								</td>
							</tbody>
							<%
							}
							%>
						</table>
						<div>
							<ul class="pagination justify-content-center">
								<%
								if (rnowpage <= 1) {
								%>
								<li class="page-item disabled"><a href="#"
									class="page-link" href="#">&laquo;</a></li>
								<%
								} else {
								%>
								<li class="page-item"><a class="page-link"
									href="./ManagerList.ma?rpage=<%=rnowpage - 1%>">&laquo;</a></li>
								<%
								}
								%>
								<%
								for (int a = rstartpage; a <= rendpage; a++) {
									if (a == rnowpage) {
								%>
								<li class="page-item active"><a class="page-link" href="#"><%=a%></a>
								</li>
								<%
								} else {
								%>
								<li class="page-item"><a
									href="./ManagerList.ma?rpage=<%=a%>" class="page-link"><%=a%></a>
								</li>
								<%
								}
								%>
								<%
								}
								%>

								<%
								if (rnowpage >= rmaxpage) {
								%>
								<li class="page-item"><a class="page-link" href="#">&raquo;</a>
								</li>
								<%
								} else {
								%>
								<li class="page-item"><a class="page-link"
									href="./ManagerList.ma?rpage=<%=rnowpage + 1%>">&raquo;</a></li>
								<%
								}
								%>
							</ul>
						</div>
					</div>



					<!-- qna 게시판 -->
					<div class="col">
						<table class="table">
							<thead class="table table-striped">
								<h1>Q & A</h1>
								<td style="font-family: Tahoma; font-size: 9pt" width="8%"
									height="26">
									<div align="center">번호</div>
								</td>
								<td style="font-family: Tahoma; font-size: 9pt" width="30%">
									<div align="center">제목</div>
								</td>
								<td style="font-family: Tahoma; font-size: 9pt" width="14%">
									<div align="center">작성자</div>
								</td>
								<td style="font-family: Tahoma; font-size: 9pt" width="20%">
									<div align="center">날짜</div>
								</td>
								<td style="font-family: Tahoma; font-size: 9pt" width="11%">
									<div align="center">조회수</div>
								</td>
							</thead>

							<%
							for (int i = 0; i < boardqlist.size(); i++) {
								BoardqBean bq = (BoardqBean) boardqlist.get(i);
							%>
							<tbody>
								<td style="font-family: Tahoma; font-size: 9pt" width="8%"
									height="26">
									<div align="center"><%=bq.getQ_num()%></div>
								</td>
								<td style="font-family: Tahoma; font-size: 9pt" width="30%">
									<div align="center">
										<%
										if (bq.getQ_re_lev() != 0) {
										%>
										<%
										for (int a = 0; a <= bq.getQ_re_lev() * 2; a++) {
										%>
										&nbsp;
										<%
										}
										%>
										▶
										<%
										} else {
										%>

										<%
										}
										%>
										<a href="./BoardqDetailAction.mb?num=<%=bq.getQ_num()%>">
											<%=bq.getQ_subject()%>
										</a>
									</div>
								</td>
								<td style="font-family: Tahoma; font-size: 9pt" width="14%">
									<div align="center"><%=bq.getQ_id()%></div>
								</td>
								<td style="font-family: Tahoma; font-size: 9pt" width="20%">
									<div align="center"><%=bq.getQ_date()%></div>
								</td>
								<td style="font-family: Tahoma; font-size: 9pt" width="11%">
									<div align="center"><%=bq.getQ_readcount()%></div>
								</td>
							</tbody>
							<%
							}
							%>
						</table>
						<div>
							<ul class="pagination justify-content-center">
								<%
								if (qnowpage <= 1) {
								%>
								<li class="page-item disabled"><a href="#"
									class="page-link" href="#">&laquo;</a></li>
								<%
								} else {
								%>
								<li class="page-item"><a class="page-link"
									href="./ManagerList.ma?qpage=<%=qnowpage - 1%>">&laquo;</a></li>
								<%
								}
								%>
								<%
								for (int a = qstartpage; a <= qendpage; a++) {
									if (a == qnowpage) {
								%>
								<li class="page-item active"><a class="page-link" href="#"><%=a%></a>
								</li>
								<%
								} else {
								%>
								<li class="page-item"><a
									href="./ManagerList.ma?qpage=<%=a%>" class="page-link"><%=a%></a>
								</li>
								<%
								}
								%>
								<%
								}
								%>

								<%
								if (qnowpage >= qmaxpage) {
								%>
								<li class="page-item"><a class="page-link" href="#">&raquo;</a>
								</li>
								<%
								} else {
								%>
								<li class="page-item"><a class="page-link"
									href="./ManagerList.ma?qpage=<%=qnowpage + 1%>">&raquo;</a></li>
								<%
								}
								%>
							</ul>
						</div>
					</div>
				</div>
				<br> <br>



				<h1>Theme</h1>

				<a href="./ManagerWrite.ma"><button type="button"
						class="btn btn-primary" style="background-color: #c6734a">테마등록</button></a>

				<div style="display: flex; height: 60%;">

					<div style="width: 100%; height: 100%; background-color: #0a0a0a">
						<!-- 색깔 바꿔주기 -->
						<div
							style="width: 100%; height: 85%; margin: 0; padding: 0; background-color: #0a0a0a">
							<div style="width: 100%; height: 100%">
								<div class="gallery js-flickity"
									style="width: 100%; height: 550px"
									data-flickity-options='{ "wrapAround": false, "contain": true }'>
									<%
									for (int i = 0; i < themeList.size(); i++) {
										ManagerBean tl = (ManagerBean) themeList.get(i);
									%>
									<!-- 테마1 소개 -->
									<div class="gallery-cell"
										style="height: 100%; background-color: #0a0a0a">
										<div
											style="width: 100%; height: 30%; padding-top: 30px; background-color: #0a0a0a"
											align="center">
											<a href="ThemeDetailAction.ma?num=<%=tl.getP_NUM()%>"><img
												src="themeupload/<%=tl.getP_FILE()%>"
												style="width: 150px; height: 90%"></img></a>
										</div>
										<div
											style="width: 100%; height: 70%; color: #ffffff; font-size: 16pt; font-family: 'Gowun Dodum', sans-serif; background-color: #0a0a0a"
											align="center">
											<%=tl.getP_NAME()%>

											<hr size="5" style="height: 1%; width: 150px"
												font-family: 'Gowun Dodum', sans-serif; color="#ffcc99">
											<div
												style="font-size: 9pt; padding-top: 18px; font-family: 'Gowun Dodum', sans-serif;">
												<%=tl.getP_PRE()%>
											</div>

											<br>
											<hr size="5" style="height: 1%; width: 150px" color="ffcc99">
											<div style="font-size: 13pt; padding-top: 8px;">
												<%=tl.getP_PLACE()%>
											</div>
											<br> <img src="./images/fire<%=tl.getP_LEVEL()%>.png"
												style="height: 5%"></img>
										</div>
									</div>
									<font class="margin"></font>
									<%
									}
									%>
								</div>
							</div>
						</div>
					</div>

				</div>




				<%-- 
				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="card" style="width: 15rem;">
							<img src="a.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">THEME</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
								<a href="/manager_tmodify.jsp" class="btn btn-primary">Modify</a>
								<a href="/ManagerList.ma" class="btn btn-primary">Delete</a>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="card" style="width: 15rem;">
							<img src="a.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">THEME</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
								<a href="#" class="btn btn-primary">Modify</a> <a href="#"
									class="btn btn-primary">Delete</a>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<!-- //col 사이즈를 lg로 나눠줌 한줄 당 크기가 12 라 3으로 나눈다 사이즈가 md일 경우 12 나누기 2 -->
						<div class="card" style="width: 15rem;">
							<img src="a.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">THEME</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
								<a href="#" class="btn btn-primary">Modify</a> <a href="#"
									class="btn btn-primary">Delete</a>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="card" style="width: 15rem;">
							<img src="a.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">THEME</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
								<a href="#" class="btn btn-primary">Modify</a> <a href="#"
									class="btn btn-primary">Delete</a>
							</div>
						</div>
					</div>

				</div>
			</div>


--%>

				<!-- </div>
  <div class="mb-3 mt-3">
    <label for="email" class="form-label">Email:</label>
    <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
  </div>
  <div class="mb-3">
    <label for="pwd" class="form-label">Password:</label>
    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd">
  </div>
  <div class="form-check mb-3">
    <label class="form-check-label">
      <input class="form-check-input" type="checkbox" name="remember"> Remember me
    </label>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
     -->

				<script
					src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
					crossorigin="anonymous"></script>

				<script
					src="//cdnjs.cloudflare.com/ajax/libs/flickity/1.0.0/flickity.pkgd.js"></script>
</body>
</html>