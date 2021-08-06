package article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Date;

import article.dao.ArticleDao;
import article.model.Article;
import article.model.WritingRequest;
import board.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class WriteArticleService {

	private static WriteArticleService instance = new WriteArticleService();
	
	public static WriteArticleService getInstance() {
		return instance;
	}
	
	private WriteArticleService() {}
	
	public Article write(WritingRequest writingRequest)
		throws IdGenerationFailedException {
			
		int groupId = IdGenerator.getInstance().generateNextId("article");
		
		Article article = writingRequest.toArticle(); // 받아와서 사용하는데는 생성된 객체를 사용해야한다... WritingRequest --> writingRequest로 수정...
		
		article.setGroupId(groupId);
		article.setPostingDate(new Date());
		DecimalFormat decimalFormat = new DecimalFormat("0000000000");
		article.setSequenceNumber(decimalFormat.format(groupId) + "999999");
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			int articleId = ArticleDao.getInstance().insert(conn, article);
			if(articleId == -1) {
				JdbcUtil.rollback(conn);
				throw new RuntimeException("DB 삽입 안됨 : " + articleId);
			}
			conn.commit();
			
			article.setId(articleId);
			return article;
		} catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException("DB 에러 : " + e.getMessage(), e);
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

