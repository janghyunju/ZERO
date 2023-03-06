package net.manager.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.manager.db.ManagerDAO;

public class NoticeDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		boolean result = false;
		int num = Integer.parseInt(request.getParameter("num"));

		ManagerDAO managerdao = new ManagerDAO();


		result = managerdao.NoticeDelete(num);
		if (result == false) {
			System.out.println("공지 삭제 실패");
			return null;
		}

		System.out.println("공지 삭제 성공");
		forward.setRedirect(true);
		forward.setPath("./ManagerList.ma");
		return forward;

	}
}

