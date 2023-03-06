package net.boardr.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.boardr.db.BoardrBean;
import net.boardr.db.BoardrDAO;

public class BoardrAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		BoardrDAO boardqdao = new BoardrDAO();
		BoardrBean boardrbean = new BoardrBean();
		ActionForward forward = new ActionForward();
		
		String r_id = (String)request.getSession().getAttribute("id");
		
		boardrbean.setR_id(r_id);
		String subject = request.getParameter("r_subject");
		String content = request.getParameter("r_content");

		boardrbean.setR_subject(subject);
		boardrbean.setR_content(content);
		
		boolean result = boardqdao.boardInsert(boardrbean);
		
		if(result == false) {
			System.out.println("게시판 등록 실패");
			return null;
		}
		System.out.println("게시판 등록 완료");
		
		forward.setRedirect(true);
		forward.setPath("./BoardrList.re");
		return forward;
	}

}
