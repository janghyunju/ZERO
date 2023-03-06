package net.boardr.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.boardn.db.BoardnDAO;
import net.boardr.db.BoardrDAO;

public class BoardrListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("id");

		if (id == null) {
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");

			return forward;
		}

		BoardrDAO boarddao = new BoardrDAO();
		BoardnDAO boardndao = new BoardnDAO(); //공지사항을 리뷰게시판에 띄울 것이므로 새로 받는다
		
		List boardlist = new ArrayList();
		List boardnlist = new ArrayList(); //공지사항을 리뷰게시판에 띄울 것이므로 새로 받는다
		
		int page = 1;
		int limit = 10;

		if (request.getParameter("r_page") != null) {
			page = Integer.parseInt(request.getParameter("r_page"));
		}

		int listcount = boarddao.getListCount(); // 총 리스트 수 받아옴
		
		boardlist = boarddao.getBoardList(page, limit); // 리스트를 받아옴
		boardnlist = boardndao.getBoardList(1, 2); //공지사항은 첫 페이지에서 두개만 받아올 것
		
		// 총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림 처리

		// 현재 페이지에 보여줄 시작 페이지 수 1, 11, 21 등
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수 10, 20, 30 등
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		request.setAttribute("r_page", page); // 현재 페이지 수
		request.setAttribute("r_maxpage", maxpage); // 최대 페이지 수
		request.setAttribute("r_startpage", startpage); // 현재 페이지에 표시할 첫 페이지 수
		request.setAttribute("r_endpage", endpage); // 현재 페이지에 표시할 끝 페이지 수
		request.setAttribute("r_listcount", listcount); // 글 수
		request.setAttribute("r_boardlist", boardlist);
		request.setAttribute("r_notice", boardnlist); //공지사항을 리뷰게시판에 띄울 것이므로

		forward.setRedirect(false);
		forward.setPath("./boardr/r_board_list.jsp");
		return forward;
	}
}
