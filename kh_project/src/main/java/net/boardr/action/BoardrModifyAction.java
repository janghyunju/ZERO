package net.boardr.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.boardr.db.BoardrBean;
import net.boardr.db.BoardrDAO;



public class BoardrModifyAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
	throws Exception{
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		boolean result = false;
		
		int num=Integer.parseInt(request.getParameter("r_num"));
		
		BoardrDAO boarddao=new BoardrDAO();
		BoardrBean boarddata=new BoardrBean();
		
		boolean usercheck=boarddao.isBoardWriter(num, request.getParameter("r_id"));
		if(usercheck==false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('수정할 권한이 없습니다.');");
			out.println("location.href='./BoardrList.re';");
			out.println("</script>");
			out.close();
			return null;
		}
		try {
			String subject = request.getParameter("r_subject");
			String content = request.getParameter("r_content");
			
			boarddata.setR_num(num);
			boarddata.setR_subject(subject);
			boarddata.setR_content(content);
			
			result = boarddao.boardModify(boarddata);
			if(result==false) {
				System.out.println("게시판 수정 실패");
				return null;
			}
			System.out.println("게시판 수정 완료");
			
			forward.setRedirect(true);
			forward.setPath("./BoardrDetailAction.re?r_num="+boarddata.getR_num());
			//return forward; 
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return forward;
	}
	

}
