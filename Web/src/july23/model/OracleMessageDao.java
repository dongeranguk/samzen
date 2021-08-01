package july23.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import jdbc.JdbcUtil;
import july23.model.MessageDao; //추가
import july23.model.Message; // 추가

public class OracleMessageDao extends MessageDao {
	public int insert(Connection conn, Message message) throws SQLException {
		PreparedStatement pstmt = null;
		/* ResultSet rs = null */
		try {
			pstmt = conn.prepareStatement("insert into guestbook_message "
					+ " (message_id, guest_name, password, message) "
					+ " values (message_id_seq.NEXTVAL, ?, ?, ?)");
			pstmt.setString(1, message.getGuestName());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	public List<Message> selectList(Connection conn, int firstRow, int endRow) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(
					"select message_id, guest_name, password, message from ( "
							+ " 	select rownum r, message_id, guest_name, password, message from ( " /* from 빠져있었음 */
					+ " 		select * from guestbook_message m order by m.message_id desc "
					+ " 	) where rownum <= ? "
					+ ") where r >= ?");
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				List<Message> messageList = new ArrayList<Message>();
				do {
					messageList.add(super.makeMessageFromResultSet(rs));
				} while (rs.next());
				return messageList;
			} else {
				return Collections.emptyList();
			}	
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
}