<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head><title>글 수정</title></head>
<body>
수정이 완료되었습니다.
<br/>
<a href="list.jsp?p=${param.p}">목록보기</a>
<a href="read.jsp?articleId=${updatedArticle.id}&p=${param.p}">게시글 읽기</a>
</body>
</html>