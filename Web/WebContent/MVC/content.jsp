<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="color.jspf"%>

<html>
<head><title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
/* a:link {color:black; text-decoration:none;}
a:visited {}
a:active {text-decoration:underline;}
a:hover {text-decoration:underline; background-image:url('text_dottdeline.gif'); background-repeat:repeat-x; backgroud-position:50% 100%;} */
</style>
<style>
/* @font-face {font-family:����; src:url();}
body, td, a, div, p, pre, input, textarea {font-family:����; font-size:9pt;} */
</style>
</head>
<body bgcolor="${bodyback_c}">
<!-- contentAction���� �Ѿ�� �Ӽ� �� num, pageNum, article -->
<center><b>�۳��� ����</b>
<br>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0" align="center">
<tr height="30">
	<td align="center" width="125" bgcolor="${value_c}">�۹�ȣ</td>
	<td align="center" width="125" align="center">${article.num}</td>
	<td align="center" width="125" bgcolor="${value_c}">��ȸ��</td>
	<td align="center" width="125" align="center">${article.readcount}</td>
</tr>
<tr>
	<td align="center" width="125" bgcolor="${value_c}">�ۼ���</td>
	<td align="center" width="125">${article.writer}</td>
	<td align="center" width="125" bgcolor="${value_c}">�ۼ���</td>
	<td align="center" width="125">${article.reg_date}</td>
</tr>
<tr height="30">
	<td align="center" width="125" bgcolor="${value_c}">������</td>
	<td align="center" width="375" colspan="3">${article.subject}</td>
</tr>
<tr height="30">
	<td align="center" width="125" bgcolor="${value_c}">�۳���</td>
	<td align="left" width="375" colspan="3"><pre>${article.content}</pre></td>
</tr>
<tr height="30">
	<td colspan="4" bgcolor="${value_c}" align="right">
	<input type="button" value="�ۼ���"
	onclick="document.location.href='/Web/MVC/updateForm.do?num=${article.num}&pageNum=${pageNum}'">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="�ۻ���"
	onclick="document.location.href='/Web/MVC/deleteForm.do?num=${article.num}&pageNum=${pageNum}'">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="��۾���"
	onclick="document.location.href='/Web/MVC/writeForm.do?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}'">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="��Ϻ���"
	onclick="document.location.href='/Web/MVC/list.do?pageNum=${pageNum}'">
	</td>
</tr>
</table>
</form>
</body>
</html>