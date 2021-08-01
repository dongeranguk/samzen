<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:setBundle var="message" basename="resource.message" />

<fmt:message bundle="${message}" key="TITLE" var="title" />
<html>
<head><title>${title}</title></head>
<body>

<fmt:message bundle="${message}" key="GREETING" />
<br>
<c:if test="${! empty param.id}">
	<fmt:message bundle="${message}" key="VISITOR">
	<fmt:param value="${param.id }" />
	</fmt:message>
</c:if>
<%-- <fmt:setBundle>태그는 위에서 닫아줘야 오류 x
아래에서 닫는 태그 넣으면 오류 발생(fmt:setBundle must be empty) --%>
</body>
</html>