<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%
	request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��û �Ķ���� ���</title>
</head>
<body>
<b>request.getParameter() �޼ҵ� ���</b><br>
name �ĸ����� = <%=request.getParameter("name") %> <br>
address �Ķ���� = <%=request.getParameter("address") %> <br>
<p>
<b>request.getParameterValues() �޼ҵ� ���</b><br>
<%
	String[] values = request.getParameterValues("pet");
	if(values != null) {
		for(int i=0; i<values.length; i++) {
%>
	<%= values[i] %>
<%
		}
	}
	
%>
<p>
<b>request.getParameterName() �޼ҵ� ���</b><br>
<%
	Enumeration paramEnum = request.getParameterNames();
	while(paramEnum.hasMoreElements()) {
		String name = (String)paramEnum.nextElement();
%>
	<%= name %>
<%
	}
%>
<p>
<b>request.getParameterMap() �޼ҵ� ���</b><br>
<%
	Map parameterMap = request.getParameterMap();
	String[] nameParam = (String[])parameterMap.get("name");
	if(nameParam != null) {
%>	
	name = <%=nameParam[0] %>
<%	
	}
%>
</body>
</html>