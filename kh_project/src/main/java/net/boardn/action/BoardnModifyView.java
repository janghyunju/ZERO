package net.boardn.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.boardn.db.BoardnBean;
import net.boardn.db.BoardnDAO;



public class BoardnModifyView implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
	throws Exception{
		
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		
		BoardnDAO boarddao=new BoardnDAO();
		BoardnBean boarddata=new BoardnBean();
		
		int num=Integer.parseInt(request.getParameter("n_num"));
		boarddata=boarddao.getDetail(num);
		
		if(boarddata==null) {
			System.out.println("(수정)상세보기 실패");
			return null;
		}
		System.out.println("(수정)상세보기 성공");
		
		request.setAttribute("boarddata", boarddata);
		forward.setRedirect(false);
		forward.setPath("./boardn/n_board_modify.jsp");
		
		return forward;
	}
}
