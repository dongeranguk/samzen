<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../MVC/color.jspf" %>
<html>
<head><title>회원가입</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
function checkIt() {
	var userinput = eval("document.userinput");
	if(!userinput.id.value) {
		alert("ID를 입력하세요.");
		return false;
	}
	
	if(!userinput.passwd.value) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	
	if(userinput.passwd.value != userinput.passwd2.value) {
		alert("비밀번호를 동일하게 입력하세요.");
		return false;
	}
	
	if(!userinput.jumin1.value || !userinput.jumin2.value) {
		alert("주민등록번호를 입력하세요.");
		return false;
	}
}

function openConfirmId(userinput) {
	if(userinput.id.value =="") {
		alert("ID를 입력하세요.");
		return;
	}
	url="/Web/logon2/confirmId.do?id=" + userinput.id.value;
	
	open(url, "confirm",
			"toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=550 height=200");
}
</script>
<body bgcolor="${bodyback_c}">
<form method="post" action="/Web/logon2/inputPro.do" name="userinput" onsubmit="return checkIt()">
<table width="600" border="1" cellpadding="0" cellspacing="3" align="center">
<tr>
	<td colspan="2" height="39" align="center" bgcolor="${value_c}">
	<font size="+1"><b>회원가입</b></font></td>
</tr>
<tr>
	<td width="200" bgcolor="${value_c}"><b>아이디 입력</b></td>
	<td width="400" bgcolor="${value_c}">&nbsp;</td>
</tr>
<tr>
	<td width="200">사용자 ID</td>
	<td width="400">
	<input type="text" name="id" size="10" maxlength="12">
	<input type="button" name="confirm_id" value="ID 중복확인" onclick="openConfirmId(this.form)">
	</td>
</tr>
<tr>
	<td width="200">비밀번호 확인</td>
	<td width="400">
	<input type="password" name="passwd2" size="15" maxlength="12"></td>
</tr>
<tr>
	<td width="200" bgcolor="${value_c}"><b>개인정보 입력</b></td>
	<td width="400" bgcolor="${value_c}">&nbsp;</td>
</tr>
<tr>
	<td width="200">사용자 이름</td>
	<td width="400">
	<input type="text" name="name" size="15" maxlength="10"></td>
</tr>
<tr>
	<td width="200">주민등록번호</td>
	<td width="400">
	<input type="text" name="jumin1" size="7" maxlength="6">
	-<input type="text" name="jumin2" size="7" maxlength="7">
	</td>
</tr>
<tr>
	<td width="200">E-mail</td>
	<td width="400">
	<input type="text" name="email" size="40" maxlength="30">
	</td>
</tr>
<tr>
	<td width="200">Blog</td>
	<td width="400">
	<input type="text" name="blog" size="60" maxlength="50">
	</td>
</tr>
<tr>
	<td colspan="2" align="center" bgcolor="${value_c}">
	<input type="submit" name="confirm" value="등 록">
	<input type="reset" name="reset" value="다시 입력">
	<input type="button" value="뒤로가기" onclick="document.location.href='/Web/logon2/main.do'">
	</td>
</tr>
</table>
</form>
</body>
</head>
</html>