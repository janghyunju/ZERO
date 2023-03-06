package net.manager.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.manager.action.Action;
import net.manager.action.ActionForward;
import net.manager.action.BookThemeListAction;
import net.manager.action.IndexListAction;
import net.manager.action.NoticeAddAction;
import net.manager.action.NoticeDeleteAction;
import net.manager.action.NoticeDetailAction;
import net.manager.action.NoticeModifyAction;
import net.manager.action.NoticeModifyView;
import net.manager.action.ThemeAddAction;
import net.manager.action.ThemeDeleteAction;
import net.manager.action.ThemeDetailAction;
import net.manager.action.ThemeListAction;
import net.manager.action.ThemeModifyAction;
import net.manager.action.ThemeModifyView;

public class ManagerFrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		System.out.println("doprocess");

		if (command.equals("/ManagerWrite.ma")) {

			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./manager/manager_twrite.jsp");

		} else if (command.equals("/BoardnWrite.ma")) {

			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./manager/manager_nwrite.jsp");

		} else if (command.equals("/ManagerList.ma")) {
			action = new ThemeListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/ManagerThemeAddAction.ma")) {
			System.out.println("들어갔어요");
			action = new ThemeAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/ThemeDetailAction.ma")) {
			action = new ThemeDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/ThemeModify.ma")) {
			action = new ThemeModifyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ThemeModifyAction.ma")) {
			action = new ThemeModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ThemeDeleteAction.ma")) {
			action = new ThemeDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ManagerNoticeAddAction.ma")) {
			System.out.println("등록 접속");
			action = new NoticeAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/NoticeDetailAction.ma")) {
			System.out.println("들어갔음");
			action = new NoticeDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/NoticeDeleteAction.ma")) {
			action = new NoticeDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/NoticeModify.ma")) {

			action = new NoticeModifyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/NoticeModifyAction.ma")) {

			action = new NoticeModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/IndexAction.ma")) {

			action = new IndexListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/BookThemeListAction.ma")) {
			action = new BookThemeListAction();
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doget");
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("dopost");
		doProcess(request, response);
	}

}
