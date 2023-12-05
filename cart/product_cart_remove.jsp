<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%//@ page import="dao.ProductRepository"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp"%>
<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("../product_detail.jsp");
		return;
	}

	//ProductRepository dao = ProductRepository.getInstance();
	
	//Product product = dao.getProductById(id);
    
	/*if (product == null) {
		response.sendRedirect("../exception/product_not_found.jsp");
	}*/

    
	ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");    //세션에서 카트리스트 속성을 가져온다.
	Product goodsQnt = new Product();
    if(cartList != null){
        for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
            goodsQnt = cartList.get(i);
            if (goodsQnt.getProductId().equals(id)) {    //삭제할 상품을 찾아 삭제한다.
                cartList.remove(goodsQnt);    //장바구니에서 상품 삭제
            }
        }
        // Iterator를 사용하여 리스트를 순회하면서 삭제
        /*for (Iterator<Product> iterator = cartList.iterator(); iterator.hasNext();) {
            goodsQnt = iterator.next();
            if (goodsQnt.getProductId().equals(id)) {
                iterator.remove(); // Iterator를 사용하여 현재 상품을 안전하게 삭제
                break; // 원하는 상품을 찾았으면 루프 종료
            }
        }*/
	}

    
	
	response.sendRedirect("product_cart.jsp");
%>

	