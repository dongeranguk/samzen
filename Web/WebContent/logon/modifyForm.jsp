<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="logon.member.*" %>
<%@ include file="color.jsp" %>

<html>
<head><title>ȸ������ ����</title></head>
<link href="style.css" rel="stylesheet" type="text/css">
<script langauge="javascript">
function checkIt() {
	var userinput = eval("document.userinput");
	
	if(!userinput.passwd.value) {
		alert("��й�ȣ�� �Է��ϼ���.");
		return false;
	}
	
	if(userinput.passwd.value != userinput.passwd2.value) {
		alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
		return false;
	}
	
	if(!userinput.username.value) {
		alert("����� �̸��� �Է��ϼ���.");
		return false;
	}
	
	if(!userinput.jumin1.value || !userinput.jumin2.value) {
		alert("�ֹε�Ϲ�ȣ�� �Է��ϼ���.");
		return false;	
	}
}

function zipCheck() {
	url = "Zipcheck.jsp?check=y";
	
	open(url, "post", "toolbar=no, width=500, height=300, directories=no, scrollbar=yes, menubar=no, status=yes");
}
</script>
<%
	String id = (String)session.getAttribute("memId");

	LogonDBBean manager = LogonDBBean.getInstance();
	LogonDataBean c = manager.getMember(id);
	
try {
%>

<body bgcolor="<%=bodyback_c %>">
<form method="post" action="modifyPro.jsp" name="userinput" onSubmit="return checkIt()">
<table width="600" border="1" cellpadding="3" cellspacing="0" align="center">
<tr>
	<td colspan="2" height="39" bgcolor="<%=title_c %>" align="center">
	<font size="+1"><b>ȸ�� ���� ����</b></font>
	</td>
</tr>
<tr>
	<td colspan="2" class="normal" align="center">ȸ���� ������ �����մϴ�.</td>
</tr>
<tr>
	<td width="200" bgcolor="<%=value_c %>"><b>���̵� �Է�</b></td>
	<td width="400" bgcolor="<%=value_c %>"></td>
</tr>
<tr>
	<td width="200">����� ID</td>
	<td width="400"><%=c.getId() %></td>
</tr>
<tr>
	<td width="200">��й�ȣ</td>
	<td width="400">
		<input type="pasword" name="passwd" size="10" maxlength="10" value="<%=c.getPasswd() %>">
	</td>
</tr>
<tr>
	<td width="200" bgcolor="<%=value_c %>"><b>�������� �Է�</b></td>
	<td width="400" bgcolor="<%=value_c %>"></td>
</tr>
<tr>
	<td width="200">����� �̸�</td>
	<td width="400">
		<input type="text" name="name" size="15" maxlength="20" value="<%=c.getName() %>">
	</td>
</tr>
<tr>
	<td width="200">�ֹε�Ϲ�ȣ</td>
	<td width="400">
	<%=c.getJumin1() %>-<%=c.getJumin2() %>
	</td>
</tr>
<tr>
	<td width="200">E-Mail</td>
	<td width="400">
	<%if(c.getEmail() == null) { %>
	<input type="text" name="email" size="40" maxlength="30">
	<%}else{ %>
	<input type="text" name="email" size="40" maxlength="30" value="<%=c.getEmail() %>">
	<%} %>
	</td>
</tr>
<tr>
	<td width="200">Blog</td>
	<td width="400">
	<%if(c.getBlog() == null) { %>
	<input type="text" name="blog" size="60" maxlength="50">
	<%}else{ %>
	<input type="text" name="blog" size="60" maxlength="50" value="<%=c.getBlog() %>">
	<%}%>
	</td>
</tr>
<tr>
	<td width="200">�����ȣ</td>
	<td><input type="text" name="zipcode" size="7">
	<input type="button" value="�����ȣ ã��" onClick="zipCheck()"></td>
</tr>
	<td width="200">�ּ�</td>
	<td width="400">
	<%if(c.getAddress() == null) { %>
	<input type="text" name="address" size="70">
	<%}else{ %>
	<input type="text" name="address" size="70" value="<%=c.getAddress() %>">
	<% } %>
	</td>
</tr>
<tr>
	<td colspan="2" align="center" bgcolor="<%=value_c %>">
	<input type="submit" name="modify" value="����">
	<input type="button" value="���" onclick="javascript:window.location='main.jsp'">
	</td>
</tr>
</table>
</form>
</body>
<%}catch(Exception e) {} %>
</html>