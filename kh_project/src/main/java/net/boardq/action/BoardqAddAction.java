package net.boardq.action;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.boardq.db.BoardqBean;
import net.boardq.db.BoardqDAO;

public class BoardqAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// ------------------------------------------------------------
		final String fromEmail = "tnal13578@gmail.com"; // requires valid gmail id
		final String password = "ggtedpyxduxrgszh"; // correct password for gmail id
		final String toEmail = "tnal13578@naver.com"; // can be any email id

		System.out.println("TLSEmail Start");
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
		props.put("mail.smtp.port", "587"); // TLS Port
		props.put("mail.smtp.auth", "true"); // enable authentication
		props.put("mail.smtp.starttls.enable", "true"); // enable STARTTLS
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		// create Authenticator object to pass in Session.getInstance argument
		Authenticator auth = new Authenticator() {
			// override the getPasswordAuthentication method
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		};
		Session session = Session.getInstance(props, auth);

		EmailUtil.sendEmail(session, toEmail, "[문의]KH방탈출에 문의사항이 등록되었습니다", request.getParameter("q_content"));

		// -------------------------------------------------------------
		BoardqDAO boardqdao = new BoardqDAO();
		BoardqBean boardqbean = new BoardqBean();
		ActionForward forward = new ActionForward();

		String q_id = (String) request.getSession().getAttribute("id");

		boardqbean.setQ_id(q_id);
		String subject = request.getParameter("q_subject");
		String content = request.getParameter("q_content");

		boardqbean.setQ_subject(subject);
		boardqbean.setQ_content(content);

		boolean result = boardqdao.boardInsert(boardqbean);

		if (result == false) {
			System.out.println("게시판 등록 실패");
			return null;
		}
		System.out.println("게시판 등록 완료");

		forward.setRedirect(true);
		forward.setPath("./BoardqList.bo");
		return forward;
	}

}
