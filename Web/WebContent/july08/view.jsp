<%@ page contentType="text/html; charset=euc-kr" %>
<%
	String code = request.getParameter("code");
	String viewPageURI = null;
	
	if(code.equals("A")) {
		viewPageURI = "/july08/viewModule/a.jsp";
	} else if(code.equals("B")) {
		viewPageURI = "/july08/viewModule/b.jsp";
	} else if(code.equals("C")) {
		viewPageURI = "/july08/viewModule/c.jsp";
	}
%>
<jsp:forward page = "<%= viewPageURI %>" />