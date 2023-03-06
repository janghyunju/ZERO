package net.manager.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.manager.db.BoardqBean;
import net.manager.db.MboardDAO;

public class BoardqReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		
		MboardDAO mboarddao = new MboardDAO();
		BoardqBean boardqdata = new BoardqBean();
		
		int result = 0;
		
		boardqdata.setQ_num(Integer.parseInt(request.getParameter("Q_NUM")));
		boardqdata.setQ_id(request.getParameter("Q_ID"));
		boardqdata.setQ_subject(request.getParameter("Q_SUBJECT"));
		boardqdata.setQ_content(request.getParameter("Q_CONTENT"));
		boardqdata.setQ_re_ref(Integer.parseInt(request.getParameter("Q_RE_REF")));
		boardqdata.setQ_re_lev(Integer.parseInt(request.getParameter("Q_RE_LEV")));
		boardqdata.setQ_re_seq(Integer.parseInt(request.getParameter("Q_RE_SEQ")));
		
		result = mboarddao.boardqReply(boardqdata);
		if (result==0) {
			System.out.println("답글 실패");
			return null;
		}
		System.out.println("답글 완료");
		
		forward.setRedirect(true);
		forward.setPath("./BoardqDetailAction.mb?num=" + result);
		return forward;
	}

	

}
