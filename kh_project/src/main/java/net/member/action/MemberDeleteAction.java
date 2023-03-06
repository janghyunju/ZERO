package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward  forward  = new ActionForward();
		HttpSession session = request.getSession();
		MemberDAO  memberdao = new MemberDAO();
		
		boolean result = false;
		
		String id = (String)session.getAttribute("id");
		
		result = memberdao.deleteMember(id);
		
		if(result == false) {
			System.out.println("회원삭제 실패");
			return null;
		}
		forward.setRedirect(true);
		forward.setPath("./MemberLogoutAction.me");
		return forward;
		
	}

}
