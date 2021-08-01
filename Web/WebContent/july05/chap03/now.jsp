<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.Date" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<%
	Date now = new Date();
%>
<html>
<head>
<meta charset="EUC-KR">
<title>현재 시간</title>
</head>
<body>
현재 시각:
<%=now %>
</body>
</html>