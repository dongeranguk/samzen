package july28.board.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Date;

import board.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import july28.board.dao.ArticleDao;
import july28.board.model.Article;
import july28.board.model.WritingRequest;

public class WriteArticleService {
	private static WriteArticleService instance = new WriteArticleService(); //15~21�� �̱��� ����
	
	public static WriteArticleService getInstance() {
		return instance;
	}
	
	private WriteArticleService() {}
	
	public Article write(WritingRequest writingRequest) //4���� ���� ���� WritingRequest��ü�� �Ű������� �޴´�.
		throws IdGenerationFailedException {
		
		int	groupId = IdGenerator.getInstance().generateNextId("article"); //generateNextId�޼���� sequencename�� �Ű������� �޾� int�� ������ �����Ͽ� groupId�� ����.
																		   //��, id_sequence���̺��� sequencename�� article�� Į���ۿ� ���� ������, 
																		   //���� ��� next_value�� 12�� int�� ������ groupId�� �����Ͽ� �׷����ϴ°��̴�.
		
		Article article = writingRequest.toArticle(); // �Ű������� ���� writingRequest��ü�� toArticle()�޼��带 ȣ���� ArticleŸ���� article��ü�� �����Ѵ�.
		
		article.setGroupId(groupId); //article
		article.setPostingDate(new Date());
		DecimalFormat decimalFormat = new DecimalFormat("0000000000"); // 0 10�� -> 9���� ����
		article.setSequenceNumber(decimalFormat.format(groupId) + "999999");
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			int articleId = ArticleDao.getInstance().insert(conn, article);
			if(articleId == -1) {
				JdbcUtil.rollback(conn);
				throw new RuntimeException("DB ���� �ȵ� : " + articleId);
			}
			conn.commit();
			
			article.setId(articleId);
			return article;
		} catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException("DB ���� : " + e.getMessage(), e);
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
