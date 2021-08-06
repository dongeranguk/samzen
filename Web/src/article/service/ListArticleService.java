package article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import article.dao.ArticleDao;
import article.model.Article;
import article.model.ArticleListModel;
import board.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class ListArticleService {
	
	private static ListArticleService instance = new ListArticleService();
	
	public static ListArticleService getInstance() {
		return instance;
	}
	
	public static final int COUNT_PER_PAGE = 10;
	
	public ArticleListModel getArticleList(int requestPageNumber) {
		if(requestPageNumber < 0) {
			throw new IllegalArgumentException("page number < 0 : " + requestPageNumber);
		}
		ArticleDao articleDao = ArticleDao.getInstance();
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			int totalArticleCount = articleDao.selectCount(conn); // select count(*)�� ������� totalArticleCount�� �����Ѵ�.
			
			if(totalArticleCount == 0) { //��� ���� 0�̶��...
				return new ArticleListModel(); // ArticleListModel() �����ڸ� ȣ���ؼ� �� ����Ʈ��ü�� �����Ѵ�.
			}
			
			int totalPageCount = calculateTotalPageCount(totalArticleCount); 
			
			int firstRow = (requestPageNumber - 1) * COUNT_PER_PAGE + 1;
			int endRow = firstRow + COUNT_PER_PAGE - 1;
			
			if(endRow > totalArticleCount) {
				endRow = totalArticleCount;
			}
			List<Article> articleList = articleDao.select(conn, firstRow, endRow);
		
			ArticleListModel articleListView = new ArticleListModel(articleList, requestPageNumber, totalPageCount, firstRow, endRow);
			return articleListView;
		} catch(SQLException e) {
			throw new RuntimeException("DB ���� �߻� : " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	private int calculateTotalPageCount(int totalArticleCount) { // select count(*)�� ������� �Ű������� �޾� ��ü ������ ������ ���Ѵ�.
		if(totalArticleCount == 0) { //������� 0�̶��...
			return 0; // ��ü ������������ 0
		}
		int pageCount = totalArticleCount / COUNT_PER_PAGE; //�ƴ϶��, ������� ��� 10���� ������ pageCount�� ����(ex. 11���� ���� �ִٸ�, 10���� ������ 1)
		if(totalArticleCount % COUNT_PER_PAGE > 0) { // ������� ��� 10���� ������ ���������� 0���� ũ��
			pageCount++; // pageCount�� 1 ������Ų��.
		}
		return pageCount;
	}
	
}
