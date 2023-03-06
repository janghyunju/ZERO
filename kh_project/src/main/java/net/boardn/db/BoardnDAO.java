package net.boardn.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.boardn.db.BoardnBean;


public class BoardnDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;

	public BoardnDAO() {

		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			System.out.println("DB 연결에 실패하였습니다." + ex);

			return;
		}
	}

	// 1. 게시글 수
	public int getListCount() {

		int x = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from kh_boardn");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}

		} catch (Exception ex) {
			System.out.println("getListCount 실패: " + ex);

		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return x;

	}

	// 2. 게시판 레코드를 읽어옴
	public List getBoardList(int page, int limit) {

//			String board_list_sql = "select * from " + "(select q_num, q_id, q_subject, q_content, "
//			+ "q_re_ref, q_re_lev, q_re_seq, q_date, "
//			+ "q_readcount from " + "(select * from kh_boardq order by "
//			+ "q_re_ref desc, q_re_seq asc)) " + "where q_num >= ? and q_num <= ?";

		String board_list_sql = "SELECT * FROM "
				+ "(SELECT * FROM(SELECT ROWNUM AS SEQ, n_num, n_subject, n_content, n_date, n_file "
				+ "FROM( SELECT * FROM kh_boardn order by n_date desc ) ) WHERE SEQ >= ? ) "
				+ "WHERE ROWNUM <= ? ";

		List list = new ArrayList();

		int startrow = (page - 1) * 10 + 1; //
		int endrow = startrow + limit - 1; //

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_list_sql);

			pstmt.setInt(1, startrow);
			pstmt.setInt(2, limit);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardnBean board = new BoardnBean();

				board.setN_num(rs.getInt("n_num"));
				board.setN_subject(rs.getString("n_subject"));
				board.setN_content(rs.getString("n_content"));
				board.setN_date(rs.getString("n_date"));
				board.setN_file(rs.getString("n_file"));

				list.add(board);
			}
			return list;

		} catch (Exception ex) {
			System.out.println("getnBoardList 읽어오기 실패: " + ex);

		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return null;

	}

	// 3. 게시판 글쓰기
	public boolean boardInsert(BoardnBean board) {

		int num = 0;
		String sql = "";

		int result = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select max(n_num) from kh_boardn");
			// 가장 큰 값을 가져와서 밑에 if로 +1 해라
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			sql = "insert into kh_boardn (n_num, n_subject, n_file, ";
			sql += "n_content, " + " n_date) values(?, ?, ?, ?, sysdate)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, board.getN_subject());
			pstmt.setString(3, board.getN_file());
			pstmt.setString(4, board.getN_content());

			result = pstmt.executeUpdate();

			if (result == 0)
				return false;

			return true;

		} catch (Exception ex) {
			System.out.println("boardnInsert 등록 실패: 333" + ex);

		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return false;

	}


	// 내용 보기
	public BoardnBean getDetail(int num) throws Exception {

		BoardnBean board = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from kh_boardn where n_num = ?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new BoardnBean();

				board.setN_num(rs.getInt("n_num"));
				board.setN_subject(rs.getString("n_subject"));
				board.setN_content(rs.getString("n_content"));
				board.setN_date(rs.getString("n_date"));
				board.setN_file(rs.getString("n_file"));

			}
			return board;

		} catch (Exception ex) {
			System.out.println("getDetail 내용 보기 실패: " + ex);

		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return null;
	}

	// 넘버에 해당하는 글쓴 사람 비교. 888
	// 글쓴이를 확인할 글의 정보를 얻는다.

	public boolean isBoardWriter(int num, String id) {
		System.out.println("id=" + id);
		String board_sql = "select * from kh_boardn where n_num=?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			rs.next();

			if (id.equals("admin")) {
				return true;
			}
		} catch (SQLException ex) {
			System.out.println("isBoardWriter 실패 888 : " + ex);
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

	// 글 수정 555
	public boolean boardModify(BoardnBean modifyboard) throws Exception {
		String sql = "update kh_boardn set n_subject=?,";
		sql += "n_content=?, n_file=? WHERE n_num=?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifyboard.getN_subject());
			pstmt.setString(2, modifyboard.getN_content());
			pstmt.setString(3, modifyboard.getN_file());
			pstmt.setInt(4, modifyboard.getN_num());
			pstmt.executeUpdate();
			return true;
		} catch (Exception ex) {
			System.out.println("boardModify 수정 실패 555 : " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return false;
	}

	public boolean boardDelete(int num) {
		String board_delete_sql = "delete from kh_boardn where n_num=?";

		int result = 0;

		// 글 삭제(액션 클래스에서 비밀번호 일치 여부 확인 후
		// 이 메서드를 실행한다)

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_delete_sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			if (result == 0)
				return false;

			return true;
		} catch (Exception ex) {
			System.out.println("boardDelete 삭제 실패 666: " + ex);
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
}
