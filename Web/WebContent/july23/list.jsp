<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="july23.model.Message" %>
<%@ page import="july23.model.MessageListView" %>
<%@ page import="july23.service.GetMessageListService" %>
<%
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if(pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	
	GetMessageListService messageListService = 
		GetMessageListService.getInstance();
		
	MessageListView viewData =
		messageListService.getMessageList(pageNumber);
%>

<html>
<head>
<title>방명록 메세지 목록</title>
</head>
<body>

<form action="writeMessage.jsp" method="post">
이름 : <input type="text" name="guestName" /><br />
암호 : <input type="password" name="password" /><br />
방명록 : <textarea name="message" cols="30" rows="3"></textarea> <br />
<input type="submit" value="방명록 남기기" />
</form>
<hr>

<% if(viewData.isEmpty()) { %>
등록된 방명록이 없습니다.
<% } else { %> <!-- 방명록이 있는 경우 처리 시작 -->
<table border="1">
<%
	for(Message message : viewData.getMessageList()) {
%>
	<tr>
		<td>
		방명록 번호 :<%= message.getId() %><br/> <!-- 시퀀스 지웠다가 다시 생성하니 번호가 순서대로 나옴 -->
		손님 이름 : <%= message.getGuestName() %><br/>
		메세지 : <%= message.getMessage() %><br/> <%-- 표현식 누락 "="  --> "%=" 로 고침 --%>
		<a href="confirmDeletion.jsp?messageId=<%=message.getId() %>">
		[삭제하기]</a>
		</td>
	</tr>
<% } %>
</table>

<% for(int i = 1; i <= viewData.getPageTotalCount(); i++) { %>
<a href="list.jsp?page=<%=i %>">[<%= i %>]</a>
<% } %>

<% } %> <!-- 방명록이 있는 경우 처리 끝 -->
</body>
</html>