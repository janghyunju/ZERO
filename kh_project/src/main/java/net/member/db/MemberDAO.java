package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public MemberDAO() { // 생성자
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception ex) {
			System.out.println("DB연결 실패 : " + ex);
			return;
		}
	}

	// 로그인
	public int isMember(MemberBean member) {
		String sql = "SELECT KH_PW FROM KH_MEMBER WHERE KH_ID = ? ";
		int result = -1;
		// (비회원, 회원이지만 비밀번호 오류, 로그인 성공) 3가지 시나리오가 필요하기 때문에 true/false 가 아닌 숫자로 초기값을 설정.

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getKH_ID());
			rs = pstmt.executeQuery();

			if (rs.next()) {

				if (rs.getString("KH_PW").equals(member.getKH_PW())) {
					result = 1;
				} else {
					result = 0;
				}

			} else {
				// 아이디가 존재하지 않으면 -1 (-1은 초기값, 레코드를 받지 못함)
				result = -1;
			}

		} catch (Exception ex) {
			System.out.println("isMember 에러 : " + ex);
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
		return result;
	}

	// 22. 회원가입
	public boolean MemberJoin(MemberBean member, String pw_check, String pw) {

		String sql = "INSERT INTO KH_MEMBER VALUES(?,?,?,?)";
		int result = 0;
		if (pw_check.equals(pw)) {
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member.getKH_ID());
				pstmt.setString(2, member.getKH_PW());
				pstmt.setString(3, member.getKH_NAME());
				pstmt.setString(4, member.getKH_TEL());
				result = pstmt.executeUpdate();

				if (result != 0) { // 0이 아니라면 = 정상적으로 insert가 되었다면 true를 리턴
					return true;
				}
			} catch (Exception ex) {
				System.out.println("MemberJoin 에러 : 44" + ex);
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

		} else {
			result = 0;
		}

		return false;
	}

	// 회원탈퇴
	public boolean deleteMember(String id) {
		String sql = "DELETE FROM KH_MEMBER WHERE KH_ID = ?";
		int result = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			result = pstmt.executeUpdate();
			if (result != 0) {
				return true;
			}

		} catch (Exception e) {
			System.out.println("deleteMember에러 : " + e);
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

	// 회원상세보기
	public MemberBean getMember(String kh_id) {
		MemberBean member = new MemberBean();

		try {
			con = ds.getConnection();
//	               String sql = "SELECT * FROM KH_MEMBER m LEFT JOIN KH_BOOK_2 b on (m.KH_ID = b.B_ID) where m.KH_ID = ?";
			String sql = "SELECT * FROM KH_MEMBER where KH_ID = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, kh_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				member.setKH_ID(rs.getString("KH_ID"));
				member.setKH_NAME(rs.getString("KH_NAME"));
				member.setKH_TEL(rs.getString("KH_TEL"));
				member.setKH_PW(rs.getString("KH_PW"));
			} else {
				System.out.println("데이터가 없습니다.");
			}
			return member;

		} catch (Exception e) {
			e.printStackTrace();
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

	// 회원정보 수정
	public boolean memberModify(MemberBean member) {
		String sql = "update KH_MEMBER set KH_NAME=?,";
		sql += "KH_TEL=? where KH_ID=?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getKH_NAME());
			pstmt.setString(2, member.getKH_TEL());
			pstmt.setString(3, member.getKH_ID());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("memberModify 수정 실패 : " + e);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
				}
		}
		return false;
	}

	public int duplicateIdCheck(MemberBean member) {
		String sql = "select  count(*)as cnt  from  kh_member  where  kh_id = ?";
	int cnt = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getKH_ID());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("cnt");
				System.out.println(cnt);
			}
			return cnt;
			

		} catch (Exception e) {
			System.out.println("idcheck 에러 : " + e);
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

}
