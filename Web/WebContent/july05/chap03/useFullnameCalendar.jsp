<%@ page contentType="text/html; charset=euc-kr" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Calendar Ŭ���� ���</title>
</head>
<body>
<%
	java.util.Calendar cal = java.util.Calendar.getInstance();
%>
������
	<%=cal.get(java.util.Calendar.YEAR) %>��
	<%=cal.get(java.util.Calendar.MONTH)+1 %>��
	<%=cal.get(java.util.Calendar.DATE) %>��
�Դϴ�.
</body>
</html>