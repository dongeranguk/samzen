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
<title>방명록 메세지 남기기</title>
</head>
<body>
방명록을 남겼습니다.
<br/>
<a href="list.jsp">[목록 보기]</a>
</body>
</html>