<%@ page contentType="text/html; charset=euc-kr" %>
<%@ include file = "color.jsp" %>
<html>
<head>
<title>ȸ������</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript">
	function checkIt() {
		var userinput = eval("document.userinput");
		if(!userinput.id.value) {
			alert("���̵� �Է����ּ���.");
			userinput.id.focus();
			return false;
		}
		
		if(!userinput.passwd.value) {
			alert("��й�ȣ�� �Է����ּ���.");
			userinput.passwd.focus();
			return false;
		}
		
		if(!userinput.passwd.value != userinput.passwd2.value) {
			alert("��й�ȣ�� �����ϰ� �Է����ּ���.");
			return false;
		}
	}
	
	function openConfirmId(userinput) {
		if(userinput.id.value == "") {
			alert("���̵� �Է����ּ���.");
			return false;
		}
		url = "../logon/confirmId.jsp?id="+userinput.id.value;
		
		window.open(url, "confirm",
				"toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
	}
</script>
</head>
<body bgcolor="<%=bodyback_c %>">
<form method="post" action="inputPro.jsp" name="userinput" onSubmit="return checkIt()">
	<table width="400" border="1" cellspacing="0" cellpadding="3" align="center">
		<tr>
			<td colspan="2" height="39" align="center" bgcolor="<%=value_c %>">
			<font size="+1"><b>ȸ������</b></font>
			</td>
		</tr>
		<tr>
			<td width="100" bgcolor="<%=value_c %>" align="center"><b>����� ID</b></td>
			<td width="300" bgcolor="<%=value_c %>">
				<input type="text" name="id" size="10" maxlength="12">
				<input type="button" name="confirm_id" value="ID �ߺ�Ȯ��" onClick="openConfirmId(this.form)">
			</td>
		</tr>
		<tr>
			<td width="100" bgcolor="<%=value_c %>" align="center"><b>��й�ȣ</b></td>
			<td width="300" bgcolor="<%=value_c %>">
				<input type="password" name="passwd" size="10" maxlength="12">
			</td>
		</tr>
		<tr>
			<td width="100" bgcolor="<%=value_c %>" align="center"><b>��й�ȣ Ȯ��</b></td>
			<td width="300" bgcolor="<%=value_c %>">
				<input type="password" name="passwd2" size="10" maxlength="12">
			</td>
		</tr>
	</table>
</form>
</body>
</html>