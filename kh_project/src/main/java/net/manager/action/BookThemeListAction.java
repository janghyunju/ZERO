package net.manager.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.manager.db.ManagerDAO;

public class BookThemeListAction  implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		ManagerDAO managerdao = new ManagerDAO();
		HttpSession session = request.getSession();
		
		List themelist = new ArrayList();
		String id = (String)session.getAttribute("id");
		
		int page = 1;
		int limit = 10;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		themelist = managerdao.getthemelist(page, limit);
		
		request.setAttribute("themelist", themelist);
		session.setAttribute("id", id);
		
		forward.setRedirect(false);
		forward.setPath("./book/bookForm.jsp");
		return forward;
	}

}
