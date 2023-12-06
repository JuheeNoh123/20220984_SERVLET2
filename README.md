# 20220984_SERVLET2
자바웹 수정


##### 3주차 연습문제
자바 소스코드 분리 : - ShopTime 클래스 생성

![3주차 문제](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/5bfafaf5-92fb-40a2-9ac4-7c222858cc51)

##### 9주차 연습문제
- 관리자 role manage로 변경, 비밀번호 123654로 변경하기
![9주차1](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/d09b89ca-8c4a-420c-a71e-e4ca8fb1843b)
![9주차2](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/9b3faffe-b175-4fc6-a521-a7502f51c169)

##### 10주차 연습문제
- footer의 날짜 클래스 연동
----
- 장바구니 상단 로그 이미지 깨지는 부분 수정
----
- 세션 전체삭제 -> 뒤로가기 한후 -> 특정상품 선택 삭제할 경우 에러 수정하기
에러 원인 : 뒤로가기를 하면 삭제 전 상품들 목록이 그대로 출력되는데, 여기서 다시 삭제를 눌렀을 경우,  cartList라는 세션 값이 초기화 되어 비어있는데 다시 해당 상품을 삭제하려해서 세션값을 찾지 못해 나는 NullPointerException 에러였다. 
해결 방법 : 따라서 세션값이 비었을 경우에는 해당 삭제 로직으로 들어가지 못하게 조건문을 추가하였다.
