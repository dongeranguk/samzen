<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="july28.board.service.ReplyArticleService" %>
<%@ page import="july28.board.model.Article" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="replyingRequest"
	class="july28.board.model.ReplyingRequest" />
<jsp:setProperty name="replyingRequest" property="*" />
<%
	String viewPage = null;
	try {
		Article postedArticle = ReplyArticleService.getInstance().
				reply(replyingRequest);
		request.setAttribute("postedArticle", postedArticle);
		viewPage = "reply_success.jsp";
	} catch(Exception ex) {
		viewPage = "reply_error.jsp";
		request.setAttribute("replyException", ex);
	}
%>
<jsp:forward page="<%=viewPage %>"/>