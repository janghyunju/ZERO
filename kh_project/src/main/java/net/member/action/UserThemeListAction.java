package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.manager.db.ManagerBean;
import net.manager.db.ManagerDAO;

public class UserThemeListAction implements Action {
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		ManagerDAO managerdao = new ManagerDAO();
		ManagerBean themedata = new ManagerBean();
		
		int num = Integer.parseInt(request.getParameter("num"));
		themedata = managerdao.getDetail(num);
		
		if (themedata == null) {
			System.out.println("상세보기 실패");
			return null;
		}
		System.out.println("상세보기 성공");
		
		request.setAttribute("themedata", themedata);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/userThemeList.jsp");
		return forward;
	
	}
}
