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
			int totalArticleCount = articleDao.selectCount(conn); // select count(*)의 결과값을 totalArticleCount에 대입한다.
			
			if(totalArticleCount == 0) { //결과 값이 0이라면...
				return new ArticleListModel(); // ArticleListModel() 생성자를 호출해서 빈 리스트객체를 생성한다.
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
			throw new RuntimeException("DB 에러 발생 : " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	private int calculateTotalPageCount(int totalArticleCount) { // select count(*)의 결과값을 매개변수로 받아 전체 페이지 개수를 구한다.
		if(totalArticleCount == 0) { //결과값이 0이라면...
			return 0; // 전체 페이지갯수는 0
		}
		int pageCount = totalArticleCount / COUNT_PER_PAGE; //아니라면, 결과값을 상수 10으로 나누어 pageCount에 대입(ex. 11개의 글이 있다면, 10으로 나누면 1)
		if(totalArticleCount % COUNT_PER_PAGE > 0) { // 결과값을 상수 10으로 나누어 나머지값이 0보다 크면
			pageCount++; // pageCount를 1 증가시킨다.
		}
		return pageCount;
	}
	
}
