<%@ page contentType="text/html; charset=euc-kr" %>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
%>
<html>
<head><title>�α��� ����</title></head>
<body>
<%
	if(id.equals(password)) {
		session.setAttribute("MEMBERID", id);
%>
�α��ο� �����Ͽ����ϴ�.
</body>
</html>
<%
	} else {
%>
<script>
alert("�α��ο� �����Ͽ����ϴ�.");
history.go(-1);
%>
</script>
<%
	}
%>