package net.boardr.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.boardr.db.BoardrBean;

public class BoardrDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;

	public BoardrDAO() {

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
			pstmt = con.prepareStatement("select count(*) from kh_boardr");
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
				+ "(SELECT * FROM(SELECT ROWNUM AS SEQ, r_num, r_id, r_subject, r_content, r_date, r_readcount  "
				+ "FROM( SELECT * FROM kh_boardr order by r_date desc ) ) WHERE SEQ >= ? ) "
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
				BoardrBean board = new BoardrBean();

				board.setR_num(rs.getInt("r_num"));
				board.setR_id(rs.getString("r_id"));
				board.setR_subject(rs.getString("r_subject"));
				board.setR_content(rs.getString("r_content"));
				board.setR_date(rs.getString("r_date"));
				board.setR_readcount(rs.getInt("r_readcount"));

				list.add(board);
			}
			return list;

		} catch (Exception ex) {
			System.out.println("getBoardList 읽어오기 실패: " + ex);

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
	public boolean boardInsert(BoardrBean board) {

		int num = 0;
		String sql = "";

		int result = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select max(r_num) from kh_boardr");
			// 가장 큰 값을 가져와서 밑에 if로 +1 해라
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			sql = "insert into kh_boardr (r_num, r_id, r_subject, ";
			sql += "r_content, " + "r_readcount, r_date) values(?, ?, ?, ?, ?, sysdate)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, board.getR_id());
			pstmt.setString(3, board.getR_subject());
			pstmt.setString(4, board.getR_content());
			pstmt.setInt(5, 0);

			result = pstmt.executeUpdate();

			if (result == 0)
				return false;

			return true;

		} catch (Exception ex) {
			System.out.println("boardInsert 등록 실패: 333" + ex);

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

	// 글을 읽은 개수, 조회수 update(글 내용 확인 순간 호출됨)
	public void setReadCountUpdate(int num) throws Exception {

		String sql = "UPDATE kh_boardr set r_readcount = " + "r_readcount + 1 where r_num = " + num;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();

		} catch (SQLException ex) {
			System.out.println("setReadCountUpdate 글 읽은 개수 수정 실패: " + ex);

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

	// 내용 보기
	public BoardrBean getDetail(int num) throws Exception {

		BoardrBean board = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from kh_boardr where r_num = ?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new BoardrBean();

				board.setR_num(rs.getInt("r_num"));
				board.setR_id(rs.getString("r_id"));
				board.setR_subject(rs.getString("r_subject"));
				board.setR_content(rs.getString("r_content"));
				board.setR_date(rs.getString("r_date"));
				board.setR_readcount(rs.getInt("r_readcount"));

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
		String board_sql = "select * from kh_boardr where r_num=?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			rs.next();

			if (id.equals(rs.getString("r_id")) || id.equals("admin")) {
				
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
	public boolean boardModify(BoardrBean modifyboard) throws Exception {
		String sql = "update kh_boardr set r_subject=?,";
		sql += "r_content=? WHERE r_num=?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifyboard.getR_subject());
			pstmt.setString(2, modifyboard.getR_content());
			pstmt.setInt(3, modifyboard.getR_num());
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

	// 글 삭제(액션 클래스에서 비밀번호 일치 여부 확인 후
	// 이 메서드를 실행한다)

	public boolean boardDelete(int num) {
		String board_delete_sql = "delete from kh_boardr where r_num=?";

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
