package net.manager.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.manager.db.ManagerBean;
import net.manager.db.ManagerDAO;

public class ThemeModifyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		
		ManagerDAO managerdao = new ManagerDAO();
		ManagerBean managerdata = new ManagerBean();
		
		int num = Integer.parseInt(request.getParameter("num"));
		managerdata = managerdao.getDetail(num);
		
		if (managerdata == null) {
			System.out.println("(수정)상세보기 실패");
			return null;
		}
		System.out.println("(수정)상세보기 성공");
		
		request.setAttribute("managerdata", managerdata);
		forward.setRedirect(false);
		forward.setPath("./manager/manager_tmodify.jsp");
		return forward;
	}

}
