package net.boardn.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.boardn.db.BoardnBean;
import net.boardn.db.BoardnDAO;


public class BoardnDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		
		BoardnDAO boarddao = new BoardnDAO();
		BoardnBean boarddata = new BoardnBean();
		
		int num = Integer.parseInt(request.getParameter("n_num"));
	//	boarddao.setReadCountUpdate(num);   //readcount없으니까 각주처리하는거 맞겠지?
		boarddata = boarddao.getDetail(num);
		
		if (boarddata == null) {
			System.out.println("상세보기 실패");
			return null;
		}
		System.out.println("상세보기 성공");
		
		request.setAttribute("boarddata", boarddata);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./boardn/n_board_view.jsp");
		
		return forward;
	}

}
