<%@ page contentType="text/html; charset=euc-kr" %>
<%@ include file="color.jsp" %>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>
<html>
<head>
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript">
	funciton deleteSave() {
		if(document.delForm.passwd.value=="") {
			alert("��й�ȣ�� �Է��ϼ���.");
			document.delForm.passwd.focus();
			return false;
		}
	}
</script>
</head>
<body bgcolor="<%=bodyback_c %>" align="center">
<b>�� ����</b>
<br>
<form method="post" name="delForm" action="deletePro.jsp?pageNum=<%=pageNum %>"
onSubmit="return deleteSave()">
<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
<tr height="30">
	<td align="center" bgcolor="<%=value_c %>">
	<b>��й�ȣ�� �Է��� �ּ���.</b>
	</td>
</tr>
<tr height="30">
	<td align="center">��й�ȣ :
	<input type="password" name="passwd" size="8" maxlength="12"> <!-- value="passwd"�� �Ǿ� �־ �����Ҷ� ���� passwd�� ������ ��й�ȣ�� �°� �Է��ص� ��й�ȣ�� �����ʴٰ� �� -->
	<input type="hidden" name="num" value="<%=num %>"></td>
</tr>
<tr height="30">
	<td align="center" bgcolor="<%= value_c %>">
	<input type="submit" value="�� ����">
	<input type="button" value="�� ���"
	onClick="document.location.href='list2.jsp?pageNum=<%=pageNum %>'">
	</td>
</tr>
</table>
</form>
</body>
</html>