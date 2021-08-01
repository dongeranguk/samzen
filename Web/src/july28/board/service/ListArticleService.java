package july28.board.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import july28.board.dao.ArticleDao;
import july28.board.model.Article;
import july28.board.model.ArticleListModel;

public class ListArticleService {
	private static ListArticleService instance = new ListArticleService();
	
	public static ListArticleService getInstance() {
		return instance;
	}
	
	public static final int COUNT_PER_PAGE = 10; // 보여줄 페이지수를 상수로 선언
	
	public ArticleListModel getArticleList(int requestPageNumber) {
		if(requestPageNumber < 0) {
			throw new IllegalArgumentException("page Number < 0 : "
					+ requestPageNumber); //requestPageNumber가 0보다 작다면 즉, null이라면 IllegalArgumentException예외를 발생시킨다.
		}
		ArticleDao articleDao = ArticleDao.getInstance(); // requestPageNumber 페이지 수가 0보다 크다면, ArticleDao객체를 생성
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection(); // DB에 접속하기 위해 메서드 호출
			int totalArticleCount = articleDao.selectCount(conn); //게시판에 입력된 행의 개수를 구해서 int형 totalArticleCount 변수에 넣어준다.
		
			if(totalArticleCount == 0) {
				return new ArticleListModel(); // totalArticleCount 즉, 게시판에 입력된 행의 개수가 0이라면 ArticleListModel() 생성자를 호출하여
											   // 0 값을 설정되는 ArticleListModel 객체를 생성하여 리턴한다.
			}
			
			int totalPageCount = calculateTotalPageCount(totalArticleCount); //게시판에 입력된 행의 개수를 매개변수로 받는 calculateTotalPageConut 메서드
			
			int firstRow = (requestPageNumber - 1) * COUNT_PER_PAGE + 1; // 입력받는 페이지수에서 1을 빼고 COUNT_PER_PAGE(10) + 1 
																		 // ex) (1-1) * 10 + 1 = 1; 즉 첫번째 페이지를 구한다.
			int endRow = firstRow + COUNT_PER_PAGE - 1; //첫번째 페이지 + 10 - 1 -> 1 + 10 -1 즉 10
		
			if(endRow > totalArticleCount) { // 마지막 행의 수가 게시판에 입력된 행의 개수보다 크다면
				endRow = totalArticleCount;  // 마지막 행의 수에 게시판에 입력된 행의 개수를 대입한다.
			}
			List<Article> articleList = articleDao.select(conn, firstRow, endRow);
			
			ArticleListModel articleListView = new ArticleListModel(articleList, requestPageNumber, totalPageCount, firstRow, endRow);
			return articleListView;
		} catch(SQLException ex) {
			throw new RuntimeException("DB 에러 발생 : " + ex.getMessage(), ex);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	public ArticleListModel getArticleList(int requestPageNumber, int searchn, String search) {
		if(requestPageNumber < 0) {
			throw new IllegalArgumentException("page number < 0" + requestPageNumber);
		}
		ArticleDao articleDao = ArticleDao.getInstance();
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			int totalArticleCount = articleDao.selectCount(requestPageNumber, searchn, search);
			
			// 전체 게시글이 0개인 경우 기본 ArticleListModel객체를 리턴
			if(totalArticleCount == 0) {
				return new ArticleListModel();
			}
			
			//calculateTotalPageCount()메서드를 호출해서 전체 페이지 개수를 구한다.
			int totalPageCount = calculateTotalPageCount(totalArticleCount);
			
			//요청한 페이지 번호를 이용해서 읽어올 행의 시작과 끝 번호를 구한다.
			int firstRow = (requestPageNumber - 1) * COUNT_PER_PAGE + 1;
			int endRow = firstRow + COUNT_PER_PAGE - 1;
			if(endRow > totalArticleCount) {
				endRow = totalArticleCount;
			}
			
			//articleDao.select()메서드를 이용해서 시작과 끝행에 속하는 Article 목록을 구한다.
			List<Article> articleList = articleDao.select(firstRow, endRow, searchn, search);
			
			//Article 목록, 요청 페이지 번호, 전체 페이지 개수, 시작행, 끝행을 이용해서 ArticleListModel객체를 리턴
			ArticleListModel articleListView = new ArticleListModel(articleList, requestPageNumber, totalPageCount,
					firstRow, endRow);
			return articleListView;
		} catch(Exception e) {
			throw new RuntimeException("DB 에러 발생 : " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	private int calculateTotalPageCount(int totalArticleCount) { //게시판에 입력된 행의 개수를 받아
		if(totalArticleCount == 0) {							 //게시판에 입력된 행의 개수가 0이라면,
			return 0;											 //0을 리턴한다.
		}														 //그게 아니라면,
		int pageCount = totalArticleCount / COUNT_PER_PAGE;		 //pageCount변수에 행의 개수를 COUNT_PER_PAGE(10)로 나눈 결과를 대입한다.
		if(totalArticleCount % COUNT_PER_PAGE > 0) {			 //행의 개수를 COUNT_PER_PAGE로 나누고 나머지 값이 0보다 크다면,
			pageCount++;										 //pageCount변수를 1 증가시킨다.
		}
		return pageCount;										 //위의 실행문을 모두 수행하고 pageCount값을 리턴한다.			
	}															 //즉, 행의 개수를 10으로 나누어 그 나머지 값이 페이지 수가 된다.
}
