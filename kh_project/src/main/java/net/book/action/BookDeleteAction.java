package net.book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.BookBean;
import net.book.db.BookDAO;

public class BookDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward	forward	=new ActionForward();
		BookDAO bookdao = new BookDAO();

		boolean	result	=	false;
		int num = Integer.parseInt(request.getParameter("num"));
		result = bookdao.bookDelete(num);
		
		if(result == false) {
			System.out.println("삭제 실패");
		}
		System.out.println("삭제 완료");
		
		forward.setRedirect(true);
		forward.setPath("./BookDetailAction.boo");
		return forward;
	}

}
