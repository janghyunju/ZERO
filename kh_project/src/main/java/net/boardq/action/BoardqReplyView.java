package net.boardq.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.boardq.db.BoardqBean;
import net.boardq.db.BoardqDAO;


public class BoardqReplyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		
		BoardqDAO boarddao=new BoardqDAO();
		BoardqBean boarddata=new BoardqBean();
		int result=0;
		
		boarddata.setQ_num(Integer.parseInt(request.getParameter("q_num")));
		boarddata.setQ_id(request.getParameter("q_id"));
		boarddata.setQ_subject(request.getParameter("q_subject"));
		boarddata.setQ_content(request.getParameter("q_content"));
		boarddata.setQ_re_ref(Integer.parseInt(request.getParameter("q_re_ref")));
		boarddata.setQ_re_lev(Integer.parseInt(request.getParameter("q_re_lev")));
		boarddata.setQ_re_seq(Integer.parseInt(request.getParameter("q_re_seq")));
		
		result=boarddao.boardReply(boarddata);
		if(result==0) {
			System.out.println("답변글 작성 실패");
			return null;
		}
		System.out.println("답변글 성공");
		
		forward.setRedirect(true);
		forward.setPath("./BoardqDetailAction.bo?q_num="+result);
		return forward;
		
	}

}
