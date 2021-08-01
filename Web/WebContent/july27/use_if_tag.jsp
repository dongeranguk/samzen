<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>if 태그</title></head>
<body>
<c:if test="true">
무조건 수행 <br>
</c:if>

<c:if test="${param.name == 'bk' }">
name 파라미터의 값이 ${param.name} 입니다. <br>
</c:if>

<c:if test="${18 <param.age}">
당신의 나이는 18세 이상입니다.
</c:if>

<%--c:if문은 조건을 만족하면 만족한 조건문을 모두 실행한다. --%>

<%--c:choose문은 조건을 하나라도 만족하면 만족하는 조건문을 실행하고 
나머지 조건문은 실행하지 않는다. --%>
</body>
</html>