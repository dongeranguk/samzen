package board2;

import java.sql.*;
import java.util.*;

public class BoardDBBean {
	private static BoardDBBean instance = new BoardDBBean();
	
	public static BoardDBBean getInstance() {
		return instance;
	}
	
	private BoardDBBean() {}
	
	private Connection getConnection() throws Exception {
		return DriverManager.getConnection("jdbc:apache:commons:dbcp:/pool");
	}
	
	public void insertArticle(BoardDataBean article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//답변글인지 일반글인지를 구분해서 입력시켜주는 로직
		int num = article.getNum();
		int ref = article.getRef(); // 그룹핑 해주는 변수
		int re_step = article.getRe_step(); //일반글인지 답변글인지
		int re_level = article.getRe_level(); // 답변의 답변인지
		int number = 0;
		String sql = "";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select max(num) from board");
			rs = pstmt.executeQuery();
			
					if(rs.next()) 
						number = rs.getInt(1)+1;
					else 
						number = 1;
					
					if(num != 0) {
						sql = "update board set re_step=re_step+1 where ref=? and re_step> ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, ref);
						pstmt.setInt(2, re_step);
						pstmt.executeUpdate();
						re_step = re_step+1;
						re_level = re_level+1;
					} else {
						ref = number;
						re_step = 0;
						re_level = 0;
					}
				
			sql = "insert into board(num, writer, email, subject, paswwd, reg_date, ";
			sql +="ref, re_step, re_level, content, ip) values(board_num.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getEmail());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setInt(6, article.getRef());
			pstmt.setInt(7, article.getRe_step());
			pstmt.setInt(8, article.getRe_level());
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try { conn.close();} catch(SQLException ex) {}
		}
	}
	//list.jsp : 페이징을 위해서 전체 테이블에 입력된 행의수가 필요.
	public int getArticleCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1); //질문 : 자동적으로 증가하는가?
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn != null) try {conn.close();} catch(SQLException ex) {}
		}
		return x;
	}
	
	public List<BoardDataBean> getArticles(int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardDataBean> articleList = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
			" select num, wrtier, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip, readcount, r " +
			" from (select num, writer, eamil, subject, passswd"
		}
	}
}
