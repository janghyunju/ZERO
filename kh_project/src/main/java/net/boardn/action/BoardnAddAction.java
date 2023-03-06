package net.boardn.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.boardn.db.BoardnBean;
import net.boardn.db.BoardnDAO;

public class BoardnAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		BoardnDAO boardndao = new BoardnDAO();
		BoardnBean boardnbean = new BoardnBean();
		ActionForward forward = new ActionForward();

		String n_id = (String) request.getSession().getAttribute("id");

		String realFolder = "";
		String saveFolder = "/boardupload";

		int fileSize = 5 * 1024 * 1024;

		// realFolder = request.getRealPath(saveFolder);

		realFolder = request.getSession().getServletContext().getRealPath(saveFolder);

		boolean result = false;

		try {
			MultipartRequest multi = null;

			multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			boardnbean.setN_subject(multi.getParameter("n_subject"));
			boardnbean.setN_content(multi.getParameter("n_content"));
			boardnbean.setN_file(multi.getFilesystemName((String) multi.getFileNames().nextElement()));

			result = boardndao.boardInsert(boardnbean);

			if (result == false) {
				System.out.println("게시판 등록 실패");
				return null;
			}
			System.out.println("게시판 등록 완료");

			forward.setRedirect(true);
			forward.setPath("./BoardnList.no");
			return forward;

		} catch (Exception ex) {
			ex.printStackTrace();

		}
		return null;
	}
}