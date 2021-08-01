package july28.board.model;

import java.util.ArrayList;
import java.util.List;

public class ArticleListModel {
	//페이징을 위한 변수 선언
	private List<Article> articleList;
	private int requestPage;
	private int totalPageCount;
	private int startRow;
	private int endRow;
	
	//생성자 오버로딩
	public ArticleListModel() {
		this(new ArrayList<Article>(), 0, 0, 0, 0);  //초기값으로 지정하는 생성자
	}
	
	public ArticleListModel(List<Article> articleList, int requestPageNumber, //매개변수를 받아 변수에 대입하는 생성자
			int totalPageCount, int startRow, int endRow) {
		this.articleList = articleList;
		this.requestPage = requestPageNumber;
		this.totalPageCount = totalPageCount;
		this.startRow = startRow;
		this.endRow = endRow;
 	}
	
	public List<Article> getArticleList() {
		return articleList;
	}
	
	public boolean isHasArticle() {
		return ! articleList.isEmpty();
	}
	//리스트가 비어있으면 false, 비어있지 않으면 true

	public int getRequestPage() {
		return requestPage;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}
	//생성자에서 변수들을 설정해주므로 get메서드만 선언
}
