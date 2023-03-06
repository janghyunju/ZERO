package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("ACTION");
	
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		MemberDAO memberdao = new MemberDAO();
		MemberBean member = new MemberBean();

		int result;

		member.setKH_ID(request.getParameter("KH_ID"));
		member.setKH_PW(request.getParameter("KH_PW"));
		result = memberdao.isMember(member);

		if (result == 0) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.')");
			out.println("location.href ='./MemberLogin.me'; ");
			out.println("</script>");
			return null;
		}else if (result == -1) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다.')");
			out.println("location.href ='./MemberLogin.me'; ");
			out.println("</script>");
			return null;
		}
		// 로그인 성공
		session.setAttribute("id", member.getKH_ID());
		System.out.println("로그인 성공");
		forward.setRedirect(true);
		forward.setPath("./index.jsp"); //메인페이지로 이동
		return forward;
		
	}

	
}
