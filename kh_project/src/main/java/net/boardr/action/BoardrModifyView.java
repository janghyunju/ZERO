package net.boardr.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.boardr.db.BoardrBean;
import net.boardr.db.BoardrDAO;



public class BoardrModifyView implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
	throws Exception{
		
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		
		BoardrDAO boarddao=new BoardrDAO();
		BoardrBean boarddata=new BoardrBean();
		
		int num=Integer.parseInt(request.getParameter("r_num"));
		boarddata=boarddao.getDetail(num);
		
		if(boarddata==null) {
			System.out.println("(수정)상세보기 실패");
			return null;
		}
		System.out.println("(수정)상세보기 성공");
		
		request.setAttribute("boarddata", boarddata);
		forward.setRedirect(false);
		forward.setPath("./boardr/r_board_modify.jsp");
		
		return forward;
	}
}
