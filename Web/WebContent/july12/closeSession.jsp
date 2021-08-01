<%@ page contentType="text/html; charset=euc-kr" %>
<%
	session.invalidate();
%>
<html>
<head><title>세션 종료</title></head>
<body>

세션을 종료하였습니다.
 <%-- <%= session.getAttribute("NAME") %> 세션이 종료 되면 세션이 삭제되고 속성의 값을 불러올수없다.  --%>
</body>
</html>