<%@ page contentType="text/html; charset=euc-kr" %>
<%@ include file="color.jsp" %>
<%@ page import="logon.member.*" %>

<html><head>아이디 찾기
<link href="style.css" rel="stylesheet" type="html/css">
<script language="javascript">

<%
	String email = request.getParameter("email");
	LogonDBBean manager = LogonDBBean.getInstance();
	int check = manager.findId(email);
%>
function begin() {
	document.userinput.email.focus();
}

</script>
</head>
<body onload="begin()" bgcolor="<%=bodyback_c%>">
<form name="userinput" method="post">
<table width="260" cellpadding="5" cellspacing="0" border="1" align="center">
<tr height="30">
	<td>이메일 주소
	<input type="text" name="email" size="40" maxlength="30">
	</td>
</tr>
</table>
<%
	if(check == 1) {
%>
<table width="270" border="0" cellspacing="0" cellpadding="5">
<tr bgcolor="<%=title_c %>">
	<td height="39">찾는 아이디는 <%= email %> 입니다.
	</td>
</tr>
</table>
</form>
<%
	}
%> 
</body>
</html>