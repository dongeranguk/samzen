<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../MVC/color.jspf" %>
<html>
<head><title>메인</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="${bodyback_c}">
<c:if test="${empty sessionScope.memId}">
<table width="500" cellpadding="0" cellspaing="0" align="center" border="1">
<tr>
	<td width="300" bgcolor="${bodyback_c}" height="20">
	$nbsp;
	</td>
	
	<form name="inform" method="post" action="/Web/logon2/loginPro.do">
	
	<td bgcolor="${title_c}" width="100" align="right">아이디</td>
	<td width="100" bgcolor="${value_c}">
	<input type="password" name="passwd" size="15" maxlength="10"></td>
</tr>
<tr>
	<td colspan="3" bgcolor="${title_c}" align="center">
	<input type="submit" name="submit" value="로그인">
	<input type="button" value="회원가입" onclick="document.location.href='/Web/logon2/inputForm.do'">
	</td>
</form>
</tr>
</table>
</c:if>
<c:if test="${!empty sessionScope.memId}">
<table width="500" cellspacing="0" cellpadding="0" align="center" border="1">
<tr>
	<td width="300" bgcolor="${bodyback_c}" height="20">하하하</td>
	
	<td rowspan="3" bgcolor="${value_c}" align="center">
	${sessionScope.memId}님이<br>
	방문하셨습니다.
	<form method="post" action="/Web/logon2/logout.do">
	<input type="submit" value="로그아웃">
	<input type="button" value="회원정보변겅" onclick="document.location.href='/Web/logon2/modify.do'">
	</form>
	</td>
</tr>
<tr>
	<td rowspan="2" bgcolor="${bodyback_c}" width="300">메인입니다.</td>
</tr>
</table>
<br>
</c:if>
</body>
</html> 