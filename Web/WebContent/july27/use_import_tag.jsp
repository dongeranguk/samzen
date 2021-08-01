<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("euc-kr"); %>
<c:choose>
	<c:when test="${param.type == 'cafe'}">
		<c:import url="http://search.daum.net/search">
		<c:param name="w" value="cafe" />
		<c:param name="q" value="����� ����" />
		</c:import>
	</c:when>
	<c:when test="${param.type == 'blog'}">
		<c:import url="http://search.daum.net/search">
			<c:param name="w" value="blog" />
			<c:param name="q" value="����� ����" />
		</c:import>
	</c:when>
	<c:otherwise>
		<c:import url="use_import_tag_help.jsp">
			<c:param name="message" value="�������ּ���." />
		</c:import>
	</c:otherwise>
</c:choose>