<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="july27.Member" %>
<%@ page import="java.util.HashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- tablib --> taglib 으로 오타 수정, uri에 빨간줄 : jstl.jar파일이 lib파일에 없어서 --%>
<%-- 파일을 넣고나서 새로고침을 꼭 하자! --%>
<%
	Member member = new Member();
	HashMap<String, String> pref = new HashMap<String, String>();
%>
<html>
<body>
<c:set var="member" value="<%=member%>" /> <%-- 오류 500 발생 : member클래스 name 변수 설정 안해서 name에 값을 못 넣음 --%>
<c:set target="${member}" property="name" value="최범균" />

<c:set var="pref" value= "<%=pref%>" />
<c:set var= "favoriteColor" value="#{pref.color}" /> 
<%--오타 수정 target -> var, ${favoriteColor} --> favoriteColor 로 수정 --%>

회원 이름 : ${member.name},
좋아하는 색 : ${favoriteColor}

<br />
<c:set target="${pref}" property="color" value="red" />

설정 이후 좋아하는 색 : ${favoriteColor} 

</body>
</html>