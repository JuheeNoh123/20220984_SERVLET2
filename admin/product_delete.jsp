<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp" %>
<%
	String productId = request.getParameter("id");
    String sql = "select * from product";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
    while (rs.next()) {
        String test = rs.getString("p_id");

        if(productId.equals(test)) {

            
            String sql1 = "delete from product where p_id = ?";
            pstmt = conn.prepareStatement(sql1);
            pstmt.setString(1, productId);
            
            pstmt.executeUpdate();
        }
    }
    response.sendRedirect("product_edit.jsp?edit=delete");
%>

