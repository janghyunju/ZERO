package net.manager.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.manager.db.BoardqBean;
import net.manager.db.BoardrBean;
import net.manager.db.MboardDAO;

public class BoardqDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");

		MboardDAO mboarddao = new MboardDAO();
		BoardqBean boardqdata = new BoardqBean();

		int num = Integer.parseInt(request.getParameter("num"));
		mboarddao.setReadCountqUpdate(num);
		boardqdata = mboarddao.getqDetail(num);

		if (boardqdata == null) {
			System.out.println("(qna)상세보기 실패");
			return null;
		}
		System.out.println("(qna)상세보기 성공");

		request.setAttribute("boardqdata", boardqdata);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./manager/mboard_qdetail.jsp");
		return forward;
	}
}
