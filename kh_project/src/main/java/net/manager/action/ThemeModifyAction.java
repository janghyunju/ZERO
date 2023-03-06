package net.manager.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.manager.db.ManagerBean;
import net.manager.db.ManagerDAO;

public class ThemeModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		boolean result = false;
	
		int num = Integer.parseInt(request.getParameter("P_NUM"));
	
		
		ManagerDAO managerdao = new ManagerDAO();
		ManagerBean managerbean = new ManagerBean();
		
	
		try {
			managerbean.setP_NUM(num);  
			managerbean.setP_NAME(request.getParameter("P_NAME")); 
			managerbean.setP_LEVEL(Integer.parseInt(request.getParameter("P_LEVEL")));
			managerbean.setP_CONTENT(request.getParameter("P_CONTENT"));
			managerbean.setP_PRE(request.getParameter("P_PRE"));
			managerbean.setP_PLACE(request.getParameter("P_PLACE"));
			managerbean.setP_FILE(request.getParameter("P_FILE")); 
			
			result = managerdao.themeModify(managerbean); 
			if (result == false) {
				System.out.println("수정 실패");
				return null;
			}
			System.out.println("수정 완료");
			
			forward.setRedirect(true);
			forward.setPath("./ThemeDetailAction.ma?num=" + managerbean.getP_NUM()); 
			return forward;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}