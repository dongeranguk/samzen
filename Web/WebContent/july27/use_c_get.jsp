<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="july27.Member" %>
<%@ page import="java.util.HashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- tablib --> taglib ���� ��Ÿ ����, uri�� ������ : jstl.jar������ lib���Ͽ� ��� --%>
<%-- ������ �ְ��� ���ΰ�ħ�� �� ����! --%>
<%
	Member member = new Member();
	HashMap<String, String> pref = new HashMap<String, String>();
%>
<html>
<body>
<c:set var="member" value="<%=member%>" /> <%-- ���� 500 �߻� : memberŬ���� name ���� ���� ���ؼ� name�� ���� �� ���� --%>
<c:set target="${member}" property="name" value="�ֹ���" />

<c:set var="pref" value= "<%=pref%>" />
<c:set var= "favoriteColor" value="#{pref.color}" /> 
<%--��Ÿ ���� target -> var, ${favoriteColor} --> favoriteColor �� ���� --%>

ȸ�� �̸� : ${member.name},
�����ϴ� �� : ${favoriteColor}

<br />
<c:set target="${pref}" property="color" value="red" />

���� ���� �����ϴ� �� : ${favoriteColor} 

</body>
</html>