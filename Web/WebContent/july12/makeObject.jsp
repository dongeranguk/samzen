<%@ page contentType="text/html; charset=euc-kr" %>
<jsp:useBean id="member" scope="request"
	class="ez.member.MemberInfo" />
	
<%
	member.setId("madvirus");
	member.setName("�ֹ���");
%>
<jsp:forward page="useObject.jsp" />