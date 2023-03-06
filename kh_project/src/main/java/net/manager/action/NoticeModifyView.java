package net.manager.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.manager.db.BoardnBean;
import net.manager.db.ManagerDAO;

public class NoticeModifyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		
		ManagerDAO managerdao = new ManagerDAO();
		BoardnBean boardndata = new BoardnBean();
		
		int num = Integer.parseInt(request.getParameter("num"));
		boardndata = managerdao.getnDetail(num);
		
		if (boardndata == null) {
			System.out.println("(수정) 상세보기 실패");
			return null;
		}
		
		System.out.println("(수정) 상세보기 성공");
		
		request.setAttribute("boardndata", boardndata);
		forward.setRedirect(false);
		forward.setPath("./manager/manager_nmodify.jsp");
		return forward;
		
	}

}
