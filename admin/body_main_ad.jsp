<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%> <!-- 패키지 연동 -->
<%@ page import="dao.ProductRepository"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp"%>


<%-- CLASS는 스타일 적용시에 사용 되는 이름, 중첩 가능 --%>   
<%! String greeting = "Welcome"; 
String tagline = "실시간 랭킹"; %>

    <div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>	

        
<%	
    //ProductRepository dao = ProductRepository.getInstance();
    //ArrayList<Product> listOfProducts = dao.getAllProducts();  // 리스트에 상품 전체 정보를 얻어온다.
%> 	


	<div class="container">
		<div class="row" align="center">
			<%
				//for (int i = 0; i < listOfProducts.size(); i++) {
				//	Product product = listOfProducts.get(i);
            
                String sql = "select * from product"; // 조회
                pstmt = conn.prepareStatement(sql); // 연결 생성
                rs = pstmt.executeQuery(); // 쿼리 실행
                while (rs.next()) { // 결과 ResultSet 객체 반복
			%>
			<div class="col-md-4">
                <div class="card bg-dark text-white">
                    <img src="../image/product/<%=rs.getString("p_fileName")%>" class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <h5 class="card-title">무신사</h5>
                        <p class="card-text">출처 : 구글 검색</p>
                    </div>
                </div>
                
				<h3><%=rs.getString("p_name")%></h3>
                <p><%=rs.getString("p_description")%>
                <p><%=rs.getString("p_UnitPrice")%>원
                <p><a href="product_detail.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;></a>


			</div>
			<%
				} // 반복문 끝난 이후 db 연결 종료
                if (rs != null)
                    rs.close();
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
			%>
		</div>
		<hr>
	</div>


<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline%>
			</h3>
		</div>
		<hr>
</div>

<div class="card bg-dark text-black">
    <img src="../image/top.jpg" class="card-img" alt="...">
    <div class="card-img-overlay">
        <h5 class="card-title">주신사</h5>
        <p class="card-text">노주희</p>
    </div>
</div>

<div class="list-group">
     <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
        지포스 3060 시리즈
     </a>
     <a href="#" class="list-group-item list-group-item-action">지포스 3070 시리즈</a>
    <a href="#" class="list-group-item list-group-item-action">지포스 3080 시리즈</a>
    <a href="#" class="list-group-item list-group-item-action">지포스 3090 시리즈</a>
    <a href="#" class="list-group-item list-group-item-action">지포스 3100 시리즈</a>
      
</div>