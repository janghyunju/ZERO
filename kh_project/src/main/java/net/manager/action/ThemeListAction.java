package net.manager.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.manager.db.ManagerDAO;

public class ThemeListAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();

		ManagerDAO managerdao = new ManagerDAO();
		List themelist = new ArrayList();
		List boardrlist = new ArrayList();
		List boardqlist = new ArrayList();
		List boardnlist = new ArrayList();

		// 테마 게시판
		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int listcount = managerdao.getListCount(); // 총 리스트 수 받아옴
		themelist = managerdao.getthemelist(page, limit); // 리트스를 받아옴

		// 총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림처리

		// 현제 페이지에 보여줄 시작 페이지수 1, 11, 21 드
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지수 10, 20, 30, 등
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		// 리뷰 게시판
		int rpage = 1;
		int rlimit = 3;

		if (request.getParameter("rpage") != null) {
			rpage = Integer.parseInt(request.getParameter("rpage"));
		}

		int rlistcount = managerdao.getrListCount(); // 총 리스트 수 받아옴
		boardrlist = managerdao.getboardrlist(rpage, rlimit); // 리트스를 받아옴

		// 총 페이지 수
		int rmaxpage = (int) ((double) rlistcount / rlimit + 0.95); // 0.95를 더해서 올림처리

		// 현제 페이지에 보여줄 시작 페이지수 1, 11, 21 드
		int rstartpage = (((int) ((double) rpage / 10 + 0.9)) - 1) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지수 10, 20, 30, 등
		int rendpage = rmaxpage;

		if (rendpage > rstartpage + 10 - 1)
			rendpage = rstartpage + 10 - 1;

		// qna 게시판
		int qpage = 1;
		int qlimit = 3;

		if (request.getParameter("qpage") != null) {
			qpage = Integer.parseInt(request.getParameter("qpage"));
		}

		int qlistcount = managerdao.getqListCount(); // 총 리스트 수 받아옴
		boardqlist = managerdao.getboardqlist(qpage, qlimit); // 리트스를 받아옴

		// 총 페이지 수
		int qmaxpage = (int) ((double) qlistcount / qlimit + 0.95); // 0.95를 더해서 올림처리

		// 현제 페이지에 보여줄 시작 페이지수 1, 11, 21 드
		int qstartpage = (((int) ((double) qpage / 10 + 0.9)) - 1) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지수 10, 20, 30, 등
		int qendpage = qmaxpage;

		if (qendpage > qstartpage + 10 - 1)
			qendpage = qstartpage + 10 - 1;

		// 공지 게시판
		int npage = 1;
		int nlimit = 3;

		if (request.getParameter("npage") != null) {
			npage = Integer.parseInt(request.getParameter("npage"));
		}

		int nlistcount = managerdao.getnListCount(); // 총 리스트 수 받아옴
		boardnlist = managerdao.getboardnlist(npage, nlimit); // 리트스를 받아옴

		// 총 페이지 수
		int nmaxpage = (int) ((double) nlistcount / nlimit + 0.95); // 0.95를 더해서 올림처리

		// 현제 페이지에 보여줄 시작 페이지수 1, 11, 21 드
		int nstartpage = (((int) ((double) npage / 10 + 0.9)) - 1) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지수 10, 20, 30, 등
		int nendpage = nmaxpage;

		if (nendpage > nstartpage + 10 - 1)
			nendpage = nstartpage + 10 - 1;

		request.setAttribute("tpage", page); // 현제 페이지수
		request.setAttribute("tmaxpage", maxpage);
		request.setAttribute("tstartpage", startpage);
		request.setAttribute("tendpage", endpage);
		request.setAttribute("tlistcount", listcount);
		request.setAttribute("themelist", themelist);

		request.setAttribute("rpage", rpage); // 현제 페이지수
		request.setAttribute("rmaxpage", rmaxpage);
		request.setAttribute("rstartpage", rstartpage);
		request.setAttribute("rendpage", rendpage);
		request.setAttribute("rlistcount", rlistcount);
		request.setAttribute("boardrlist", boardrlist);

		request.setAttribute("qpage", qpage); // 현제 페이지수
		request.setAttribute("qmaxpage", qmaxpage);
		request.setAttribute("qstartpage", qstartpage);
		request.setAttribute("qendpage", qendpage);
		request.setAttribute("qlistcount", qlistcount);
		request.setAttribute("boardqlist", boardqlist);
		
		request.setAttribute("npage", npage); // 현제 페이지수
		request.setAttribute("nmaxpage", nmaxpage);
		request.setAttribute("nstartpage", nstartpage);
		request.setAttribute("nendpage", nendpage);
		request.setAttribute("nlistcount", nlistcount);
		request.setAttribute("boardnlist", boardnlist);

		forward.setRedirect(false);
		forward.setPath("./manager/manager_list.jsp");
		return forward;
	}

}