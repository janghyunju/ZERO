package net.manager.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.manager.db.BoardrBean;
import net.manager.db.MboardDAO;

public class BoardrDetailAction implements Action {


	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		MboardDAO mboarddao = new MboardDAO();
		BoardrBean boardrdata = new BoardrBean();
		
		int num = Integer.parseInt(request.getParameter("num"));
		mboarddao.setReadCountrUpdate(num);
		boardrdata = mboarddao.getrDetail(num);

		if (boardrdata == null) {
			System.out.println("리뷰상세보기 실패");
			return null;
		}
		System.out.println("리뷰상세보기 성공");

		request.setAttribute("boardrdata", boardrdata);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./manager/mboard_rdetail.jsp");
		return forward;

	}
}