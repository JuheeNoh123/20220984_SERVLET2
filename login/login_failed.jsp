login/login_failed.jsp
<%@ page contentType = "text/html;charset=utf-8" %>
<%
	response.sendRedirect("login.jsp?error=1");
%>