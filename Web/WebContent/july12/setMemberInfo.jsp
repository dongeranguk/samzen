<%@ page contentType="text/html; charset=euc-kr" %>
<%
	session.setAttribute("MEMBERID", "madvirus");
	session.setAttribute("NAME", "�ֹ���");

	String memberId = (String)session.getAttribute("MEMBERID");
	String name = (String)session.getAttribute("NAME");
%>
<html>
<head><title>���ǿ� ���� ����</title></head>
<body>

���ǿ� ������ �����Ͽ����ϴ�. <br>
���̵�:<%= memberId %> <br>
�̸�:<%= name %>

</body>
</html>