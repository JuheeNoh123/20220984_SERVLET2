<%@ page contentType="text/html; charset=utf-8"%>
<%//@page import="dto.Product"%>
<%@ page import="java.util.Date"%>
<%@ page import="example.*" %>
<%@ page errorPage = "exception/product_not_found.jsp" %>
<%@ include file="../db/db_conn.jsp"%>
<!-- DB 연결-->
<%@ page import="java.sql.*"%>
<!--<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />-->

 <%            
        String productId = request.getParameter("id");
        String sql = "select * from product WHERE p_id = ?";; // 조회
        try {
        pstmt = conn.prepareStatement(sql);// 연결 생성
        pstmt.setString(1, productId);    //SQL 쿼리의 파라미터에 값을 설정 : 첫번째 파라미터(인덱스 1)에 productId 값을 설정
        rs = pstmt.executeQuery();// 쿼리 실행

        if (rs.next()) {
            //제품 세부정보 가져오기
            String productName = rs.getString("p_name");
            String productDescription = rs.getString("p_description");
            String productManufacturer = rs.getString("p_manufacturer");
            String productCategory = rs.getString("p_category");
            int productUnitsInStock = rs.getInt("p_unitsInStock");
	%>
	<%
		//String id = request.getParameter("id");    //request : 내장 객체; 앞페이지에서 속성값을 정해주면 다음 페이지에서 메서드로 id값 받을 수 있음, 여러개 인자도 받을 수 있음
		//Product product = productDAO.getProductById(id);    //앞서 구현한 getProductById에 상품코드 받앟서 product에 넣어줌
	%>

<html>
    <head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
    </script>

    <title>상품 상세 정보</title>
    </head>
    <body>
    <%@ include file="banner_ad.jsp" %>
	<%@ include file="top_menu_ad.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 상세 정보</h1>
		</div>
	</div>
    
   
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3><%= productName %></h3>
				<p><%= productDescription %>
				<p><b>상품 코드 : </b><span class="badge badge-danger"> <%=rs.getString("p_id")%></span>
				<p><b>제조사</b> : <%= productManufacturer %>
				<p><b>분류</b> : <%= productCategory %>
				<p><b>재고 수</b> : <%= productUnitsInStock %>
				<h4><%=rs.getString("p_unitPrice")%>원</h4>
                
                <p><form name="addForm" action="../cart/product_cart_add.jsp?id=<%=rs.getString("p_id")%>" method="post">
                        <a href="#" class="btn btn-info" onclick="addToCart()"> 상품 주문 &raquo;</a> 
                        <a href="./cart/product_cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>
                </form>
                
                <div class="card bg-dark text-white">
                    <img src="../image/product/<%=rs.getString("p_fileName")%>" class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <h5 class="card-title">상품 이미지 원본</h5>
                        <p class="card-text">출처 : 구글 검색</p>
                    </div>
                </div>
                
	            <!--<a href="#" class="btn btn-info"> 상품 주문 &raquo;</a>--> 
                <p><a href="index_ad.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
		    </div>
		</div>
		<hr>
	</div>
    <%@ include file="footer_ad.jsp" %>
</body>

</html>

<%
        } else {
            // 상품이 존재하지 않을 경우 처리
            response.sendRedirect("exception/product_not_found.jsp");
        }
    } catch (SQLException e) {
        // SQL 예외 처리
        e.printStackTrace();
    } finally {
        // 리소스 닫기
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>