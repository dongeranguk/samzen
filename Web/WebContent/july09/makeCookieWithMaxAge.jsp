<%@ page contentType="text/html; charset=euc-kr" %>
<%
	Cookie cookie = new Cookie("oneS", "1time");
	cookie.setMaxAge(10);// 쿠키의 유효시간 10초로 지정
	response.addCookie(cookie);
%>
<html>
<head><title>쿠키 유효 시간 설정</title></head>
<body>

유효 시간이 10초인 oneS 쿠키 생성
</body>
</html>