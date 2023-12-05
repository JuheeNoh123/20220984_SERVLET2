<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%//@ page import="dao.ProductRepository"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp"%>

<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("../index.jsp");
		return;
	}

	//ProductRepository dao = ProductRepository.getInstance();

	/*Product product = dao.getProductById(id);
	if (product == null) {
		response.sendRedirect("../exception/product_not_found.jsp");
	}
    
    // 상품을 전부 가져와서 하나씩 비교
	ArrayList<Product> goodsList = dao.getAllProducts();
	Product goods = new Product();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getProductId().equals(id)) { 			
			break;
		}
	}*/

    //데이터 베이스에서 해당 상품 정보 가져오기
    String sql = "SELECT * FROM product WHERE p_id = ?";
    try {
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
            Product product = new Product();
            product.setProductId(rs.getString("p_id"));
            product.setPname(rs.getString("p_name"));
            product.setUnitPrice(rs.getInt("p_unitPrice"));
            // 나머지 필드도 필요에 따라 추가
            
            //상품 정보 가져오기
            ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");    //세션 객체에 저장된 속성(cartlist)을 반환 // 세션에 장바구니 리스트 생성
            //세션에 cartlist가 없으면 새로운 arraylist를 생성하고 세션에 저장	
            if (cartList == null) { 
                cartList = new ArrayList<Product>();
                session.setAttribute("cartlist", cartList); // 세션 키, 값 설정
            }
            
            //장바구니에 추가된 상품이 있는지 확인
            boolean isProductInCart = false;
            for (Product p : cartList) {
                if (p.getProductId().equals(id)) {
                    // 이미 장바구니에 있는 상품이라면 수량만 증가시키고 종료
                    p.setQuantity(p.getQuantity() + 1);
                    isProductInCart = true;
                    break;
                }
            }

            /*int cnt = 0;
            Product goodsQnt = new Product();
            for (int i = 0; i < list.size(); i++) {
                goodsQnt = list.get(i);
                if (goodsQnt.getProductId().equals(id)) {
                    cnt++;
                    int orderQuantity = goodsQnt.getQuantity() + 1;
                    goodsQnt.setQuantity(orderQuantity);
                }
            }*/
            
            // 장바구니에 없는 상품이라면 새로 추가
            if (!isProductInCart) {
                product.setQuantity(1);
                cartList.add(product);
            }

            /*if (cnt == 0) { 
                goods.setQuantity(1);
                list.add(goods);
            }*/

	        response.sendRedirect("product_cart.jsp?id=" + id); // 상품이 추가된 후에는 장바구니 화면 페이지로 이동
        }
        else {
            // 데이터베이스에서 해당 상품이 없을 경우 처리
            response.sendRedirect("../exception/product_not_found.jsp");
        }
    }
    catch (SQLException e) {
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