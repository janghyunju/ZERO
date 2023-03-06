package net.boardn.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.boardn.db.BoardnBean;
import net.boardn.db.BoardnDAO;



public class BoardnModifyAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
	throws Exception{
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		boolean result = false;

		String realFolder = "";
		String saveFolder = "/boardupload";

		int fileSize = 5 * 1024 * 1024;

		// realFolder = request.getRealPath(saveFolder);

		realFolder = request.getSession().getServletContext().getRealPath(saveFolder);

		MultipartRequest multi = null;
		multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		int num=Integer.parseInt(multi.getParameter("n_num"));
		
		BoardnDAO boarddao=new BoardnDAO();
		BoardnBean boarddata=new BoardnBean();
		
		boolean usercheck=boarddao.isBoardWriter(num, multi.getParameter("n_id"));
		if(usercheck==false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('수정할 권한이 없습니다.');");
			out.println("location.href='./BoardnList.no';");
			out.println("</script>");
			out.close();
			return null;
		}
		try {
			boarddata.setN_num(num);
			
			boarddata.setN_subject(multi.getParameter("n_subject"));
			boarddata.setN_content(multi.getParameter("n_content"));
			boarddata.setN_file(multi.getFilesystemName((String) multi.getFileNames().nextElement()));

			
			result = boarddao.boardModify(boarddata);
			if(result==false) {
				System.out.println("게시판 수정 실패");
				return null;
			}
			System.out.println("게시판 수정 완료");
			
			forward.setRedirect(true);
			forward.setPath("./BoardnDetailAction.no?n_num="+boarddata.getN_num());
			//return forward; 
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return forward;
	}
	

}
