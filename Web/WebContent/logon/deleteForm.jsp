<%@ page contentType="text/html; charset=euc-kr" %>
<%@ include file="color.jsp" %>
<html>
<head><title>회원 탈퇴</title>
<link href="style.css" rel="stylesheet" type="html/css">

<script language="javascript">
function begin() {
	document.myform.passwd.focus();
}

function checkIt() {
	if(!document.userinput.passwd.value) {
		alert("비밀번호가 맞지 않습니다.");
		document.myform.passwd.focus();
		return false;
	}
}
</script>
</head>
<body onload="begin()" bgcolor="<%=bodyback_c %>">
<form name="myform" action="deletePro.jsp" method="post" onSubmit="return checkIt()">
<table cellpadding="1" cellspacing="0" width="260" border="1" align="center">
<tr height="30">
	<td colspan="2" align="middle" bgcolor="<%=title_c %>">
	<font size="+1"><b>회원 탈퇴</b></font>
	</td>
</tr>
<tr height = "30">
	<td width="110" bgcolor="<%=value_c %>" align="center">비밀번호</td>
	<td width="150" align="center">
		<input type="password" name="passwd" size="15" maxlength="12">
	</td>
</tr>
<tr height="30">
	<td colspan="2" align="middle" bgcolor="<%=value_c %>">
		<input type="submit" value="회원 탈퇴" >
		<input type="button" value="취소" onclick="javascript:window.location='main.jsp'">
	</td>
</tr>
</table>

</body>
</html>