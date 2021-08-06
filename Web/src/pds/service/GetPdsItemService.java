package pds.service;

import java.sql.Connection;
import java.sql.SQLException;

import board.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import pds.dao.PdsitemDao;
import pds.model.PdsItem;

public class GetPdsItemService {

	private static GetPdsItemService instance = new GetPdsItemService();
	
	public static GetPdsItemService getInstance() {
		return instance;
	}
	
	private GetPdsItemService() {}
	
	public PdsItem getPdsItem(int id) throws PdsItemNotFoundException {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			PdsItem pdsItem = PdsitemDao.getInstance().selectById(conn, id);
			if(pdsItem == null) {
				throw new PdsItemNotFoundException("�������� �ʽ��ϴٶ��� : " + id);
			}
			return pdsItem;
		} catch(SQLException e) {
			throw new RuntimeException("DB ó�� ���� �߻� : " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
