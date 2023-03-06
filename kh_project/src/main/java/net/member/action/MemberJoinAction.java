package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberJoinAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws Exception{
		
			request.setCharacterEncoding("utf-8");
			
			ActionForward forward = new ActionForward();
			MemberDAO memberdao = new MemberDAO();
			MemberBean member = new MemberBean(); //DTO
			
			boolean result = false;
			
			
			String pw_check = request.getParameter("KH_PW_re"); 
			String pw = request.getParameter("KH_PW"); 
			
			member.setKH_ID(request.getParameter("KH_ID"));
			member.setKH_PW(request.getParameter("KH_PW"));
			member.setKH_NAME(request.getParameter("KH_NAME"));
			member.setKH_TEL(request.getParameter("KH_TEL"));
	
			result = memberdao.MemberJoin(member,pw_check, pw);
			
			if(result == false) {
				System.out.println("회원가입 실패");
				
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('비밀번호가 일치하지 않습니다.')");
				out.println("location.href ='./MemberJoin.me'; ");
				out.println("</script>");
				return null;
			}

			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me"); //회원가입 됐을때의 페이지(로그인화면)
			return forward;
	}
}
