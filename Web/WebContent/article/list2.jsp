<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="july28.board.model.ArticleListModel" %>
<%@ page import="july28.board.service.ListArticleService" %>
<%
	String pageNumberString = request.getParameter("p"); //"p" 라는 파라미터를 받아 pageNumberString객체에 대입 String 객체 이므로 wrapper 사용 x
	int pageNumber = 1; // "p" 파라미터와 비교하기 위해 선언한 int형 pageNumber 변수
	if(pageNumberString != null && pageNumberString.length() > 0) { //"p" 파라미터가 널값이 아니거나, 문자열길이가 0보다 크면 아래의 실행문 수행
		pageNumber = Integer.parseInt(pageNumberString); // "p" 파라미터 String객체인 pageNumberString객체를 int형으로 변환
	}
	ListArticleService listService = ListArticleService.getInstance(); // ListArticleService 객체를 생성
																	   //(싱글톤 패턴 이므로 getInstance()메서드를 호출하여 객체 생성)
	
	ArticleListModel articleListModel = listService.getArticleList(pageNumber); // 위에서 생성한 listService객체의
																				// getArticleList(int requestPageNumber)메서드를 호출하여
																				// articleListModel객체를 생성
																				// 즉, 게시판 리스트를 생성한다.
																				
	request.setAttribute("listModel", articleListModel); //리퀘스트 속성을 이용해서 속성을 지정하고 listView.jsp로 속성을 전달
														 //listModel의 이름을 가진 articleListModel 객체(즉, 리스트)
														 
	if(articleListModel.getTotalPageCount() > 0) {		//리스트의 페이지수가 0보다 크다면
		int beginPageNumber = 							//beginPageNumber변수에 아래의 실행문을 수행하여 값을 대입한다.
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