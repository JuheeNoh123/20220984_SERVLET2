<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="example.*" %> 

<footer class="container">
<p> 
    <br> &copy; 쇼핑몰 대표 : 홍길동, 고유번호 : 20111234, 연락처: admin@nate.com <br>
    <% ShopTime time = new ShopTime(); %> 
    오늘 날짜와 시간 : <%=time.timenow() %>
</p>
</footer>