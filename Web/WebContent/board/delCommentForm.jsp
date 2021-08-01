<%@ page contentType="text/html; charset=euc-kr" %>
<%@ include file="color.jsp" %>
<%
	String comment_num = request.getParameter("cmn");
	String content_num = request.getParameter("ctn");
	String p_num = request.getParameter("p_num");
	String url = "content2.jsp?num="+content_num+"&pageNum="+p_num; //삭제를 하려니 404가 떠서 보니까 content1.jsp여서 content2.jsp로 수정
%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript">
	function deleteSave() {
		if(document.delForm.passwd.value=="") {
			alert("비밀번호를 입력해주세요.");
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
			<b>비밀번호를 입력해주세요.</b>
			</td>
		</tr>
		<tr height="30">
			<td align="center">
			비밀번호:<input type="password" name="passwd" size="8" maxlength="12">
				   <input type="hidden" name="content_num" value="<%=content_num %>">
				   <input type="hidden" name="comment_num" value="<%=comment_num %>">
				   <input type="hidden" name="p_num" value="<%=p_num %>">
			</td>
		</tr>
		<tr height="30">
			<td align="center" bgcolor="<%=value_c %>">
			<input type="submit" value="코멘트 삭제">
			<input type="button" value="취소" onClick="document.location.href='<%=url %>'">
			</td>
		</tr>
	</table>
</body>
</html>