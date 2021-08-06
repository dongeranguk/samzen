<%@ page contentType="html/text; charset=euc-kr" %>
<%@ page import="article.model.ArticleListModel" %>
<%@ page import="article.service.ListArticleService" %>
<% 
	String pageNumberString = request.getParameter("p");
	int pageNumber = 1; 
	if(pageNumberString != null && pageNumberString.length() > 0) { // pageNumberString이 null이 아니고 pageNumberString.length() 값이 0보다 크다면
		pageNumber = Integer.parseInt(pageNumberString); //pageNumberString을 int형으로 변환하여 pageNumber 변수에 대입한다.
	}
	
	ListArticleService listService = ListArticleService.getInstance(); //게시글을 보여주기위해 ListArticleService객체를 생성
	ArticleListModel articleListModel = listService.getArticleList(pageNumber); // ListArticleService.getArticleList()메서드가 ArticleListModel을 생성하여 articleListModel객체에 대입
	request.setAttribute("listModel", articleListModel); // 생성한 articleListModel객체를 requset영역의 listModel의 이름으로 속성을 설정한다. 
	
	if(articleListModel.getTotalPageCount() > 0) { //articleListModel.getTotalPageCount()메서드가 읽어온 값이 0보다 크다면
		int beginPageNumber = 
				(articleListModel.getRequestPage() - 1) / 10 * 10 + 1; // beginPageNumber변수에 articleListModel.getRequestPage()메서드의 결과값을 계산하여 대입한다.
		int endPageNumber = beginPageNumber + 9; // endPageNumber 변수는 계산된 beginPageNumber에 9를 더한 뒤 대입한다.
		if(endPageNumber > articleListModel.getTotalPageCount()) { // 만약, endPageNumber가 articleListModel.getTotalPageCount()메서드로 읽어온 값보다 크다면
			endPageNumber = articleListModel.getTotalPageCount(); // endPageNumber에 articleListModel.getTotalPageCount()메서드로 읽어온 값을 대입한다.
		}
		request.setAttribute("beginPage", beginPageNumber);
		request.setAttribute("endPage", endPageNumber);
	}
%>
	
<jsp:forward page="list_view.jsp"/>