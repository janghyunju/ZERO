package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		ActionForward forward = new ActionForward();
		boolean result = false;

		MemberDAO memberdao = new MemberDAO();
		MemberBean member = new MemberBean();

		try {

			member.setKH_ID(id);
			member.setKH_PW(request.getParameter("KH_PW"));
			int ret = memberdao.isMember(member); // 아이디와 비밀번호가 원래 값과 동일한지 비교하는 부분
			if (ret == 0 || ret == -1) {
				// 실패
				request.setAttribute("msg", "비밀번호가 다릅니다.");
				forward.setRedirect(false);
				forward.setPath("./member/infomodify.jsp");
				return forward;
			}

			member.setKH_ID(request.getParameter("KH_ID"));
			member.setKH_NAME(request.getParameter("KH_NAME"));
			member.setKH_TEL(request.getParameter("KH_TEL"));

			result = memberdao.memberModify(member);// 수정한다.
			if (result == false) {
				System.out.println("회원정보 수정 실패");
				return null;
			}
			System.out.println("회원정보 수정 완료");

			forward.setRedirect(true);
			forward.setPath("./MemberInfoAction.me");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return forward;
	}

}
