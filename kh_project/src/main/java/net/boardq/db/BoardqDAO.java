package net.boardq.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class BoardqDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;

	public BoardqDAO() {

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
			pstmt = con.prepareStatement("select count(*) from kh_boardq");
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
	public List getBoardqList(int page, int limit) {

//		String board_list_sql = "select * from " + "(select q_num, q_id, q_subject, q_content, "
//				+ "q_re_ref, q_re_lev, q_re_seq, q_date, "
//				+ "q_readcount from " + "(select * from kh_boardq order by "
//				+ "q_re_ref desc, q_re_seq asc)) " + "where q_num >= ? and q_num <= ?";
		String board_list_sql ="SELECT * FROM "
		+ "(SELECT * FROM(SELECT ROWNUM AS SEQ, q_num, q_id, q_subject, q_content, q_re_ref, q_re_lev, q_re_seq, q_date,q_readcount "
		+ "FROM( SELECT * FROM kh_boardq order by q_re_ref desc, q_re_seq asc ) ) WHERE SEQ >= ? ) "
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
				BoardqBean board = new BoardqBean();
				
				board.setQ_num(rs.getInt("q_num"));
				board.setQ_id(rs.getString("q_id"));
				board.setQ_subject(rs.getString("q_subject"));
				board.setQ_content(rs.getString("q_content"));
				board.setQ_re_ref(rs.getInt("q_re_ref"));
				board.setQ_re_lev(rs.getInt("q_re_lev"));
				board.setQ_re_seq(rs.getInt("q_re_seq"));
				board.setQ_date(rs.getString("q_date"));
				board.setQ_readcount(rs.getInt("q_readcount"));
				
				list.add(board);
			}
			return list;

		} catch (Exception ex) {
			System.out.println("getBoardqList 읽어오기 실패: " + ex);

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
	public boolean boardInsert(BoardqBean board) {

		int num = 0;
		String sql = "";

		int result = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select max(q_num) from kh_boardq");
			// 가장 큰 값을 가져와서 밑에 if로 +1 해라
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			sql = "insert into kh_boardq (q_num, q_id, q_subject, ";
			sql += "q_content, q_re_ref, q_re_lev, q_re_seq, "
					+ "q_readcount, q_date) values(?, ?, ?, ?, ?, ?, ?, ?, sysdate)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, board.getQ_id());
			pstmt.setString(3, board.getQ_subject());
			pstmt.setString(4, board.getQ_content());
			pstmt.setInt(5, num);
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);

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

		String sql = "UPDATE kh_boardq set q_readcount = " + "q_readcount + 1 where q_num = " + num;

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
	public BoardqBean getDetail(int num) throws Exception {

		BoardqBean board = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from kh_boardq where q_num = ?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new BoardqBean();
				
				board.setQ_num(rs.getInt("q_num"));
				board.setQ_id(rs.getString("q_id"));
				board.setQ_subject(rs.getString("q_subject"));
				board.setQ_content(rs.getString("q_content"));
				board.setQ_re_ref(rs.getInt("q_re_ref"));
				board.setQ_re_lev(rs.getInt("q_re_lev"));
				board.setQ_re_seq(rs.getInt("q_re_seq"));
				board.setQ_date(rs.getString("q_date"));
				board.setQ_readcount(rs.getInt("q_readcount"));
				
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

	// 답글 444
	public int boardReply(BoardqBean board) {
		String board_max_sql = "select max(q_num) from kh_boardq";
		String sql = "";
		int num = 0;
		int result = 0;

		int re_ref = board.getQ_re_ref(); // 원본글 번호
		int re_lev = board.getQ_re_lev(); // 답변글의 깊이
		int re_seq = board.getQ_re_seq(); // 답변글의 순서

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			sql = "update kh_boardq set q_re_seq=q_re_seq+1 ";
			sql += "where q_re_ref=? and q_re_seq > ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);
			result = pstmt.executeUpdate();

			re_seq = re_seq + 1;
			re_lev = re_lev + 1;

			sql = "insert into kh_boardq (q_num,q_id,q_subject,";
			sql += "q_content,q_re_ref,q_re_lev,";
			sql += "q_re_seq,q_readcount,q_date) ";
			sql += "values(?,?,?,?,?,?,?,?,sysdate)";
			System.out.println(board);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, board.getQ_id());
			pstmt.setString(3, board.getQ_subject());
			pstmt.setString(4, board.getQ_content());
			pstmt.setInt(5, re_ref);
			pstmt.setInt(6, re_lev);
			pstmt.setInt(7, re_seq);
			pstmt.setInt(8, 0);
			pstmt.executeUpdate();

			return num;
		} catch (SQLException ex) {
			System.out.println("boardqReply 답변 실패 : " + ex);
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
		return 0;
	}

	// 넘버에 해당하는 글쓴 사람 비교. 888
	// 글쓴이를 확인할 글의 정보를 얻는다.

	public boolean isBoardWriter(int num, String id) {
		System.out.println("id=" + id);
		String board_sql = "select * from kh_boardq where q_num=?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			rs.next();

			if (id.equals(rs.getString("q_id"))  || id.equals("admin")) {
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
	public boolean boardModify(BoardqBean modifyboard) throws Exception {
		String sql = "update kh_boardq set q_subject=?,";
		sql += "q_content=? WHERE q_num=?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifyboard.getQ_subject());
			pstmt.setString(2, modifyboard.getQ_content());
			pstmt.setInt(3, modifyboard.getQ_num());
			pstmt.executeUpdate();
			return true;
		} catch (Exception ex) {
			System.out.println("boardqModify 수정 실패 555 : " + ex);
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
		String board_delete_sql = "delete from kh_boardq where q_num=?";

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
			System.out.println("boardqDelete 삭제 실패 666: " + ex);
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
