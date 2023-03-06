package net.manager.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.ast.TrueLiteral;

import net.manager.db.BoardnBean;
import net.manager.db.ManagerDAO;
import oracle.net.aso.r;

public class NoticeModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		boolean result = false;
		
		int num = Integer.parseInt(request.getParameter("N_NUM"));
		
		ManagerDAO managerdao = new ManagerDAO();
		BoardnBean boardnbean = new BoardnBean();
		
		try {
			
			boardnbean.setN_num(num);  
			boardnbean.setN_subject(request.getParameter("N_SUBJECT")); 
			boardnbean.setN_date(request.getParameter("N_DATE")); 
			boardnbean.setN_content(request.getParameter("N_CONTENT"));
			boardnbean.setN_file(request.getParameter("N_FILE")); 
			
			result = managerdao.noticeModify(boardnbean); 
			if (result == false) {
				System.out.println("수정 실패");
				return null;
			}
			System.out.println("수정 완료");
			
			forward.setRedirect(true);
			forward.setPath("./NoticeDetailAction.ma?num=" + boardnbean.getN_num()); 
			return forward;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}