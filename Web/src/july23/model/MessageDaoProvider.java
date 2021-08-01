package july23.model;

import july23.model.OracleMessageDao; // Ãß°¡

public class MessageDaoProvider {
	private static MessageDaoProvider instance = new MessageDaoProvider();
	
	public static MessageDaoProvider getInstance() {
		return instance;
	}
	
	private MessageDaoProvider() {}
	
	private OracleMessageDao oracleDao = new OracleMessageDao();
	private String dbms;
	
	void setDbms(String dbms) {
		this.dbms = dbms;
	}
	
	public MessageDao getMessageDao() {
		if("oracle".equals(dbms)) {
			return oracleDao;
		} else {
			return null;
		}
	}
}
