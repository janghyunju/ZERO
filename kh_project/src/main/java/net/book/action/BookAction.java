package net.book.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.BookBean;
import net.book.db.BookDAO;

public class BookAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		BookDAO bookdao = new BookDAO();
		BookBean bookdata = new BookBean();
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("id");

		boolean result = false;
		if (id == null) {
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			return forward;
		}

			bookdata.setB_PNUM(Integer.parseInt(request.getParameter("B_PNUM")));
			bookdata.setB_NAME(request.getParameter("B_NAME"));
			bookdata.setB_DATE(request.getParameter("B_DATE"));
			bookdata.setB_INWON(Integer.parseInt(request.getParameter("B_INWON")));
			bookdata.setB_TIME(request.getParameter("B_TIME"));

			int cnt = bookdao.bookcheck(bookdata);

			if (cnt != 0) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('이미 예약된 상품입니다.')");
				out.println("location.href ='./BookThemeListAction.ma'; ");
				out.println("</script>");
			}else {
			
			result = bookdao.bookInsert(bookdata, id);
			}
			
		if (result == false) {
			System.out.println("예약 등록 실패");
			return null;
		}
		System.out.println("예약 등록 완료");
		forward.setRedirect(true);
		forward.setPath("./BookDetailAction.boo");
		return forward;
		
	}

}
