<%@ page contentType="text/html; charset=euc-kr" %>
<%@ include file="color.jsp" %>
<%
	String comment_num = request.getParameter("cmn");
	String content_num = request.getParameter("ctn");
	String p_num = request.getParameter("p_num");
	String url = "content2.jsp?num="+content_num+"&pageNum="+p_num; //������ �Ϸ��� 404�� ���� ���ϱ� content1.jsp���� content2.jsp�� ����
%>
<html>
<head>
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript">
	function deleteSave() {
		if(document.delForm.passwd.value=="") {
			alert("��й�ȣ�� �Է����ּ���.");
			document.delForm.passwd.focus();
			return false;
		}
	}
</script>
</head>
<body bgcolor="<%=bodyback_c %>" align="center">
<form method="post" name="delForm" action="delCommentPro.jsp" onSubmit="return deleteSave()">
	<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
		<tr height="30">
			<td align="center" bgcolor="<%=value_c %>">
			<b>��й�ȣ�� �Է����ּ���.</b>
			</td>
		</tr>
		<tr height="30">
			<td align="center">
			��й�ȣ:<input type="password" name="passwd" size="8" maxlength="12">
				   <input type="hidden" name="content_num" value="<%=content_num %>">
				   <input type="hidden" name="comment_num" value="<%=comment_num %>">
				   <input type="hidden" name="p_num" value="<%=p_num %>">
			</td>
		</tr>
		<tr height="30">
			<td align="center" bgcolor="<%=value_c %>">
			<input type="submit" value="�ڸ�Ʈ ����">
			<input type="button" value="���" onClick="document.location.href='<%=url %>'">
			</td>
		</tr>
	</table>
</body>
</html>