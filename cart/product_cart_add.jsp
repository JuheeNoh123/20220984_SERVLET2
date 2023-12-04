<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("../index.jsp");
		return;
	}

	ProductRepository dao = ProductRepository.getInstance();

	Product product = dao.getProductById(id);
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
	}

    //상품 정보 가져오기
	ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");    //세션 객체에 저장된 속성(cartlist)을 반환 // 세션에 장바구니 리스트 생성
    //세션에 cartlist가 없으면 새로운 arraylist를 생성하고 세션에 저장	
    if (list == null) { 
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list); // 세션 키, 값 설정
	}

	int cnt = 0;
	Product goodsQnt = new Product();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getProductId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}

	if (cnt == 0) { 
		goods.setQuantity(1);
		list.add(goods);
	}

	response.sendRedirect("product_cart.jsp?id=" + id); // 상품이 추가된 후에는 장바구니 화면 페이지로 이동
%>