package net.manager.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.manager.db.ManagerDAO;



public class ThemeDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		boolean result = false;
		int num = Integer.parseInt(request.getParameter("num"));

		ManagerDAO managerdao = new ManagerDAO();


		result = managerdao.ThemeDelete(num);
		if (result == false) {
			System.out.println("테마 삭제 실패");
			return null;
		}

		System.out.println("테마 삭제 성공");
		forward.setRedirect(true);
		forward.setPath("./ManagerList.ma");
		return forward;
	}

}
