<%@ page contentType="html/text; charset=euc-kr" %>
<%@ page import="article.model.ArticleListModel" %>
<%@ page import="article.service.ListArticleService" %>
<% 
	String pageNumberString = request.getParameter("p");
	int pageNumber = 1; 
	if(pageNumberString != null && pageNumberString.length() > 0) { // pageNumberString�� null�� �ƴϰ� pageNumberString.length() ���� 0���� ũ�ٸ�
		pageNumber = Integer.parseInt(pageNumberString); //pageNumberString�� int������ ��ȯ�Ͽ� pageNumber ������ �����Ѵ�.
	}
	
	ListArticleService listService = ListArticleService.getInstance(); //�Խñ��� �����ֱ����� ListArticleService��ü�� ����
	ArticleListModel articleListModel = listService.getArticleList(pageNumber); // ListArticleService.getArticleList()�޼��尡 ArticleListModel�� �����Ͽ� articleListModel��ü�� ����
	request.setAttribute("listModel", articleListModel); // ������ articleListModel��ü�� requset������ listModel�� �̸����� �Ӽ��� �����Ѵ�. 
	
	if(articleListModel.getTotalPageCount() > 0) { //articleListModel.getTotalPageCount()�޼��尡 �о�� ���� 0���� ũ�ٸ�
		int beginPageNumber = 
				(articleListModel.getRequestPage() - 1) / 10 * 10 + 1; // beginPageNumber������ articleListModel.getRequestPage()�޼����� ������� ����Ͽ� �����Ѵ�.
		int endPageNumber = beginPageNumber + 9; // endPageNumber ������ ���� beginPageNumber�� 9�� ���� �� �����Ѵ�.
		if(endPageNumber > articleListModel.getTotalPageCount()) { // ����, endPageNumber�� articleListModel.getTotalPageCount()�޼���� �о�� ������ ũ�ٸ�
			endPageNumber = articleListModel.getTotalPageCount(); // endPageNumber�� articleListModel.getTotalPageCount()�޼���� �о�� ���� �����Ѵ�.
		}
		request.setAttribute("beginPage", beginPageNumber);
		request.setAttribute("endPage", endPageNumber);
	}
%>
	
<jsp:forward page="list_view.jsp"/>