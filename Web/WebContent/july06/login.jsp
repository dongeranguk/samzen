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
<title>�α��ο� ����</title>
</head>
<body>
���̵� era13�� �ƴմϴ�.
</body>
</html>
<%
	}
%>