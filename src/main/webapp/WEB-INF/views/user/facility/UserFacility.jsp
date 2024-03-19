<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" rel="stylesheet" href="/resources/css/user/facility.css">
    <title>여기오개</title>
</head>

<body>
    <%@ include file="../header.jsp" %>
<!--     <h1 class="heading">Facility</h1> -->
<!--     <h3 class="heading2">여행을 행복하게 만들기 위해, 여기오개 시설은 최고 수준의 안전성을 제공합니다.</h3> -->
<!--     <br> -->
    <div class="image-container">
        <div class="slider-container">
            <div class="slider">
                <c:forEach var="image" items="${getFacImgList}" varStatus="loop">
                    <div class="slide">
                        <div class="image-item">
                            <img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/${image.img_path}">
                        </div>
                    </div>
                    <%-- 3번째 이미지까지만 슬라이드에 나타나도록 --%>
                 <c:set var="breakLoop" value="true" />
					<c:if test="${loop.index + 1 eq 3}">
					    <c:set var="breakLoop" value="true" />
					</c:if>

                </c:forEach>
                <%-- 나머지 이미지를 처리하는 Java 코드 작성 --%>
            </div>
        </div>
    </div>
    <button id="previewButton">▶VIEW INFO</button>
    <div class="preview-container" id="previewContainer">
        <div class="preview-content">
            <button type="button" class="btn__close">닫기</button>
            <div class="content" style="white-space: pre-line;">
                <h2>${Facility.facility_name}</h2>
                ${Facility.facility_info}
            </div>
        </div>
    </div>
    <br><br><br>

   <div class="image-gallery">
    <c:forEach var="image" items="${getFacImgList}" varStatus="loop">
        <%-- 4번째 이미지부터 갤러리에 나타나도록 --%>
        <c:if test="${loop.index + 1 gt 3}">
            <div class="gallery-item">
                <a class="gallery-link" data-idx="${Facility.facility_idx}" data-image="${image.img_path}" data-name="원하는 이미지 이름" href="javascript:void(0);">
                    <img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/${image.img_path}" alt="원하는 이미지 이름">
                   <div class="image-caption">확대하기</div>
                   
                </a>
            </div>
        </c:if>
    </c:forEach>
</div>

<script>
// 이미지 이름 표시 이벤트 핸들러
document.addEventListener('DOMContentLoaded', function () {
    var galleryLinks = document.querySelectorAll('.gallery-link');

    galleryLinks.forEach(function (link) {
        link.addEventListener('mouseover', function () {
            showImageName(link);
        });

        link.addEventListener('mouseout', function () {
            hideImageName(link);
        });
    });
});

function showImageName(link) {
    var caption = link.querySelector('.image-caption');
    if (caption) {
        caption.style.opacity = '1';
    }
}

function hideImageName(link) {
    var caption = link.querySelector('.image-caption');
    if (caption) {
        caption.style.opacity = '0';
    }
}
//이미지 클릭 이벤트 핸들러
document.addEventListener('DOMContentLoaded', function () {
    var galleryLinks = document.querySelectorAll('.gallery-link');

    galleryLinks.forEach(function (link) {
        link.addEventListener('click', function () {
            zoomInImage(link);
        });
    });
});

// 이미지 확대 함수
function zoomInImage(link) {
    // 클릭한 이미지 정보를 가져오기
    var imageUrl = link.getAttribute('data-image');

    // 새로운 이미지 엘리먼트 생성
    var zoomedImage = document.createElement('img');
    zoomedImage.src = "https://ogae-dog.s3.ap-northeast-2.amazonaws.com/"+imageUrl;
    zoomedImage.alt = 'Zoomed In Image';

    // 스타일 적용
    zoomedImage.style.position = 'fixed';
    zoomedImage.style.top = '0';
    zoomedImage.style.left = '0';
    zoomedImage.style.width = '100%';
    zoomedImage.style.height = '100%';
    zoomedImage.style.objectFit = 'contain';
    zoomedImage.style.background = 'rgba(0, 0, 0, 0.8)';
    zoomedImage.style.zIndex = '1000';

    // 바디에 추가
    document.body.appendChild(zoomedImage);

    // 이미지를 클릭하면 닫히도록 이벤트 리스너 추가
    zoomedImage.addEventListener('click', function () {
        document.body.removeChild(zoomedImage);
    });
}


    </script>



    <script src="/resources/js/script3.js"></script>
    <script src="/resources/js/script4.js"></script>
    <br><br>
    <%@ include file="../footer.jsp" %>
</body>

</html>
