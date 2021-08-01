<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="july28.board.model.ArticleListModel" %>
<%@ page import="july28.board.service.ListArticleService" %>
<%
	String pageNumberString = request.getParameter("p"); //"p" ��� �Ķ���͸� �޾� pageNumberString��ü�� ���� String ��ü �̹Ƿ� wrapper ��� x
	int pageNumber = 1; // "p" �Ķ���Ϳ� ���ϱ� ���� ������ int�� pageNumber ����
	if(pageNumberString != null && pageNumberString.length() > 0) { //"p" �Ķ���Ͱ� �ΰ��� �ƴϰų�, ���ڿ����̰� 0���� ũ�� �Ʒ��� ���๮ ����
		pageNumber = Integer.parseInt(pageNumberString); // "p" �Ķ���� String��ü�� pageNumberString��ü�� int������ ��ȯ
	}
	ListArticleService listService = ListArticleService.getInstance(); // ListArticleService ��ü�� ����
																	   //(�̱��� ���� �̹Ƿ� getInstance()�޼��带 ȣ���Ͽ� ��ü ����)
	
	ArticleListModel articleListModel = listService.getArticleList(pageNumber); // ������ ������ listService��ü��
																				// getArticleList(int requestPageNumber)�޼��带 ȣ���Ͽ�
																				// articleListModel��ü�� ����
																				// ��, �Խ��� ����Ʈ�� �����Ѵ�.
																				
	request.setAttribute("listModel", articleListModel); //������Ʈ �Ӽ��� �̿��ؼ� �Ӽ��� �����ϰ� listView.jsp�� �Ӽ��� ����
														 //listModel�� �̸��� ���� articleListModel ��ü(��, ����Ʈ)
														 
	if(articleListModel.getTotalPageCount() > 0) {		//����Ʈ�� ���������� 0���� ũ�ٸ�
		int beginPageNumber = 							//beginPageNumber������ �Ʒ��� ���๮�� �����Ͽ� ���� �����Ѵ�.
			(articleListModel.getRequestPage() - 1) / 10 * 10 + 1; // ex) (1-1) / 10*10+1 = 
		int endPageNumber = beginPageNumber + 9;
		if(endPageNumber > articleListModel.getTotalPageCount()) {
			endPageNumber = articleListModel.getTotalPageCount();
		}
		request.setAttribute("beginPage", beginPageNumber);
		request.setAttribute("endPage", endPageNumber);
	}
%>
<jsp:forward page = "listview.jsp" />