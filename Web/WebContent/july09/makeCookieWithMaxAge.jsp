<%@ page contentType="text/html; charset=euc-kr" %>
<%
	Cookie cookie = new Cookie("oneS", "1time");
	cookie.setMaxAge(10);// ��Ű�� ��ȿ�ð� 10�ʷ� ����
	response.addCookie(cookie);
%>
<html>
<head><title>��Ű ��ȿ �ð� ����</title></head>
<body>

��ȿ �ð��� 10���� oneS ��Ű ����
</body>
</html>