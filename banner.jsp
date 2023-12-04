<%@ page contentType = "text/html; charset=utf-8" %>
<style>
    /* 이미지 스타일을 조정하는 CSS 코드 */
    .banner-image {
        width: 100%; /* 부모 요소의 100% 너비를 사용 */
        height: 100px; /* 원하는 높이로 설정 (자르고 싶은 비율에 맞게 조절) */
        object-fit: cover; /* 이미지를 부모 요소에 맞게 확대/축소하지 않음 */
            
    }
</style>
<div class="text-center">
    <img src="../image/top_banner.jpg" class="img-fluid, banner-image" alt="banner_image">
</div>