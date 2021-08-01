<%@ page contentType="text/html; charset=euc-kr" %>
<%
	String id=request.getParameter("memberId");
	if(id.equals("era13")) {
		response.sendRedirect("./index.jsp");
	} else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인에 실패</title>
</head>
<body>
아이디가 era13이 아닙니다.
</body>
</html>
<%
	}
%>