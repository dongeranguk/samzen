<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>시간대 목록</title></head>
<body>

<core:forEach var="id" items="<%= java.util.TimeZone.getAvailableIDs() %>">
	${id} <br/>
	</core:forEach>
</body>
</html>
