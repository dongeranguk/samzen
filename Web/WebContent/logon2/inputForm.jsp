<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../MVC/color.jspf" %>
<html>
<head><title>ȸ������</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
function checkIt() {
	var userinput = eval("document.userinput");
	if(!userinput.id.value) {
		alert("ID�� �Է��ϼ���.");
		return false;
	}
	
	if(!userinput.passwd.value) {
		alert("��й�ȣ�� �Է��ϼ���.");
		return false;
	}
	
	if(userinput.passwd.value != userinput.passwd2.value) {
		alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
		return false;
	}
	
	if(!userinput.jumin1.value || !userinput.jumin2.value) {
		alert("�ֹε�Ϲ�ȣ�� �Է��ϼ���.");
		return false;
	}
}

function openConfirmId(userinput) {
	if(userinput.id.value =="") {
		alert("ID�� �Է��ϼ���.");
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
	<font size="+1"><b>ȸ������</b></font></td>
</tr>
<tr>
	<td width="200" bgcolor="${value_c}"><b>���̵� �Է�</b></td>
	<td width="400" bgcolor="${value_c}">&nbsp;</td>
</tr>
<tr>
	<td width="200">����� ID</td>
	<td width="400">
	<input type="text" name="id" size="10" maxlength="12">
	<input type="button" name="confirm_id" value="ID �ߺ�Ȯ��" onclick="openConfirmId(this.form)">
	</td>
</tr>
<tr>
	<td width="200">��й�ȣ Ȯ��</td>
	<td width="400">
	<input type="password" name="passwd2" size="15" maxlength="12"></td>
</tr>
<tr>
	<td width="200" bgcolor="${value_c}"><b>�������� �Է�</b></td>
	<td width="400" bgcolor="${value_c}">&nbsp;</td>
</tr>
<tr>
	<td width="200">����� �̸�</td>
	<td width="400">
	<input type="text" name="name" size="15" maxlength="10"></td>
</tr>
<tr>
	<td width="200">�ֹε�Ϲ�ȣ</td>
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
	<input type="submit" name="confirm" value="�� ��">
	<input type="reset" name="reset" value="�ٽ� �Է�">
	<input type="button" value="�ڷΰ���" onclick="document.location.href='/Web/logon2/main.do'">
	</td>
</tr>
</table>
</form>
</body>
</head>
</html>