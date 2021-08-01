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
	private static WriteArticleService instance = new WriteArticleService(); //15~21줄 싱글톤 패턴
	
	public static WriteArticleService getInstance() {
		return instance;
	}
	
	private WriteArticleService() {}
	
	public Article write(WritingRequest writingRequest) //4개의 값을 가진 WritingRequest객체를 매개변수로 받는다.
		throws IdGenerationFailedException {
		
		int	groupId = IdGenerator.getInstance().generateNextId("article"); //generateNextId메서드는 sequencename을 매개변수로 받아 int형 변수를 리턴하여 groupId에 저장.
																		   //즉, id_sequence테이블에는 sequencename이 article인 칼럼밖에 없기 때문에, 
																		   //예를 들어 next_value가 12인 int형 변수를 groupId에 저장하여 그룹핑하는것이다.
		
		Article article = writingRequest.toArticle(); // 매개변수로 받은 writingRequest객체를 toArticle()메서드를 호출해 Article타입의 article객체로 생성한다.
		
		article.setGroupId(groupId); //article
		article.setPostingDate(new Date());
		DecimalFormat decimalFormat = new DecimalFormat("0000000000"); // 0 10개 -> 9개로 수정
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
