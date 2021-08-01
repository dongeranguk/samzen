<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="july28.board.service.UpdateArticleService" %>
<%@ page import="july28.board.model.Article" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="updateRequest"
	class="july28.board.model.UpdateRequest" />
<jsp:setProperty name="updateRequest" property="*" />
<%
	String viewPage = null;
	try {
		Article article =
				UpdateArticleService.getInstance().update(updateRequest);
		request.setAttribute("updatedArticle", article);
		viewPage = "update_success.jsp";
	} catch(Exception ex) {
		request.setAttribute("updateException", ex);
		viewPage = "update_error.jsp";
	}
%>
<jsp:forward page="<%=viewPage %>" />