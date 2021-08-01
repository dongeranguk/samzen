<%@ page contentType="text/html; charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import="july28.board.service.DeleteArticleService" %>
<jsp:useBean id="deleteRequest"
	class="july28.board.model.DeleteRequest" />
<jsp:setProperty name="deleteRequest" property="*" />
<!-- jsp:useBean�׼��±״� jsp���������� ����� �ڹٺ� ��ü�� �������ִ� ���
	 id�Ӽ��� jsp���������� �ڹٺ� ��ü�� ������ �� ����� �̸��� ����Ѵ�.
	 class�Ӽ��� ��Ű�� �̸��� ������ �ڹٺ� Ŭ������ ������ �̸��� �Է��Ѵ�.
	 scope�Ӽ��� �ڹٺ� ��ü�� ����� ������ �����Ѵ�.(page,request,session,application)

jsp:setProperty�׼��±��� name�Ӽ��� ������Ƽ�� ���� ������ �ڹٺ� ��ü�� �̸�, <jsp:useBean>�׼� �±��� id�Ӽ����� ������ ���� ���-->
<%
	String viewPage = null;
	try {
		DeleteArticleService.getInstance().deleteArticle(deleteRequest);
		viewPage = "delete_success.jsp";
	} catch(Exception ex) {
		request.setAttribute("deleteException", ex);
		viewPage="delete_error.jsp";
	}
%>
<jsp:forward page="<%=viewPage %>" />
