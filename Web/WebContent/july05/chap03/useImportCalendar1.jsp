<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Calendar Ŭ���� ���</title>
</head>
<body>
<%
	Calendar cal = Calendar.getInstance();
%>
������
	<%=cal.get(Calendar.YEAR) %>��
	<%=cal.get(Calendar.MONTH)+1 %>��
	<%=cal.get(Calendar.DATE) %>��
�Դϴ�.
</body>
</html>