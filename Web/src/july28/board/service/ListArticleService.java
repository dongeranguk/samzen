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
	
	public static final int COUNT_PER_PAGE = 10; // ������ ���������� ����� ����
	
	public ArticleListModel getArticleList(int requestPageNumber) {
		if(requestPageNumber < 0) {
			throw new IllegalArgumentException("page Number < 0 : "
					+ requestPageNumber); //requestPageNumber�� 0���� �۴ٸ� ��, null�̶�� IllegalArgumentException���ܸ� �߻���Ų��.
		}
		ArticleDao articleDao = ArticleDao.getInstance(); // requestPageNumber ������ ���� 0���� ũ�ٸ�, ArticleDao��ü�� ����
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection(); // DB�� �����ϱ� ���� �޼��� ȣ��
			int totalArticleCount = articleDao.selectCount(conn); //�Խ��ǿ� �Էµ� ���� ������ ���ؼ� int�� totalArticleCount ������ �־��ش�.
		
			if(totalArticleCount == 0) {
				return new ArticleListModel(); // totalArticleCount ��, �Խ��ǿ� �Էµ� ���� ������ 0�̶�� ArticleListModel() �����ڸ� ȣ���Ͽ�
											   // 0 ���� �����Ǵ� ArticleListModel ��ü�� �����Ͽ� �����Ѵ�.
			}
			
			int totalPageCount = calculateTotalPageCount(totalArticleCount); //�Խ��ǿ� �Էµ� ���� ������ �Ű������� �޴� calculateTotalPageConut �޼���
			
			int firstRow = (requestPageNumber - 1) * COUNT_PER_PAGE + 1; // �Է¹޴� ������������ 1�� ���� COUNT_PER_PAGE(10) + 1 
																		 // ex) (1-1) * 10 + 1 = 1; �� ù��° �������� ���Ѵ�.
			int endRow = firstRow + COUNT_PER_PAGE - 1; //ù��° ������ + 10 - 1 -> 1 + 10 -1 �� 10
		
			if(endRow > totalArticleCount) { // ������ ���� ���� �Խ��ǿ� �Էµ� ���� �������� ũ�ٸ�
				endRow = totalArticleCount;  // ������ ���� ���� �Խ��ǿ� �Էµ� ���� ������ �����Ѵ�.
			}
			List<Article> articleList = articleDao.select(conn, firstRow, endRow);
			
			ArticleListModel articleListView = new ArticleListModel(articleList, requestPageNumber, totalPageCount, firstRow, endRow);
			return articleListView;
		} catch(SQLException ex) {
			throw new RuntimeException("DB ���� �߻� : " + ex.getMessage(), ex);
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
			
			// ��ü �Խñ��� 0���� ��� �⺻ ArticleListModel��ü�� ����
			if(totalArticleCount == 0) {
				return new ArticleListModel();
			}
			
			//calculateTotalPageCount()�޼��带 ȣ���ؼ� ��ü ������ ������ ���Ѵ�.
			int totalPageCount = calculateTotalPageCount(totalArticleCount);
			
			//��û�� ������ ��ȣ�� �̿��ؼ� �о�� ���� ���۰� �� ��ȣ�� ���Ѵ�.
			int firstRow = (requestPageNumber - 1) * COUNT_PER_PAGE + 1;
			int endRow = firstRow + COUNT_PER_PAGE - 1;
			if(endRow > totalArticleCount) {
				endRow = totalArticleCount;
			}
			
			//articleDao.select()�޼��带 �̿��ؼ� ���۰� ���࿡ ���ϴ� Article ����� ���Ѵ�.
			List<Article> articleList = articleDao.select(firstRow, endRow, searchn, search);
			
			//Article ���, ��û ������ ��ȣ, ��ü ������ ����, ������, ������ �̿��ؼ� ArticleListModel��ü�� ����
			ArticleListModel articleListView = new ArticleListModel(articleList, requestPageNumber, totalPageCount,
					firstRow, endRow);
			return articleListView;
		} catch(Exception e) {
			throw new RuntimeException("DB ���� �߻� : " + e.getMessage(),e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	private int calculateTotalPageCount(int totalArticleCount) { //�Խ��ǿ� �Էµ� ���� ������ �޾�
		if(totalArticleCount == 0) {							 //�Խ��ǿ� �Էµ� ���� ������ 0�̶��,
			return 0;											 //0�� �����Ѵ�.
		}														 //�װ� �ƴ϶��,
		int pageCount = totalArticleCount / COUNT_PER_PAGE;		 //pageCount������ ���� ������ COUNT_PER_PAGE(10)�� ���� ����� �����Ѵ�.
		if(totalArticleCount % COUNT_PER_PAGE > 0) {			 //���� ������ COUNT_PER_PAGE�� ������ ������ ���� 0���� ũ�ٸ�,
			pageCount++;										 //pageCount������ 1 ������Ų��.
		}
		return pageCount;										 //���� ���๮�� ��� �����ϰ� pageCount���� �����Ѵ�.			
	}															 //��, ���� ������ 10���� ������ �� ������ ���� ������ ���� �ȴ�.
}
