<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page errorPage = "error/error_view.jsp" %>
<html>
<head>
<meta charset="EUC-KR">
<title>테마 갤러리</title>
<style>
A { color:blue; font-weight:bold; text-decoration:none}
A:hober { color:blue; font-weight:bold; text-decoration:underline}
</style>
</head>
<body>

<table width="100%" border="1" cellpadding="2" cellspacing="0">
<tr>
	<td>
	<jsp:include page="template/module/top.jsp" flush="false"/>
	</td>
</tr>
<tr>
	<td>
	<!--내용 부분:시작 -->
	<jsp:include page="${param.CONTENTPAGE }" flush="false"/>
	<!-- 내용 부분:끝 -->
	</td>
</tr>
<tr>
	<td>
	<jsp:include page="template/module/bottom.jsp" flush="false"/>
	</td>
</tr>
</table>
</body>
</html>