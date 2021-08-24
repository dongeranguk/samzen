<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="madvirus.gallery.Theme" %>
<%@ page import="madvirus.gallery.ThemeManager" %>
<%@ page import="madvirus.gallery.ThemeManagerException" %>
<%
	String themeId = request.getParameter("id");
	ThemeManager manager = ThemeManager.getInstance();
	Theme theme = manager.select(Integer.parseInt(themeId));
%>
<script>
function goReply() {
	document.move.action = "writeForm.jsp";
	document.move.submit();
}
function goModify() {
	document.move.action = "updateForm.jsp";
	document.move.submit();
}
function goDelete() {
	document.move.action = "deleteForm.jsp";
	document.move.submit();
}
function goList() {
	document.move.action="list.jsp";
	document.move.submit();
}
function viewLarge(imgURl) {
	var img = new Image();
	var scWidth = screen.availWidth;
	var scHeight = screen.avilHeight;
	var left = (parseInt(scWidth)-650)/2;
	var top = (parseInt(scHeight)-900)/2;
	img.src = imgURl;
	var img_width = img.width;
	var win_width = img.width+50;
	var height = img.height+100;
    var openImage = window.open('','_blank','width=auto'+',height=auto'+',top='+top+',left='+left+',menubars=no,scrollbars=auto');
    openImage.document.write("<style>body{magin:0px;}</style><a href='#' onclick=window.close() onfocus=this.blur()><img src='"+imgURl+"'width='"+win_width+"'></a>");
}
</script>
<c:set var="theme" value="<%=theme %>" />
<c:if test="${empty theme}">
존재하지 않는 테마 이미지입니다.
</c:if>
<c:if test="${!empty theme}">
<table width="100%" border="1" cellpadding="1" cellspacing="0">
<tr>
	<td>제목</td>
	<td>${theme.title}</td>
</tr>
<tr>
	<td>작성자</td>
	<td>
	${theme.name}
	<c:if test="${empty theme.email}">
	<a href="mailto:${theme.email}">[이메일]</a>
	</c:if>
	</td>
</tr>
<c:if test="${!empty theme.image}">
<tr>
	<td colspan="2" align="center">
	<img src="../image/${theme.image}" width="150" border="0" onclick = "javascript:viewLarge(this.src)" />
	<br>[크게보기]
	</td>
</tr>
</c:if>
<tr>
	<td>내용</td>
	<td><pre>${theme.content}</pre></td>
</tr>
<tr>
	<td colspan="2">
	<a href="javascript:goReply()">[답변]</a>
	<a href="javascript:goModify()">[수정]</a>
	<a href="javascript:goDelete()">[삭제]</a>
	<a href="javascript:goList()">[목록]</a>
	</td>
</tr>
</table>
</c:if>

<form name="move" method="post">
	<input type="hidden" name="id" value="${theme.id}">
	<input type="hidden" name="parentId" value="${theme.id}">
	<input type="hidden" name="groupId" value="${theme.groupId}">
	
	<input type="hidden" name="page" value="${param.page}">
	<c:forEach var="searchCond" items="${paramValues.search_cond}">
		<c:if test="${searchCond == 'title'}">
		<input type="hidden" name="search_cond" value="title">
		</c:if>
		<c:if test="${searchCond == 'name'}">
		<input type="hidden" name="search_cond" value="name">
		</c:if>
	</c:forEach>
	
	<c:if test="${!empty param.search_key}">
	<input type="hidden" name="search_key" value="${param.search_key}">
	</c:if>
</form>