package net.member.action;
 
import java.io.PrintWriter;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;
import net.member.action.ActionForward;
 
public class MemberIdCheckAction implements Action
{
    @Override
    public ActionForward execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
    	
    	request.setCharacterEncoding("UTF-8");
        MemberDAO dao = new MemberDAO();    
        MemberBean member = new MemberBean();
		ActionForward forward = new ActionForward();
		
		member.setKH_ID(request.getParameter("kh_id"));
		
		int cnt= dao.duplicateIdCheck(member);
        
 
        if(cnt !=0 ) {  	
        	response.setContentType("text/html;charset=utf-8");
        	PrintWriter out = response.getWriter();
        	System.out.println("아이디 중복"); // 아이디 중복
			out.println("<script>");
			out.println("alert('이미 존재하는 아이디 입니다.')");
			out.println("location.href='javascript:history.go(-1)';");
			out.println("</script>");

        }else {
        	System.out.println("아이디 사용 가능");
        	response.setContentType("text/html;charset=utf-8");
        	PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('사용가능한 아이디 입니다.')");
			out.println("location.href='javascript:history.go(-1)';");
			out.println("</script>");
        
        }
		return forward;

    }
}