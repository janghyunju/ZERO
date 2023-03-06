package net.boardq.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.boardq.db.BoardqBean;
import net.boardq.db.BoardqDAO;


public class BoardqReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			ActionForward forward = new ActionForward();
			
			BoardqDAO boarddao=new BoardqDAO();
			BoardqBean boarddata=new BoardqBean();
			
			int num=Integer.parseInt(request.getParameter("q_num"));
			
			boarddata=boarddao.getDetail(num);
			
			if(boarddata==null) {
				System.out.println("답변글 작성 실패");
				return null;
			}
			System.out.println("답변글 작성~~~");
			
			request.setAttribute("boarddata", boarddata);
			
			forward.setRedirect(false);
			forward.setPath("./boardq/q_board_reply.jsp");
			return forward;
	}

}
