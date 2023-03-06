package net.boardr.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BoardrFrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());

		ActionForward forward = null;
		Action action = null;
		
		if (command.equals("/BoardrWrite.re")) {// http://xxx.xxx.net/BoardWrite.bo
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./boardr/r_board_write.jsp");

/*		} else if (command.equals("/BoardrReplyAction.re")) {
			action = new BoardrReplyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

*/		} else if (command.equals("/BoardrModify.re")) {
			action = new BoardrModifyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/BoardrAddAction.re")) {
			action = new BoardrAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
/*		} else if (command.equals("/BoardrReplyView.re")) {
			action = new BoardrReplyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
*/		} else if (command.equals("/BoardrModifyAction.re")) {
			action = new BoardrModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/BoardrDeleteAction.re")) {
			action = new BoardrDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/BoardrList.re")) {
			action = new BoardrListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	} else if (command.equals("/BoardrDetailAction.re")) {
			action = new BoardrDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("get 작동합니다.");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("post 작동합니다");
		doProcess(request, response);

	}
}