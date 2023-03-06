package net.manager.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.manager.db.BoardnBean;
import net.manager.db.ManagerDAO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NoticeAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ManagerDAO managerdao = new ManagerDAO();
		BoardnBean boardnbean = new BoardnBean();
		ActionForward forward = new ActionForward();
		
		String realFolder="";
		String saveFolder="/boardnupload";
		
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
			
			
			boardnbean.setN_subject(multi.getParameter("N_SUBJECT"));
			boardnbean.setN_content(multi.getParameter("N_CONTENT"));
			boardnbean.setN_file(
					multi.getFilesystemName(
							(String)multi.getFileNames().nextElement()));
			
			result = managerdao.boardnInsert(boardnbean);
			
			if (result == false) {
				System.out.println("공지 등록 실패");
				return null;
			}
			System.out.println("공지 등록완료");
			
			forward.setRedirect(true);
			forward.setPath("./ManagerList.ma");
			return forward;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	
		
		return null;
	}
}
