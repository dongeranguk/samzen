<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="util.CookieBox" %>
<%
	response.addCookie(CookieBox.createCookie("name", "�ֹ���"));
	response.addCookie(
			CookieBox.createCookie("id", "madvirus", "/Web/WebContent/july09", -1));
%>
<html>
<head><title>CookieBox ��� ��</title></head>
<body>

CookieBox�� ����Ͽ� ��Ű ����
</body>
</html>
