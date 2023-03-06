package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.BookBean;
import net.book.db.BookDAO;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberInfoAction  implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		
		if(id ==null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			
			return forward;
		}
		
		MemberDAO memberdao = new MemberDAO();
		BookDAO bookdao = new BookDAO();
		
		MemberBean member = new MemberBean();
		
		member = memberdao.getMember(id);
		int count = bookdao.getBookCount(id);
		
		if(member.getKH_ID() == null) {
			 System.out.println("상세보기실패");
			 return null;
		}
		System.out.println("상세보기 성공");
		
		
		
		request.setAttribute("member", member);
		request.setAttribute("count", count);
		forward.setPath("./member/member_info.jsp");
		forward.setRedirect(false);
		return forward;
		
		
	}

}
