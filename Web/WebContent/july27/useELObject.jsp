<%@ page contentType="text/html; charset=euc-kr" %>
<%
	request.setAttribute("name", "�ֹ���");
%>
<html>
<head><title>EL Object</title></head>
<body>

��û URI :${pageContext.request.requestURI} <br> <!-- pageContext.getRequest().getRequestURI()�� ���� ����Ѵ� -->
request�� name �Ӽ� : ${requestScope.name} <br> <!-- request ������ ����� name �Ӽ��� ���� ����Ѵ�. -->
code �Ķ���� : ${param.code} <!-- �̸��� 'code'�� ��û �Ķ������ ���� ����Ѵ�. �������� ���� ��� �ƹ� ���� ������� �ʴ´�. -->
</body>
</html>