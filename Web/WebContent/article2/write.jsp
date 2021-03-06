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
<head><title>게시글 작성</title></head>
<body>게시글을 동록했습니다.
<br/>
<a href="<c:url value='list.jsp' />">목록 보기</a>
<a href="<c:url value='read.jsp?articleId=${postedArticle.id}' />">게시글 읽기</a>
</body>
</html>