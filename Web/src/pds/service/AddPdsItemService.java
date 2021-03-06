package pds.service;

import java.sql.Connection;
import java.sql.SQLException;

import board.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import pds.dao.PdsitemDao;
import pds.model.AddRequest;
import pds.model.PdsItem;

public class AddPdsItemService {

	private static AddPdsItemService instance = new AddPdsItemService();
	
	public static AddPdsItemService getInstance() {
		return instance;
	}
	
	private AddPdsItemService() {}
	
	public PdsItem add(AddRequest request) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			PdsItem pdsItem = request.toPdsItem();
			int id = PdsitemDao.getInstance().insert(conn, pdsItem);
			if(id == -1) {
				JdbcUtil.close(conn);
				throw new RuntimeException("DB ???? ?ȵ?");
			}
			pdsItem.setId(id);
			
			conn.commit();
			return pdsItem;
		} catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			if(conn != null) {
				try {
					conn.setAutoCommit(true);
				} catch(SQLException e) {
				}
			}
			JdbcUtil.close(conn);
		}
	}
}