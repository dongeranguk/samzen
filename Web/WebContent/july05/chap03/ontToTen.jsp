<%@ page contentType="text/html; charset=euc-kr" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1-10까지의 합</title>
</head>
<body>
<%
	int sum = 0;
	for(int i = 1; i<=10; i++) {
		sum = sum + i;
	}
%>
1 부터 10까지의 합은 <%= sum %> 입니다.
</body>
</html>