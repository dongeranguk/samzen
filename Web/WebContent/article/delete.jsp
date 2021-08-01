<%@ page contentType="text/html; charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import="july28.board.service.DeleteArticleService" %>
<jsp:useBean id="deleteRequest"
	class="july28.board.model.DeleteRequest" />
<jsp:setProperty name="deleteRequest" property="*" />
<!-- jsp:useBean액션태그는 jsp페이지에서 사용할 자바빈 객체를 지정해주는 기능
	 id속성은 jsp페이지에서 자바빈 객체에 접근할 때 사용할 이름을 명시한다.
	 class속성은 패키지 이름을 포함한 자바빈 클래스의 완전한 이름을 입력한다.
	 scope속성은 자바빈 객체가 저장될 영역을 지정한다.(page,request,session,application)

jsp:setProperty액션태그의 name속성은 프로퍼티의 값을 변경할 자바빈 객체의 이름, <jsp:useBean>액션 태그의 id속성에서 지정한 값을 사용-->
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
