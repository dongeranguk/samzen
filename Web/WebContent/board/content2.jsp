<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="board.BoardDBBean" %>
<%@ page import="board.BoardDataBean" %>
<%@ page import="board.CommentDBBean" %>
<%@ page import="board.CommentDataBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="color.jsp" %>
<html>
<head>
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
function writeSave() {
	if(document.comment.commentt.value=="") {
		alert("����� �Է����ּ���.");
		document.comment.commentt.value.focus();
		return false;
	}
}
</script>
</head>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	int pageSize = 10;
	String cPageNum = request.getParameter("cPageNum"); 
	if(cPageNum == ""|| cPageNum == null) {
		cPageNum = "1";
	}
	int cCurrentPage = Integer.parseInt(cPageNum); //�̹� String ��ü cPageNum�� request.getParameter("cPageNum")�� �ְ� String ��ü cPageNum�� �ƴ� request.getParameter("cPageNum")�� �־ ���� �߻�
	int startRow = (cCurrentPage * 10) - 9;
	int endRow = cCurrentPage * pageSize;
	SimpleDateFormat sdf =
			new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	try {
		BoardDBBean dbPro = BoardDBBean.getInstance();
		BoardDataBean article = dbPro.getArticle(num);
		CommentDBBean cdb = CommentDBBean.getInstance();
		ArrayList comments = cdb.getComments(article.getNum(),startRow, endRow);
		int count = cdb.getCommentCount(article.getNum());
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
%>
<body bgcolor="<%=bodyback_c %>" align="center">
<b>�� ���� ����</b>
<br>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0"
	bgcolor="<%=bodyback_c %>" align="center">
<tr height="30">
	<td align="center" width="125" bgcolor="<%=value_c %>">�۹�ȣ</td>
	<td align="center" width="125" align="center">
	<%=article.getNum() %> </td>
	<td align="center" width="125" bgcolor="<%=value_c %>">��ȸ��</td>
	<td align="center" width="125" align="center">
	<%=article.getReadcount() %></td>
</tr>
<tr height="30">
	<td align="center" width="125" bgcolor="<%=value_c %>">�ۼ���</td>
	<td align="center" width="125" align="center">
	<%=article.getWriter() %></td>
	<td align="center" width="125" bgcolor="<%=value_c %>">�ۼ���</td>
	<td align="center" width="125" align="center">
	<%= sdf.format(article.getReg_date()) %> </td>
</tr>
<tr height="30">
	<td align="center" width="125" bgcolor="<%=value_c %>">������</td>
	<td align="center" width="125" align="center" colspan="3">
	<%=article.getSubject() %></td>
</tr>
<tr>
	<td align="center" width="125" bgcolor="<%=value_c %>">�۳���</td>
	<td align="center" width="375" colspan="3"><pre><%=article.getContent() %></pre></td>
</tr>
<tr height="30">
	<td colspan="4" bgcolor="<%=value_c %>" align="right">
	<input type="button" value="�� ����"
	onClick="document.location.href='updateForm.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum %>'">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="�� ����"
	onClick="document.location.href='deleteForm.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum %>'">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="��� ����"
	onClick="document.location.href='writeform.jsp?num=<%=num %>&ref=<%=ref %>&re_step=<%=re_step %>&re_level=<%=re_level %>'">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="�ڷΰ���"
	onClick="document.location.href='list2.jsp?pageNum=<%=pageNum %>'">
	</td>
</tr>
</form>
<form method="post" action="contentPro.jsp" name="comment" onSubmit="return writeSave()">
<tr bgcolor="<%=value_c %>" align="center">
	<td>�ڸ�Ʈ �ۼ�</td>
	<td colspan="2">
		<textarea name="commentt" rows="6" cols="40"></textarea> <!-- ��Ÿ commnett -> commentt -->
		<input type="hidden" name="content_num" value="<%=article.getNum() %>">
		<input type="hidden" name="p_num" value="<%=pageNum %>">
		<input type="hidden" name="comment_num" value="<%=count+1 %>">
	</td>
	<td align="center">
		�ۼ���<br>
		<input type="text" name="commenter" size="10"><br>
		��й�ȣ<br>
		<input type="password" name="passwd" size="10"><p>
		<input type="submit" value="��� �ޱ�">
	</td>
</tr>
</form>
</table>
<%if(count > 0) { %>
<p>
<table width="500" border="0" cellspacing="0" cellpadding="0" bgcolor="<%=bodyback_c %>" align="center">
	<tr>
		<td>�ڸ�Ʈ ��:<%=comments.size() %></td>
	</tr>
	<% for(int i=0; i<comments.size(); i++) { 
			CommentDataBean dbc = (CommentDataBean)comments.get(i);
	%>
	<tr>
		<td align="left" size="250" bgcolor="<%=value_c %>">
		&nbsp;<b><%=dbc.getCommenter() %>&nbsp;��</b> (<%=sdf.format(dbc.getReg_date()) %>)
		</td>
		<td align="right" size="250" bgcolor="<%=value_c %>">���� IP:<%=dbc.getIp() %>
		&nbsp;<a href="delCommentForm.jsp?ctn=<%=dbc.getContent_num() %>&cmn=<%=dbc.getComment_num() %>&p_num=<%=pageNum %>">[����]</a>&nbsp; 
		<!-- //������ �ȵǼ� ���ϱ� delCommentForm?jsp���� delCommentForm.jsp�� ���� -->
		</td>
	</tr>
	<tr>
		<td colspan="2"><%=dbc.getCommentt() %></td>
	<% } %>
	</tr>
</table>
<table width="500" border="0" cellspacing="0" cellpadding="0" bgcolor="<%=bodyback_c %>" align="center">
<tr>
<%
	if(count > 0) {
		//��ü ������ ���� ����
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		
		int startPage = (int)(cCurrentPage/5)*5+1; //11
		int pageBlock = 5;
		int endPage = startPage + pageBlock-1; // 11+5-1 = 15
		if(endPage > pageCount)endPage = pageCount;
		
		if(startPage > 5) { %>
		<a href="content2.jsp?num=<%=num %>&pageNum=<%=pageNum %>&cPageNum=<%=startPage-5 %>">[����]</a>
<%		}
		for(int i=startPage; i<=endPage; i++) { %>
		<a href="content2.jsp?num=<%=num %>&pageNum=<%=pageNum %>&cPageNum=<%=i %>">[<%=i %>]</a>
<%		}
		if(endPage < pageCount) { %>
		<a href="content2.jsp?num=<%=num %>&pageNum=<%=pageNum %>&cPageNum=<%=startPage + 5 %>">[����]</a>
<%
		}
	}
%>
</tr>
</table>
<% } %>
<%
	}catch(Exception e) {}
%>
</body>
</html>