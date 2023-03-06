package net.boardq.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.boardq.db.BoardqBean;
import net.boardq.db.BoardqDAO;


public class BoardqModifyAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
	throws Exception{
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		boolean result = false;
		
		int num=Integer.parseInt(request.getParameter("q_num"));
		
		BoardqDAO boarddao=new BoardqDAO();
		BoardqBean boarddata=new BoardqBean();
		
		boolean usercheck=boarddao.isBoardWriter(num, request.getParameter("q_id"));
		if(usercheck==false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('수정할 권한이 없습니다.');");
			out.println("location.href='./BoardqList.bo';");
			out.println("</script>");
			out.close();
			return null;
		}
		try {
			String subject = request.getParameter("q_subject");
			String content = request.getParameter("q_content");
			
			boarddata.setQ_num(num);
			boarddata.setQ_subject(subject);
			boarddata.setQ_content(content);
			
			result = boarddao.boardModify(boarddata);
			if(result==false) {
				System.out.println("게시판 수정 실패");
				return null;
			}
			System.out.println("게시판 수정 완료");
			
			forward.setRedirect(true);
			forward.setPath("./BoardqDetailAction.bo?q_num="+boarddata.getQ_num());
			//return forward; 
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return forward;
	}
	

}
