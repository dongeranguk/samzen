package july28.board.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import board.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class IdGenerator {
		
	private static IdGenerator instance = new IdGenerator(); //13~19줄 싱글톤 패턴
	
	public static IdGenerator getInstance() {
		return instance;
	}
	
	private IdGenerator() {}
	
	public int generateNextId(String sequenceName) //sequenceName을 매개변수로 받아 int형 변수를 리턴한다.
			throws IdGenerationFailedException {
		Connection conn = null;
		PreparedStatement pstmtSelect = null;
		ResultSet rs = null;
		PreparedStatement pstmtUpdate = null;
		//select문과 update문 2개의 sql문을 사용하므로 PreparedStatement 2개
		try {
			conn = ConnectionProvider.getConnection(); //DB에 접속하기 위해 ConnectionProvider.getConnection() 메서드 호출
			conn.setAutoCommit(false); //setAutoCommit()메서드에 매개변수를 false로 지정하면 자동으로 commit 하지 않는다.
			pstmtSelect = conn.prepareStatement(
					"select next_value from id_sequence " +
					"where sequence_name = ? for Update"); //업데이트를 위해 sequence_name이 ?인 id_sequence테이블의 next_value 컬럼을 검색한다.
			pstmtSelect.setString(1, sequenceName); //매개변수로 받은 sequenceName의 next_value컬럼을 검색한다.
			rs = pstmtSelect.executeQuery(); //쿼리의 실행결과를 ResultSet타입의 rs객체에 저장한다.
			rs.next(); // 쿼리의 실행결과가 있다면
			int id = rs.getInt(1); // int값을 id객체에 저장한다.
			id++; // id값을 1씩 증가시킨다.
			
			pstmtUpdate = conn.prepareStatement(
					"update id_sequence set next_value = ? " + 
					"where sequence_name = ?"); // id_sequence테이블의 sequence_name의 next_value 컬럼을 update한다.
			pstmtUpdate.setInt(1, id); // next_value에 위의 1을 증가시킨 id값을 넣는다.
			pstmtUpdate.setString(2, sequenceName); // 매개변수로 받은 sequencename을 넣는다.
			pstmtUpdate.executeUpdate(); // 쿼리를 실행한다.
			
			conn.commit(); // 위의 실행결과를 commit한다.
			
			return id; // id값을 리턴한다.
		} catch(SQLException ex) { //위 실행문의 예외처리
			JdbcUtil.close(conn);
			throw new IdGenerationFailedException(ex);
		} finally {
			if(conn != null) {
				try {
					conn.setAutoCommit(true);
				} catch(SQLException e) {
				}
				JdbcUtil.close(conn);
			}
		}
	}
}
