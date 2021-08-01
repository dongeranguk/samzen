<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="board.BoardDBBean" %>
<%@ page import="board.BoardDataBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="color.jsp" %>

<%
	int pageSize = 10;
	SimpleDateFormat sdf =
		new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
	String pageNum = request.getParameter("pageNum");
	String search = request.getParameter("search");
	
	int searchn = 0;
	
	if(pageNum == null) {
		pageNum = "1";
	}
	
	if(search == null) {
		search ="";
	} else {
		searchn = Integer.parseInt(request.getParameter("searchn"));
	}
	
	int currentPage = Integer.parseInt(pageNum);
	System.out.println(currentPage);
	int startRow = (currentPage*10) - 9;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	
	List articleList = null;
	BoardDBBean dbPro = BoardDBBean.getInstance();
	
	if(search.equals("") || search == null)
		count = dbPro.getArticleCount();
	else 
		count = dbPro.getArticle(searchn, search);
	if(count > 0) {
		if(search.equals("") || search == null)
			articleList = dbPro.getArticle(startRow, endRow);
		else 
			articleList = dbPro.getArticle(startRow, endRow, searchn, search);
	}
	
	number = count-(currentPage-1) * pageSize;
%>
<html>
<head>
<title>게시판</title>
<link href = "style.css" rel = "stylesheet" type="text/css">
</head>
<body bgcolor="<%= bodyback_c %>" align="center">
<b>글 목록(전체 글: <%=count %>)</b>
<table width="700">
<tr>
	<td align="right" bgcolor="<%=value_c %>">
	<a href="writeform.jsp">글 쓰기</a>
	</td>
</table>

<%
	if(count == 0) {
%>
<table width="700" border="1" cellspacing="0" cellpadding="0">
<tr>
	<td align="center">
	게시판에 저장된 글이 없습니다.
	</td>
</tr>
</table>

<% } else { %>
<table border="1" width="700" cellspacing="0" cellpadding="0" align="center">
	<tr height="30" bgcolor="<%=value_c %>">
		<td align="center" width="50">번호</td>
		<td align="center" width="250">제목</td>
		<td align="center" width="100">작성자</td>
		<td align="center" width="150">작성일</td>
		<td align="center" width="50">조회</td>
		<td align="center" width="100">IP</td>
	</tr>
<%
	for(int i = 0; i<articleList.size(); i++) {
		BoardDataBean article = (BoardDataBean)articleList.get(i);
%>
	<tr height="30">
		<td align="center" width="50">
		<%= number-- %></td>
		<td align="left">
<%
	int wid = 0;
	if(article.getRe_level()>0) { //답변글이라면...
		wid = 5 * (article.getRe_level());
%>
	<img src = "images/level.gif" width="<%=wid %>" height="16">
	<img src = "images/re.gif">
<% }else{ %>
	<img src = "images/level.gif" width="<%=wid %>" height="16">
<% } %>
	<a href = "content.jsp?num=<%=article.getNum() %>&pageNum=<%=currentPage %>"><%= article.getSubject() %></a>
		<% if(article.getReadcount()>=20) {%>
		<img src="images/hot.gif" border="0" height="16"> <% } %> </td>
	<td align="center" width="100">
		<a href = "mailto:<%=article.getEmail() %>"><%= article.getWriter() %></a></td>
	<td align="center" width="150"><%=sdf.format(article.getReg_date()) %> </td>
	<td align="center" width="50"><%=article.getReadcount() %></td>
	<td align="center" width="100"><%=article.getIp() %></td>
<% } %>
</table>
<% } %>
<p>
<%
	if(count>0) {
		//전체 페이지의 수를 연산
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		
		int startPage = (int)(currentPage/5)*5+1;
		int pageBlock = 5;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;
		
		if(startPage>5) { 
			//이전 페이지
			if(search.equals("") || search == null) {
			%>
			<a href="list.jsp?pageNum=<%= startPage - 5 %>">[이전]</a>
			<%		
			} else {
			%>
			<a href="list.jsp?pageNum=<%=startPage-5 %>&search=<%=search %>&searchn=<%=searchn %>">[이전]</a>
			<%
			}
			%>
		<%
		}
		for(int i = startPage; i <= endPage; i++) {
			//해당 페이지로 이동
			if(search.equals("") || search == null) {
		%>
		<a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
		<%	
		} else {
		%>
		<a href="list.jsp?pageNum=<%=i %>&search=<%=search %>&searchn=<%=searchn %>">[<%=i %>]</a>
		<%
		}
		}
		%>
		<%
			if(endPage < pageCount) {
				// 다음 페이지
				if(search.equals("") || search == null) {
		%>
		<a href="list.jsp?pageNum=<%=startPage + 5 %>">[다음]</a>
		<% 
		} else {
		%>
		<a href="list.jsp?pageNum=<%=startPage+5 %>&search<%=search %>&searchn=<%=searchn %>">[다음]</a>
		<%
				}
		%>
		<%
			}
		} /* 괄호 찾기 */
		%>
</p>
<form>
<select name="searchn">
<option value="0">작성자</option>
<option value="1">제목</option>
<option value="2">내용</option>
</select>
<input type="text" name="search" size="15" maxlength="50" /> <input type="submit" value="검색" />

<br><br>

</form>
</body>
</html>