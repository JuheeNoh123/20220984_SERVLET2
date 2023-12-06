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

![10-1](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/3ad7cac2-b66a-466a-88ca-29b71a48ae22)

![10-2](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/cd9bd7a0-22a2-41f2-a07e-b7c6b76ddba8)

----
- 장바구니 상단 로그 이미지 깨지는 부분 수정

![10-3](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/826b0eb8-e039-485e-99ed-fd0e18c758d1)

![10-4](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/63c0464e-9db8-40f6-80d8-8941ab2b4be9)

----
- 세션 전체삭제 -> 뒤로가기 한후 -> 특정상품 선택 삭제할 경우 에러 수정하기

⚠️ 에러 원인 : 뒤로가기를 하면 삭제 전 상품들 목록이 그대로 출력되는데, 여기서 다시 삭제를 눌렀을 경우,  cartList라는 세션 값이 초기화 되어 비어있는데 다시 해당 상품을 삭제하려해서 세션값을 찾지 못해 나는 NullPointerException 에러였다. 

🔎 해결 방법 : 따라서 세션값이 비었을 경우에는 해당 삭제 로직으로 들어가지 못하게 조건문을 추가하였다.

![10-5](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/a7373b4e-2725-45fd-8ebe-2c94592585b9)


##### 11주차 연습문제
1. 배송일을 날짜를 선택하여 입력하도록 수정하자.

order_info.jsp에 js를 이용하여 현재 날짜를 저장하고, 입력한 날짜가 현재 날짜보다 이전일 경우 선택할 수 없도록 하는 checkDate()함수를 구현하여 oninput()을 이용하여 해당 함수를 호출하고 버튼을 막도록 하였다. 
![11-1](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/8d22b601-a81c-43de-bba1-258439a67b76)

![11-2](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/09f3de45-846d-4612-9753-f864380a0c31)

![11-3](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/2b28e586-e727-4459-bd07-8e4ad982e817)

----

2. 국가명을 select 박스로 수정하자.

![11-4](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/bcf4cff4-4126-481f-8db9-9c49374808bb)

![11-5](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/9956a80c-5e86-4976-bcd8-e015d4499038)

----

3. 우편 번호와 주소를 검색을 통해 입력되도록 수정

기존의 우편번호 폼은 주석처리 후, 주소 폼에 api를 추가해준다.

kakao api를 이용하여 우편번호 검색이 가능하도록 작성해준다.

name값을 우편번호와 주소 input에 넣어준다.

![11-6](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/bc0bf9f1-fc63-4e12-b4ff-17935d2456aa)

![11-7](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/50dae5d3-babf-40c1-bf56-c55c9f681877)

![11-8](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/d9bab9b2-ac84-4925-b905-e4596388ced3)

![11-9](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/f15563cf-44e3-4625-a644-779e0508df63)


##### 12주차 연습문제

1. 데이터 베이스 추가 작업 : 상품 추가
![12-1](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/b5917275-11f0-4ed9-9f4a-64a2401c4e29)

![12-2](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/1b08532e-8469-42c9-b21b-c8e593852e37)

----
2. 관리자 패스워드 변경하기
![12-3](https://github.com/JuheeNoh123/20220984_SERVLET2/assets/127907793/655ec247-8518-479e-b643-2fac4a5ae2eb)


----

#### 추가구현
⭐데이터베이스에 추가한 상품 -> 상품 상세정보 DB 연결하기

기존의 상품 상세 정보 버튼은 DB와 연동된 것이 아닌, dao, dto의 product를 불러와서 출력했다. 하지만 이제 DB가 생겼으니 DB에서 필요한 값들을 불러와 출력해보았다.

