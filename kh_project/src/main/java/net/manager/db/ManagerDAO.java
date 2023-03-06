package net.manager.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ManagerDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;

	public ManagerDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB 연결에 실패했습니다." + ex);
			return;
		}
	}

	// 테마 등록
	public boolean themeInsert(ManagerBean board) {
		int num = 0;
		String sql = "";
		int result = 0;

		try {
			con = ds.getConnection();

			pstmt = con.prepareStatement("select max(p_num) from kh_product");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}

			sql = "insert into kh_product (P_NUM, P_NAME, P_LEVEL, " + "p_content, p_file ,P_PRE, P_PLACE) " 
			+ "values (?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, board.getP_NAME());
			pstmt.setInt(3, board.getP_LEVEL());
			pstmt.setString(4, board.getP_CONTENT());
			pstmt.setString(5, board.getP_FILE());
			pstmt.setString(6, board.getP_PRE());
			pstmt.setString(7, board.getP_PLACE());

			result = pstmt.executeUpdate();
			if (result == 0)
				return false;

			return true;
		} catch (Exception e) {
			System.out.println("themeInsert() 에러: " + e);
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
		return false;

	}

	// 테마 게시글 수
	public int getListCount() {

		int x = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from kh_product");
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

	// 테마 리스트뽑아오기
	public List getthemelist(int page, int limit) {
		String sql = "select * from " + "(select rownum rnum, P_NUM,P_NAME,P_LEVEL,"
				+ "P_CONTENT,P_FILE,P_PRE,P_PLACE from (select * from kh_product order by P_NUM desc" + ")) "
				+ "where rnum >= ? and rnum <= ?";

		List themelist = new ArrayList();

		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ManagerBean manager = new ManagerBean();
				manager.setP_NUM(rs.getInt("P_NUM"));
				manager.setP_NAME(rs.getString("P_NAME"));
				manager.setP_LEVEL(rs.getInt("P_LEVEL"));
				manager.setP_CONTENT(rs.getString("P_CONTENT"));
				manager.setP_FILE(rs.getString("P_FILE"));
				manager.setP_PRE(rs.getString("P_PRE"));
				manager.setP_PLACE(rs.getString("P_PLACE"));
				themelist.add(manager);
			}

			return themelist;
		} catch (Exception ex) {
			System.out.println("getthemelist 읽어오기 실패: " + ex);
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

	// 테마 detail 보기
	public ManagerBean getDetail(int num) {
		ManagerBean manager = null;

		try {
			con = ds.getConnection();

			pstmt = con.prepareStatement("select * from kh_product where p_num = ?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				manager = new ManagerBean();
				manager.setP_NUM(rs.getInt("P_NUM"));
				manager.setP_NAME(rs.getString("P_NAME"));
				manager.setP_LEVEL(rs.getInt("P_LEVEL"));
				manager.setP_CONTENT(rs.getString("P_CONTENT"));
				manager.setP_FILE(rs.getString("P_FILE"));
				manager.setP_PRE(rs.getString("P_PRE"));
				manager.setP_PLACE(rs.getString("P_PLACE"));
				
			}
			return manager;

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
	// 테마 수정
	public boolean themeModify(ManagerBean modifytheme) throws Exception {
		String sql = "update kh_product set P_NAME=?,";
		sql += "P_CONTENT=?,P_LEVEL=?,P_FILE=?,P_PRE=?,P_PLACE=? where P_NUM=?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifytheme.getP_NAME());
			pstmt.setString(2, modifytheme.getP_CONTENT());
			pstmt.setInt(3, modifytheme.getP_LEVEL());
			pstmt.setString(4, modifytheme.getP_FILE());
			pstmt.setString(5, modifytheme.getP_PRE());
			pstmt.setString(6, modifytheme.getP_PLACE());
			pstmt.setInt(7, modifytheme.getP_NUM());
			pstmt.executeUpdate();
			return true;
		} catch (Exception ex) {
			System.out.println("themeModify 수정 실패 555: " + ex);
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


	// 테마 삭제
	public boolean ThemeDelete(int num) {

		String board_delete_sql = "delete from kh_product where P_NUM = ?";

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

	// 리뷰게시판 게시글 수
	public int getrListCount() {
		int x = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from kh_boardr");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getrListCount 실패: " + ex);
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

	// 리뷰게시판 뽑아내기
	public List getboardrlist(int rpage, int rlimit) {

		String board_list_sql = "select * from " + "(select rownum rnum, R_NUM,R_ID,R_SUBJECT,"
				+ "R_CONTENT,R_DATE,R_READCOUNT " + "from " + "(select * from kh_boardr order by " + "R_NUM desc)) "
				+ "where rnum >= ? and rnum <= ?";

		List boardrlist = new ArrayList();

		int rstartrow = (rpage - 1) * rlimit + 1;
		int rendrow = rstartrow + rlimit - 1;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, rstartrow);
			pstmt.setInt(2, rendrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardrBean boardr = new BoardrBean();

				boardr.setR_num(rs.getInt("R_NUM"));
				boardr.setR_id(rs.getString("R_ID"));
				boardr.setR_subject(rs.getString("R_SUBJECT"));
				boardr.setR_content(rs.getString("R_CONTENT"));
				boardr.setR_date(rs.getString("R_DATE"));
				boardr.setR_readcount(rs.getInt("R_READCOUNT"));

				boardrlist.add(boardr);
			}

			return boardrlist;
		} catch (Exception ex) {
			System.out.println("getboardrlist 읽어오기 실패: " + ex);
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

	// qna게시판 게시글 수
	public int getqListCount() {
		int x = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from kh_boardq");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getrListCount 실패: " + ex);
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



	// qna 게시판 리스트 뽑기
	public List getboardqlist(int qpage, int qlimit) {
		
		String board_list_sql = "select * from " +
				"(select rownum rnum, Q_NUM,Q_ID,Q_SUBJECT," +
							"Q_CONTENT,Q_RE_REF, Q_RE_LEV,"+
				"Q_RE_SEQ,Q_DATE,Q_READCOUNT from " +
							"(select * from kh_boardq order by " +
				"Q_RE_REF desc,Q_RE_SEQ asc)) " +
							"where rnum >= ? and rnum <= ?";

		List boardqlist = new ArrayList();

		int qstartrow = (qpage - 1) * qlimit + 1;
		int qendrow = qstartrow + qlimit - 1;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, qstartrow);
			pstmt.setInt(2, qendrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardqBean boardq = new BoardqBean();

				boardq.setQ_num(rs.getInt("Q_NUM"));
				boardq.setQ_id(rs.getString("Q_ID"));
				boardq.setQ_subject(rs.getString("Q_SUBJECT"));
				boardq.setQ_content(rs.getString("Q_CONTENT"));
				boardq.setQ_re_ref(rs.getInt("Q_RE_REF"));
				boardq.setQ_re_lev(rs.getInt("Q_RE_LEV"));
				boardq.setQ_re_seq(rs.getInt("Q_RE_SEQ"));
				boardq.setQ_date(rs.getString("Q_DATE"));
				boardq.setQ_readcount(rs.getInt("Q_READCOUNT"));

				boardqlist.add(boardq);
			}

			return boardqlist;
		} catch (Exception ex) {
			System.out.println("getboardrlist 읽어오기 실패: " + ex);
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
	
	
	// 공지게시판 등록
		public boolean boardnInsert(BoardnBean boardnbean) {

			int num = 0;
			String sql = "";
			int result = 0;

			try {
				con = ds.getConnection();

				pstmt = con.prepareStatement("select max(n_num) from kh_boardn");
				rs = pstmt.executeQuery();

				if (rs.next()) {
					num = rs.getInt(1) + 1;
				} else {
					num = 1;
				}

				sql = "insert into kh_boardn (N_NUM, N_SUBJECT, N_CONTENT, " 
						+ "N_READCOUNT, N_DATE, N_FILE) " + "values (?, ?, ?, ?, sysdate, ?)";
				pstmt = con.prepareStatement(sql);

				pstmt.setInt(1, num);
				pstmt.setString(2, boardnbean.getN_subject());
				pstmt.setString(3, boardnbean.getN_content());
				pstmt.setInt(4, 0);
				pstmt.setString(5, boardnbean.getN_file());

				result = pstmt.executeUpdate();
				if (result == 0)
					return false;

				return true;
			} catch (Exception e) {
				System.out.println("boardnInsert() 에러: " + e);
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
			return false;
		}
		
		
	// 공지 게시글 수

	public int getnListCount() {

		int x = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from kh_boardn");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getnListCount 실패: " + ex);
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
	// 공지 뽑아오기ㅣ

	public List getboardnlist(int npage, int nlimit) {

		String board_list_sql = "select * from " + "(select rownum rnum, N_NUM,N_SUBJECT,"
				+ "N_CONTENT,N_READCOUNT,N_DATE,N_FILE " + "from " + "(select * from kh_boardn order by " + "N_NUM desc)) "
				+ "where rnum >= ? and rnum <= ?";

		List boardnlist = new ArrayList();

		int nstartrow = (npage - 1) * nlimit + 1;
		int nendrow = nstartrow + nlimit - 1;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, nstartrow);
			pstmt.setInt(2, nendrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardnBean boardn = new BoardnBean();

				boardn.setN_num(rs.getInt("N_NUM"));
				boardn.setN_subject(rs.getString("N_SUBJECT"));
				boardn.setN_content(rs.getString("N_CONTENT"));
				boardn.setN_readcount(rs.getInt("N_READCOUNT"));
				boardn.setN_date(rs.getString("N_DATE"));
				boardn.setN_file(rs.getString("N_FILE"));

				boardnlist.add(boardn);
			}

			return boardnlist;
		} catch (Exception ex) {
			System.out.println("getboardnlist 읽어오기 실패: " + ex);
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

	
	// 공지 detail 보기
	public BoardnBean getnDetail(int num) {
		BoardnBean boardn = null;

		try {
			con = ds.getConnection();

			pstmt = con.prepareStatement("select * from kh_boardn where n_num = ?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				boardn = new BoardnBean();
				boardn.setN_num(rs.getInt("N_NUM"));
				boardn.setN_subject(rs.getString("N_SUBJECT"));
				boardn.setN_content(rs.getString("N_CONTENT"));
				boardn.setN_date(rs.getString("N_DATE"));
				boardn.setN_file(rs.getString("N_FILE"));
			}
			return boardn;

		} catch (Exception e) {
			System.out.println("getnDetail() 에러: " + e);
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

	// 공지 삭제
	public boolean NoticeDelete(int num) {

		String board_delete_sql = "delete from kh_boardn where N_NUM = ?";

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
			System.out.println("NoticeDelete 삭제 실패 666: " + ex);
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

	// 공지 조회수
	public void setReadCountnUpdate(int num) {
		
	
			String sql = "update kh_boardn set N_READCOUNT = " + "N_READCOUNT+1 where N_NUM = " + num;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.executeUpdate();
			} catch (Exception ex) {
				System.out.println("setReadCountnUpdate 글 읽은 갯수 수정 실패 : " + ex);
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

	// 공지 수정
	public boolean noticeModify(BoardnBean boardnbean) throws Exception{

		String sql = "update kh_boardn set N_SUBJECT=?,";
		sql += "N_CONTENT=?, N_FILE=? where N_NUM=?"; 


		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardnbean.getN_subject());
			pstmt.setString(2, boardnbean.getN_content());
			pstmt.setString(3, boardnbean.getN_file());
			pstmt.setInt(4, boardnbean.getN_num());  
			pstmt.executeUpdate();
			return true;  

		}catch(Exception ex){
			System.out.println("noticeModify 수정 실패 555: " + ex);
		}finally{
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
	
}
