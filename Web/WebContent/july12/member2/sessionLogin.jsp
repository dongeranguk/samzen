<%@ page contentType="text/html; charset=euc-kr" %>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
%>
<html>
<head><title>로그인 성공</title></head>
<body>
<%
	if(id.equals(password)) {
		session.setAttribute("MEMBERID", id);
%>
로그인에 성공하였습니다.
</body>
</html>
<%
	} else {
%>
<script>
alert("로그인에 실패하였습니다.");
history.go(-1);
%>
</script>
<%
	}
%>