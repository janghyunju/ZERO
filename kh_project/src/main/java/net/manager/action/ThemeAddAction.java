package net.manager.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.manager.db.ManagerBean;
import net.manager.db.ManagerDAO;


public class ThemeAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("접속!");
		ManagerDAO managerdao = new ManagerDAO();
		ManagerBean managerbean = new ManagerBean();
		ActionForward forward = new ActionForward();
		
		String realFolder="";
		String saveFolder="/themeupload";
		
		int fileSize = 5 * 1024 * 1024;
		
		// realFolder = request.getRealPath(saveFolder);
		
		realFolder = request.getSession().getServletContext().getRealPath(saveFolder);
		
		boolean result = false;
		
		try {
			MultipartRequest multi = null;
			
			multi = new MultipartRequest(request,
					realFolder,
					fileSize,
					"UTF-8",
					new DefaultFileRenamePolicy());
			
			
			managerbean.setP_NAME(multi.getParameter("P_NAME"));
			managerbean.setP_CONTENT(multi.getParameter("P_CONTENT"));
			managerbean.setP_LEVEL(Integer.parseInt(multi.getParameter("P_LEVEL")));
			managerbean.setP_PRE(multi.getParameter("P_PRE"));
			managerbean.setP_PLACE(multi.getParameter("P_PLACE"));
			managerbean.setP_FILE(
					multi.getFilesystemName(
							(String)multi.getFileNames().nextElement()));
			
			result = managerdao.themeInsert(managerbean);
			
			if (result == false) {
				System.out.println("테마 등록 실패");
				return null;
			}
			System.out.println("테마 등록완료");
			
			forward.setRedirect(true);
			forward.setPath("./ManagerList.ma");
			return forward;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	
		
		return null;
	}

}
