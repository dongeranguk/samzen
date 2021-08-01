<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="july28.board.service.ReadArticleService" %>
<%@ page import="july28.board.model.Article" %>
<%@ page import="july28.board.service.ArticleNotFoundException" %>
<%
	String viewPage = null;
	try {
		int articleId = Integer.parseInt(request.getParameter("articleId"));
		Article article = ReadArticleService.getInstance().getArticle(articleId);
		viewPage = "update_form_view.jsp";
		request.setAttribute("article", article);
	} catch(ArticleNotFoundException ex) {
		viewPage = "article_not_found.jsp";
	}
%>
<jsp:forward page = "<%=viewPage %>" />