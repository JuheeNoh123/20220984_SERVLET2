<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("../product_detail.jsp");
		return;
	}

	ProductRepository dao = ProductRepository.getInstance();
	
	Product product = dao.getProductById(id);
	if (product == null) {
		response.sendRedirect("../exception/product_not_found.jsp");
	}

    
	ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");    //세션에서 카트리스트 속성을 가져온다.
	Product goodsQnt = new Product();
    if(cartList != null){
        for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
            goodsQnt = cartList.get(i);
            if (goodsQnt.getProductId().equals(id)) {    //삭제할 상품을 찾아 삭제한다.
                cartList.remove(goodsQnt);    //장바구니에서 상품 삭제
            }
        }
	}

    
	
	response.sendRedirect("product_cart.jsp");
%>

	