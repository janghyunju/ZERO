package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberModifyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		ActionForward forward = new ActionForward();

		MemberDAO memberdao = new MemberDAO();
		MemberBean member = new MemberBean();

		member = memberdao.getMember(id);
		member.setKH_ID(id);

//		if (id == null) {
//			forward.setPath("./MemberLogin.me");
//			forward.setRedirect(true);
//
//			return forward;
//		}

		request.setAttribute("member", member);
		forward.setPath("./member/infomodify.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
