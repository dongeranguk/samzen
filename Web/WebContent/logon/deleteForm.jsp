<%@ page contentType="text/html; charset=euc-kr" %>
<%@ include file="color.jsp" %>
<html>
<head><title>ȸ?? Ż??</title>
<link href="style.css" rel="stylesheet" type="html/css">

<script language="javascript">
function begin() {
	document.myform.passwd.focus();
}

function checkIt() {
	if(!document.userinput.passwd.value) {
		alert("???й?ȣ?? ???? ?ʽ??ϴ?.");
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
	<font size="+1"><b>ȸ?? Ż??</b></font>
	</td>
</tr>
<tr height = "30">
	<td width="110" bgcolor="<%=value_c %>" align="center">???й?ȣ</td>
	<td width="150" align="center">
		<input type="password" name="passwd" size="15" maxlength="12">
	</td>
</tr>
<tr height="30">
	<td colspan="2" align="middle" bgcolor="<%=value_c %>">
		<input type="submit" value="ȸ?? Ż??" >
		<input type="button" value="????" onclick="javascript:window.location='main.jsp'">
	</td>
</tr>
</table>

</body>
</html>