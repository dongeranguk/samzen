<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head><title>로그인</title></head>
<body>
<form action="<%=request.getContextPath()%>/july12/member2/sessionLogin.jsp" method="post">
아이디<input type="text" name="id" size="10">
비밀번호<input type="password" name="password" size="10">
<input type="submit" value="로그인">
</form>
</body>
</html>
