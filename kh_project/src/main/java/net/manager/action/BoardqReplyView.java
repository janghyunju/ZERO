package net.manager.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.manager.db.BoardqBean;
import net.manager.db.MboardDAO;

public class BoardqReplyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		
		MboardDAO mboarddao = new MboardDAO();
		BoardqBean boardqdata = new BoardqBean();
		
		int num = Integer.parseInt(request.getParameter("num")); 
		
		boardqdata = mboarddao.getqDetail(num); 
		
		if (boardqdata == null) {
			System.out.println("답장 페이지 이동 실패");
			return null;
		}
		System.out.println("답장 페이지 이동 완료");
		 
		request.setAttribute("boardqdata", boardqdata);
		
		forward.setRedirect(false);
		forward.setPath("./manager/manager_qreply.jsp");
		
		return forward;
	}

}
