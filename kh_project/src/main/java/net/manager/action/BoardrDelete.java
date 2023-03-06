package net.manager.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.manager.db.ManagerDAO;
import net.manager.db.MboardDAO;

public class BoardrDelete implements Action {

	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		boolean result = false;
		int num = Integer.parseInt(request.getParameter("num"));

		MboardDAO mboarddao = new MboardDAO();


		result = mboarddao.mboardrDelete(num);
		if (result == false) {
			System.out.println("리뷰 삭제 실패");
			return null;
		}

		System.out.println("리뷰 삭제 성공");
		forward.setRedirect(true);
		forward.setPath("./ManagerList.ma");
		return forward;
	
	}

}
