package net.book.db;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

public class BookDAO {

	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public BookDAO(){ 
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception ex) {
			System.out.println("DB연결 실패 : " + ex);
			return;
		}
	}
	//예약하기
		public boolean bookInsert(BookBean bookdata, String id) {
			int num = 0;
			String tel = "";
			String sql = "";
			int result = 0;
			String product ="";
			String name="";

			try {
					
				con = ds.getConnection();
				pstmt = con.prepareStatement("select max(b_num) from kh_book");
				rs = pstmt.executeQuery();
				
				if(rs.next())
					num = rs.getInt(1) + 1;
				else
					num = 1;
				
				con = ds.getConnection();
				pstmt = con.prepareStatement("select KH_TEL from KH_MEMBER where KH_ID = ?");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next())
					tel = rs.getString(1);
				else
					tel = "010-0000-0000";
				
				con = ds.getConnection();
				pstmt = con.prepareStatement("select KH_NAME from KH_MEMBER where KH_ID = ?");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next())
					name = rs.getString(1);
				else
					name = "이름없음";
				
				con = ds.getConnection();
				pstmt = con.prepareStatement("select P_NAME from KH_PRODUCT where P_NUM = ?");
				pstmt.setInt(1, bookdata.getB_PNUM());
				rs = pstmt.executeQuery();
				
				if(rs.next())
					product = rs.getString(1);
				else
					product = "오류";
				
				sql = "insert into kh_book(B_NUM, B_ID, B_PRODUCT, B_PNUM, B_NAME, B_DATE, ";
				sql+="B_TEL, B_INWON, B_TIME)  values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, num);
					pstmt.setString(2, id);
					pstmt.setString(3, product);
					pstmt.setInt(4, bookdata.getB_PNUM());
					pstmt.setString(5, name);
					pstmt.setString(6, bookdata.getB_DATE());
					pstmt.setString(7, tel);
					pstmt.setInt(8, bookdata.getB_INWON());
					pstmt.setString(9, bookdata.getB_TIME());
				
					result = pstmt.executeUpdate();
					
					if(result == 0) return false;
					
					return true;
					
			}catch(Exception ex) {
				System.out.println("bookInsert 등록 실패 : " + ex);
			}finally {
				if(rs!=null) try {rs.close();}catch(SQLException ex) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException ex) {}
				if(con!=null) try {con.close();}catch(SQLException ex) {}
			}
			return false;
		}
	
// 예약확인
	public List  getDetail(String id) {
		String sql = "";
		List booklist = new ArrayList();
		
		try {
			sql ="select B_NUM, B_ID, B_PRODUCT, B_PNUM, B_NAME, TO_CHAR(B_DATE,'YYYY-MM-DD') as B_DATE, "
					+ "B_TEL, B_INWON, B_TIME  from kh_book where B_ID = ?";
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id );
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BookBean bookdata = new BookBean();
				bookdata.setB_NUM(rs.getInt("B_NUM"));
				bookdata.setB_ID(rs.getString("B_ID"));
				bookdata.setB_PRODUCT(rs.getString("B_PRODUCT"));
				bookdata.setB_PNUM(rs.getInt("B_PNUM"));
				bookdata.setB_NAME(rs.getString("B_NAME"));
				bookdata.setB_DATE(rs.getString("B_DATE"));
				bookdata.setB_TEL(rs.getString("B_TEL"));
				bookdata.setB_INWON(rs.getInt("B_INWON"));
				bookdata.setB_TIME(rs.getString("B_TIME"));
				booklist.add(bookdata);
			}
			return booklist;
			
			
		} catch (Exception e) {
			System.out.println("getDetail 내용보기 실패 : " + e);
		}finally {
			if(rs != null) try{rs.close();}catch(SQLException ex) {}
			if(pstmt != null) try{pstmt.close();}catch(SQLException ex) {}
			if(con != null) try{con.close();}catch(SQLException ex) {}
		}
		return null;
	}
	
	//예약취소
	public boolean bookDelete(int num) {
		String  delete_sql	= "delete from kh_book where b_num = ?" ;
		
		int 	result	=	0;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(delete_sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
			if(result	== 0)
				return false;
			
			return true;
		}catch(Exception e) {
			System.out.println("boardDelete()에러: "+e);
		}finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(con != null)
					con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	public int getBookCount(String id) {
		String sql = "";
		int cnt = 0;
		try {
			sql ="select count(*) as cnt from kh_book where B_ID = ?";
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id );
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
			return cnt;
			
			
		} catch (Exception e) {
			System.out.println("getDetail 내용보기 실패 : " + e);
		}finally {
			if(rs != null) try{rs.close();}catch(SQLException ex) {}
			if(pstmt != null) try{pstmt.close();}catch(SQLException ex) {}
			if(con != null) try{con.close();}catch(SQLException ex) {}
		}
		
		return 0;
	}
	
	//중복예약인지 확인
	public int bookcheck(BookBean bookdata) {
		int cnt = 0;
		String sql ="select count(*) as cnt from kh_book where b_pnum = ? and b_date = ? and b_time = ?";
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bookdata.getB_PNUM());
			pstmt.setString(2, bookdata.getB_DATE());
			pstmt.setString(3, bookdata.getB_TIME());
			
			rs= pstmt.executeQuery();
			
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
			return cnt;
			
		} catch (Exception e) {
			System.out.println("bookcheck 중복확인 실패 : " + e);
		}finally {
			if(rs != null) try{rs.close();}catch(SQLException ex) {}
			if(pstmt != null) try{pstmt.close();}catch(SQLException ex) {}
			if(con != null) try{con.close();}catch(SQLException ex) {}
		}
		
		return 0;
	}

	
	
	
	
	
}
