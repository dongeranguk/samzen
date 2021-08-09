<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page errorPage = "../error/error_view.jsp" %>

<%@ page import="madvirus.util.ImageUtil" %>
<%@ page import="madvirus.fileupload.FileUploadRequestWrapper" %>

<%@ page import="madvirus.gallery.Theme" %>
<%@ page import="madvirus.gallery.ThemeManager" %>
<%@ page import="madvirus.gallery.ThemeManagerException" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	FileUploadRequestWrapper requestWrap = new FileUploadRequestWrapper(
			request, -1, -1,
			"C:\\Java\\APP\\EZEM\\WebContent\\temp");
%>
