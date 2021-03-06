package article.model;

import java.util.ArrayList;
import java.util.List;

public class ArticleListModel {
	
	private List<Article> articleList;
	private int requestPage;
	private int totalPageCount;
	private int startRow;
	private int endRow;
	
	public ArticleListModel() {
		this(new ArrayList<Article>(), 0, 0, 0, 0);
	}
	
	public ArticleListModel(List<Article> articleList, int requestPageNumber, int totalPageCount,
			int startRow, int endRow) {
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
		return ! articleList.isEmpty(); // 리스트가 비어있으면 true, 비어있지않으면 false 반환 앞에 NOT연산자가 붙으므로 반대로 반환
	}

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
	
	
}
