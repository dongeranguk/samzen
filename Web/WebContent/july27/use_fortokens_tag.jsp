<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>forTokens 태그</title></head>
<body>

<b>콤마</b>와 점을 구분자로 사용 :<br>
<c:forTokens var="token"
			items="빨강색. 주황색, 노란색, 초록색, 파랑색, 남색, 보라색"
			delims=",.">
${token} 
</c:forTokens> <br> <br>

콤마와 <b>점</b>을 구분자로 사용 :<br>
<c:forTokens var="token2" 
			items="빨강색. 주황색. 노란색. 초록색. 파랑색. 남색. 보라색" 
			delims=",.">
${token2}
</c:forTokens>
</body>
</html>