package net.manager.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.manager.db.ManagerDAO;

public class IndexListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		ManagerDAO managerdao = new ManagerDAO();
		
		List themelist = new ArrayList();
		
		int page = 1;
		int limit = 10;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		themelist = managerdao.getthemelist(page, limit);
		
		request.setAttribute("themelist", themelist);
		
		forward.setRedirect(false);
		forward.setPath("./main.jsp");
		return forward;
	}

}
