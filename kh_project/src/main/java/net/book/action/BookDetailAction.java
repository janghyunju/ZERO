package net.book.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.book.db.BookBean;
import net.book.db.BookDAO;

public class BookDetailAction implements Action  {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		BookDAO bookdao = new BookDAO();
		BookBean  bookdata = new BookBean();
		ActionForward forward = new ActionForward();
		
		String id = (String)session.getAttribute("id");
		
		List  booklist = new ArrayList();
		
		
		
		booklist = bookdao.getDetail(id);
		
		if(booklist == null) {
			System.out.println("상세보기 실패");
			return null;
		}
		System.out.println("상세보기 성공");
		
		request.setAttribute("booklist", booklist);
		session.setAttribute("id", id);
		forward.setRedirect(false);
		forward.setPath("./book/bookDetailView.jsp");
		return forward;
	}

}
