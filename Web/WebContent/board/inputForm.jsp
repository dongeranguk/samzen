<%@ page contentType="text/html; charset=euc-kr" %>
<%@ include file = "color.jsp" %>
<html>
<head>
<title>회원가입</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript">
	function checkIt() {
		var userinput = eval("document.userinput");
		if(!userinput.id.value) {
			alert("아이디를 입력해주세요.");
			userinput.id.focus();
			return false;
		}
		
		if(!userinput.passwd.value) {
			alert("비밀번호를 입력해주세요.");
			userinput.passwd.focus();
			return false;
		}
		
		if(!userinput.passwd.value != userinput.passwd2.value) {
			alert("비밀번호를 동일하게 입력해주세요.");
			return false;
		}
	}
	
	function openConfirmId(userinput) {
		if(userinput.id.value == "") {
			alert("아이디를 입력해주세요.");
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
			<font size="+1"><b>회원가입</b></font>
			</td>
		</tr>
		<tr>
			<td width="100" bgcolor="<%=value_c %>" align="center"><b>사용자 ID</b></td>
			<td width="300" bgcolor="<%=value_c %>">
				<input type="text" name="id" size="10" maxlength="12">
				<input type="button" name="confirm_id" value="ID 중복확인" onClick="openConfirmId(this.form)">
			</td>
		</tr>
		<tr>
			<td width="100" bgcolor="<%=value_c %>" align="center"><b>비밀번호</b></td>
			<td width="300" bgcolor="<%=value_c %>">
				<input type="password" name="passwd" size="10" maxlength="12">
			</td>
		</tr>
		<tr>
			<td width="100" bgcolor="<%=value_c %>" align="center"><b>비밀번호 확인</b></td>
			<td width="300" bgcolor="<%=value_c %>">
				<input type="password" name="passwd2" size="10" maxlength="12">
			</td>
		</tr>
	</table>
</form>
</body>
</html>