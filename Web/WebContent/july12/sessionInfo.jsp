<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page session="true" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	Date time = new Date();
	SimpleDateFormat formatter =
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<html>
<head><title>技记 沥焊</title></head>
<body>
技记 ID: <%= session.getId() %> <br>
<%
	time.setTime(session.getCreationTime());
%>
技记 积己矫埃: <%= formatter.format(time) %> <br>
<%
	time.setTime(session.getLastAccessedTime());
%>
弥辟 立加矫埃: <%= formatter.format(time) %>
</body>
</html>