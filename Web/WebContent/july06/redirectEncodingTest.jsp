<%@ page import="java.net.URLEncoder" %>
<%@ page pageEncoding="euc-kr" %>
<%
	String value="자바";
	String encodedValue = URLEncoder.encode(value, "euc-kr");
	response.sendRedirect("./index.jsp?name=" + encodedValue);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>