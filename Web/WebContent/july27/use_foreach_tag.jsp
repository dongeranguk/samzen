<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.HashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	HashMap<String, Object> mapData = new HashMap<String, Object>();
	mapData.put("name", "최범균");
	mapData.put("today", new java.util.Date());
%>
<c:set var="intArray" value="<%=new int[] {1,2,3,4,5} %>" />
<c:set var="map" value="<%=mapData %>" />
<html>
<head><title>forEach 태그</title></head>
<body>
<h4>1부터 100까지의 홀수의 합</h4>
<c:set var="sum" value="0" />
<c:forEach var="i" begin="1" end="100" step="2">
<c:set var="sum" value="${sum + i}" />
</c:forEach>
결과 : ${sum}
<%--step : 지정한 숫자만큼 증가 --%>
<h4>구구단:4단</h4>
<ul>
<c:forEach var="i" begin="1" end="9">
	<li>4 * ${i} = ${4 * i}
</c:forEach>
</ul>

<h4>int형 배열</h4>

<c:forEach var="i" items="${intArray}" begin="2" end="4" varStatus="status">
	${status.index}-${status.count}-[${i}]</br>
</c:forEach>
<%--
var : 초기값
begin : 지정한 인덱스 번호부터 시작
end : 지정한 인덱스 번호 까지 반복
status.index : 인덱스 번호, status : 반복 횟수 --%>
<h4>Map</h4>

<c:forEach var="i" items="${map}" >
	${i.key} = ${i.value}<br>
</c:forEach>
</body>
</html>