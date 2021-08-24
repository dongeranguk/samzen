<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="color.jspf"%>

<html>
<head><title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
/* a:link {color:black; text-decoration:none;}
a:visited {}
a:active {text-decoration:underline;}
a:hover {text-decoration:underline; background-image:url('text_dottdeline.gif'); background-repeat:repeat-x; backgroud-position:50% 100%;} */
</style>
<style>
/* @font-face {font-family:굴림; src:url();}
body, td, a, div, p, pre, input, textarea {font-family:굴림; font-size:9pt;} */
</style>
</head>
<body bgcolor="${bodyback_c}">
<!-- contentAction에서 넘어온 속성 값 num, pageNum, article -->
<center><b>글내용 보기</b>
<br>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0" align="center">
<tr height="30">
	<td align="center" width="125" bgcolor="${value_c}">글번호</td>
	<td align="center" width="125" align="center">${article.num}</td>
	<td align="center" width="125" bgcolor="${value_c}">조회수</td>
	<td align="center" width="125" align="center">${article.readcount}</td>
</tr>
<tr>
	<td align="center" width="125" bgcolor="${value_c}">작성자</td>
	<td align="center" width="125">${article.writer}</td>
	<td align="center" width="125" bgcolor="${value_c}">작성일</td>
	<td align="center" width="125">${article.reg_date}</td>
</tr>
<tr height="30">
	<td align="center" width="125" bgcolor="${value_c}">글제목</td>
	<td align="center" width="375" colspan="3">${article.subject}</td>
</tr>
<tr height="30">
	<td align="center" width="125" bgcolor="${value_c}">글내용</td>
	<td align="left" width="375" colspan="3"><pre>${article.content}</pre></td>
</tr>
<tr height="30">
	<td colspan="4" bgcolor="${value_c}" align="right">
	<input type="button" value="글수정"
	onclick="document.location.href='/Web/MVC/updateForm.do?num=${article.num}&pageNum=${pageNum}'">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="글삭제"
	onclick="document.location.href='/Web/MVC/deleteForm.do?num=${article.num}&pageNum=${pageNum}'">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="답글쓰기"
	onclick="document.location.href='/Web/MVC/writeForm.do?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}'">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="목록보기"
	onclick="document.location.href='/Web/MVC/list.do?pageNum=${pageNum}'">
	</td>
</tr>
</table>
</form>
</body>
</html>