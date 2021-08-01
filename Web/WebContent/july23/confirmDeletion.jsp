<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head>
<title>방명록 삭제 확인</title>
</head>
<body>
<form action="deleteMessage.jsp" method="post">
<input type="hidden" name="messageId"
	value="<%=request.getParameter("messageId") %>" />
방명록을 삭제하시려면 암호를 입력해주세요<br/>
암호 : <input type="password" name="password" /><br/>
<input type="submit" value="방명록 삭제하기" />
</form>
</body>
</html>