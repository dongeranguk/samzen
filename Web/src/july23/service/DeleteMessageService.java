package july23.service;

import java.sql.Connection;
import java.sql.SQLException;

import july23.model.MessageDao;
import july23.model.MessageDaoProvider;
import july23.model.Message;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class DeleteMessageService {
	private static DeleteMessageService instance = new DeleteMessageService();
	
	public static DeleteMessageService getInstance() {
		return instance;
	}
	
	private DeleteMessageService() {}
	
	public void deleteMessage(int messageId, String password) throws ServiceException, InvalidMessagePasswordException,
	MessageNotFoundException {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			MessageDao messageDao = 
					MessageDaoProvider.getInstance().getMessageDao();
			Message message = messageDao.select(conn, messageId);
			if(message == null) {
				throw new MessageNotFoundException("�޽����� �����ϴ�. : " + messageId);
			}
			if(!message.hasPasswd()) {
				throw new InvalidMessagePasswordException();
			}
			messageDao.delete(conn, messageId);
			
			conn.commit();
		} catch(SQLException ex) {
			JdbcUtil.close(conn);
			throw new ServiceException("���� ó�� �� ������ �߻��Ͽ����ϴ�.: " + ex.getMessage(), ex);
		} catch(InvalidMessagePasswordException ex) {
			JdbcUtil.rollback(conn);
			throw ex;
		} catch(MessageNotFoundException ex) {
			JdbcUtil.rollback(conn);
			throw ex;
		} finally {
			if(conn != null) {
				try {
					conn.setAutoCommit(false);
				} catch(SQLException e) {}
				JdbcUtil.close(conn);
			}
		}
	}
}
