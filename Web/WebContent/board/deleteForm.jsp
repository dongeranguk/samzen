<%@ page contentType="text/html; charset=euc-kr" %>
<%@ include file="color.jsp" %>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript">
	funciton deleteSave() {
		if(document.delForm.passwd.value=="") {
			alert("비밀번호를 입력하세요.");
			document.delForm.passwd.focus();
			return false;
		}
	}
</script>
</head>
<body bgcolor="<%=bodyback_c %>" align="center">
<b>글 삭제</b>
<br>
<form method="post" name="delForm" action="deletePro.jsp?pageNum=<%=pageNum %>"
onSubmit="return deleteSave()">
<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
<tr height="30">
	<td align="center" bgcolor="<%=value_c %>">
	<b>비밀번호를 입력해 주세요.</b>
	</td>
</tr>
<tr height="30">
	<td align="center">비밀번호 :
	<input type="password" name="passwd" size="8" maxlength="12"> <!-- value="passwd"로 되어 있어서 삭제할때 폼에 passwd가 나오고 비밀번호를 맞게 입력해도 비밀번호가 맞지않다고 뜸 -->
	<input type="hidden" name="num" value="<%=num %>"></td>
</tr>
<tr height="30">
	<td align="center" bgcolor="<%= value_c %>">
	<input type="submit" value="글 삭제">
	<input type="button" value="글 목록"
	onClick="document.location.href='list2.jsp?pageNum=<%=pageNum %>'">
	</td>
</tr>
</table>
</form>
</body>
</html>