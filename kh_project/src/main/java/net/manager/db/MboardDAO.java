package net.manager.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MboardDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;

	public MboardDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB 연결에 실패했습니다." + ex);
			return;
		}
	}

	// 리뷰 detail
	public BoardrBean getrDetail(int num) {
		BoardrBean boardr = null;

		try {
			con = ds.getConnection();

			pstmt = con.prepareStatement("select * from kh_boardr where r_num = ?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				boardr = new BoardrBean();
				boardr.setR_id(rs.getString("R_ID"));
				boardr.setR_num(rs.getInt("R_NUM"));
				boardr.setR_subject(rs.getString("R_SUBJECT"));
				boardr.setR_content(rs.getString("R_CONTENT"));
				boardr.setR_date(rs.getString("R_DATE"));
				boardr.setR_readcount(rs.getInt("R_READCOUNT"));
			}
			return boardr;

		} catch (Exception e) {
			System.out.println("getDetail() 에러: " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	// 리뷰 삭제
	public boolean mboardrDelete(int num) {

		String board_delete_sql = "delete from kh_boardr where R_NUM = ?";

		int result = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			if (result == 0)
				return false;

			return true;
		} catch (Exception ex) {
			System.out.println("boardrDelete 삭제 실패 666: " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
		return false;
	}

	// qna 상세보기
	public BoardqBean getqDetail(int num) {
		BoardqBean boardq = null;

		try {
			con = ds.getConnection();

			pstmt = con.prepareStatement("select * from kh_boardq where Q_NUM = ?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				boardq = new BoardqBean();
				boardq.setQ_id(rs.getString("Q_ID"));
				boardq.setQ_num(rs.getInt("Q_NUM"));
				boardq.setQ_subject(rs.getString("Q_SUBJECT"));
				boardq.setQ_content(rs.getString("Q_CONTENT"));
				boardq.setQ_date(rs.getString("Q_DATE"));
				boardq.setQ_readcount(rs.getInt("Q_READCOUNT"));
				boardq.setQ_re_ref(rs.getInt("Q_RE_REF"));
				boardq.setQ_re_lev(rs.getInt("Q_RE_LEV"));
				boardq.setQ_re_seq(rs.getInt("Q_RE_SEQ"));
			}
			return boardq;

		} catch (Exception e) {
			System.out.println("getqDetail() 에러: " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	// qna 삭제
	public boolean mboardqDelete(int num) {

		String board_delete_sql = "delete from kh_boardq where Q_NUM = ?";

		int result = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			if (result == 0)
				return false;

			return true;
		} catch (Exception ex) {
			System.out.println("boardrDelete 삭제 실패 666: " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
		return false;
	}

	// qna 조회수 업데이트
	public void setReadCountqUpdate(int num) {
		String sql = "update kh_boardq set Q_READCOUNT = " + "Q_READCOUNT+1 where Q_NUM = " + num;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("setReadCountqUpdate 글 읽은 갯수 수정 실패 : " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}

	}

	// 리뷰 조회 업데이트
	public void setReadCountrUpdate(int num) {
		String sql = "update kh_boardr set R_READCOUNT = " + "R_READCOUNT+1 where R_NUM = " + num;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("setReadCountrUpdate 글 읽은 갯수 수정 실패 : " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}

	}

	// qna 답글

	public int boardqReply(BoardqBean board) {
		String board_max_sql = "select max(q_num) from kh_boardq";
		String sql = "";
		int num = 0;
		int result = 0;

		int q_re_ref = board.getQ_re_ref();
		int q_re_lev = board.getQ_re_lev();
		int q_re_seq = board.getQ_re_seq();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}

			sql = "update kh_boardq set q_re_seq = q_re_seq + 1 where q_re_ref = ? " + " and q_re_seq > ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, q_re_ref);
			pstmt.setInt(2, q_re_seq);
			result = pstmt.executeUpdate();

			q_re_seq = q_re_seq + 1;
			q_re_lev = q_re_lev + 1;

			sql = "insert into kh_boardq (q_num, q_id, q_subject, q_content, "
					+ "q_re_ref, q_re_lev, q_re_seq, q_readcount, q_date) "
					+ "values (?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, "admin");
			pstmt.setString(3, board.getQ_subject());
			pstmt.setString(4, board.getQ_content());
			pstmt.setInt(5, q_re_ref);
			pstmt.setInt(6, q_re_lev);
			pstmt.setInt(7, q_re_seq);
			pstmt.setInt(8, 0);

			pstmt.executeUpdate();

			return num;
		} catch (Exception e) {
			System.out.println("qnaReply() 에러: " + e);

		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

}