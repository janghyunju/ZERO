package net.boardr.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.boardr.db.BoardrDAO;


public class BoardrDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		boolean result=false;
		boolean usercheck=false;
		int num=Integer.parseInt(request.getParameter("r_num"));
		
		BoardrDAO boarddao=new BoardrDAO();
		usercheck=boarddao.isBoardWriter(num, id);
		
		if(usercheck==false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제할 권한이 없습니다.');");
			out.println("location.href='./BoardrList.re';");
			out.println("</script>");
			out.close();
			return null;
		}
		
		result=boarddao.boardDelete(num);
		if(result==false) {
			System.out.println("게시판 삭제 실패");
			return null;
		}
		
		System.out.println("게시판 삭제 성공");
		forward.setRedirect(true);
		forward.setPath("./BoardrList.re");
		return forward;
				
	}

}
