<%@ page contentType="text/html; charset=euc-kr" %>
<%
	session.setAttribute("MEMBERID", "madvirus");
	session.setAttribute("NAME", "최범균");

	String memberId = (String)session.getAttribute("MEMBERID");
	String name = (String)session.getAttribute("NAME");
%>
<html>
<head><title>세션에 정보 저장</title></head>
<body>

세션에 정보를 저장하였습니다. <br>
아이디:<%= memberId %> <br>
이름:<%= name %>

</body>
</html>