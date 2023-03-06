package net.boardr.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.boardq.db.BoardqBean;
import net.boardq.db.BoardqDAO;
import net.boardr.db.BoardrBean;
import net.boardr.db.BoardrDAO;



public class BoardrDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		
		BoardrDAO boarddao = new BoardrDAO();
		BoardrBean boarddata = new BoardrBean();
		
		int num = Integer.parseInt(request.getParameter("r_num"));
		boarddao.setReadCountUpdate(num);
		boarddata = boarddao.getDetail(num);
		
		if (boarddata == null) {
			System.out.println("상세보기 실패");
			return null;
		}
		System.out.println("상세보기 성공");
		
		request.setAttribute("boarddata", boarddata);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./boardr/r_board_view.jsp");
		
		return forward;
	}

}
