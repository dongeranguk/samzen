<%@ page contentType="text/html; charset=euc-kr" %>
<%
	request.setAttribute("name", "최범균");
%>
<html>
<head><title>EL Object</title></head>
<body>

요청 URI :${pageContext.request.requestURI} <br> <!-- pageContext.getRequest().getRequestURI()의 값을 출력한다 -->
request의 name 속성 : ${requestScope.name} <br> <!-- request 영역에 저장된 name 속성의 값을 출력한다. -->
code 파라미터 : ${param.code} <!-- 이름이 'code'인 요청 파라미터의 값을 출력한다. 존재하지 않을 경우 아무 값도 출력하지 않는다. -->
</body>
</html>