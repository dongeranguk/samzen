<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page errorPage= "errorView.jsp" %>
<%@ page import = "july23.model.Message" %>
<%@ page import = "july23.service.WriteMessageService" %>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="message" class="july23.model.Message">
	<jsp:setProperty name="message" property="*" />
</jsp:useBean>
<%
	WriteMessageService writeService = WriteMessageService.getInstance();
	writeService.write(message);
%>
<html>
<head>
<title>���� �޼��� �����</title>
</head>
<body>
������ ������ϴ�.
<br/>
<a href="list.jsp">[��� ����]</a>
</body>
</html>