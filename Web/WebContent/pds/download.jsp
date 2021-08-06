<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="pds.service.GetPdsItemService" %>
<%@ page import="pds.service.PdsItemNotFoundException" %>
<%@ page import="pds.service.IncreaseDownloadCountService" %>
<%@ page import="pds.model.PdsItem" %>
<%@ page import="pds.file.FileDownloadHelper" %>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	try {
		PdsItem item = GetPdsItemService.getInstance().getPdsItem(id);
		
		//응답 헤더 다운로드로 결정
		response.reset();
		
		String fileName = new String(item.getFileName().getBytes("euc-kr"),
				"iso-8859-1");
		response.setContentType("application/octet=stream");
		response.setHeader("Content-Disposition",
				"attachment; filename=\"" + fileName+"\"");
		response.setHeader("Content_Transfer-Encoding", "binary");
		response.setContentLength((int)item.getFileSize());
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");
		
		FileDownloadHelper.copy(item.getRealPath(),
			response.getOutputStream());
			
		response.getOutputStream().close();
		
		IncreaseDownloadCountService.getInstance().increaseCount(id);
	} catch(PdsItemNotFoundException ex) {
		response.setStatus(HttpServletResponse.SC_NOT_FOUND);
	}
%>
