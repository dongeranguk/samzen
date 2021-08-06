<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import = "article.service.WriteArticleService" %>
<%@ page import = "article.model.Article" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="writingRequest"
	class = "article.model.WritingRequest" />
<jsp:setProperty name="writingRequest" property="*" />
<%
	Article postedArticle =
		WriteArticleService.getInstance().write(writingRequest);
	request.setAttribute("postedArticle", postedArticle);
%>
<html>
<head><title>�Խñ� �ۼ�</title></head>
<body>�Խñ��� �����߽��ϴ�.
<br/>
<a href="<c:url value='list.jsp' />">��� ����</a>
<a href="<c:url value='read.jsp?articleId=${postedArticle.id}' />">�Խñ� �б�</a>
</body>
</html>