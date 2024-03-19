<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <link type="text/css" rel="stylesheet" href="/resources/css/user/service.css">
    <title>여기오개</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<!--
 <h1 class="heading">Service</h1>
    <h3 class="heading2">여행을 행복하게 만들기 위해, 여기오개는 최상의 서비스만을 제공합니다.</h3>
    <br>  -->
<!--      <div class="image-container"> -->
    <div class="slider-container">
        <div class="slider">
            <div class="slide"><img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/upload/service/202312071951368001.jpg"  alt="이미지 1"></div>
        </div>
        </div>
 <button id="previewButton">▶VIEW INFO</button>
    <div class="preview-container" id="previewContainer">
        <div class="preview-content">
          <button type="button" class="btn__close">닫기</button>
            <div class="content">
            <h2>Dog Supplies</h2>
             <p>반려견을 위한 부대시설들이 샤워시설 안에 구비되어 있습니다.<br>
             반려견 침대, 방석, 식기, 배변판, 패드, 수건, 샴푸등이 비치되어 있습니다. </p>
<!--          <p class="text">국내산 참숯기준:<br>1~4인(3만원)<br>4~6인(3만5천원)<br>6인이상(4만원)<br>예약은 객실예약시 옵션을 선택하여 주시기 바랍니다. </p> -->
        </div>
        </div>
        </div>

    <br><br><br>
<div class="image-gallery">
        <div class="gallery-item">
            <div style="width: 150px; height: 100px; border: 2px solid white;" class="image-container gallery-link" data-image="202312071945666001.jpg">
                <img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/upload/service/202312071945666001.jpg" alt="BBQ">
                <span class="image-caption">확대하기</span>
            </div>
        </div>
        

<div class="gallery-item">
            <div style="width: 150px; height: 100px; border: 2px solid white;" class="image-container gallery-link" data-image="202312071953825001.jpg">
                <img  src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/upload/service/202312071953825001.jpg" alt="파티룸 대여">
                <span class="image-caption">확대하기</span>
            </div></div>
           
     <div class="gallery-item">
            <div style="width: 150px; height: 100px; border: 2px solid white;" class="image-container gallery-link" data-image="202312071951368001.jpg">
                <img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/upload/service/202312071951368001.jpg"  alt="반려견 용품">
                <span class="image-caption">확대하기</span>
            </div></div>
        
      
    <div class="gallery-item">
            <div style="width: 150px; height: 100px; border: 2px solid white;" class="image-container gallery-link" data-image="202312071957187001.jpg">
                <img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/upload/service/202312071957187001.jpg" alt="커피&티">
                <span class="image-caption">확대하기</span>
            </div></div>
        </div>
       
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

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

                link.addEventListener('click', function () {
                    zoomInImage(link);
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

        function zoomInImage(link) {
            // 클릭한 이미지 정보를 가져오기
            var imageUrl = link.getAttribute('data-image');

            // 새로운 이미지 엘리먼트 생성
            var zoomedImage = document.createElement('img');
            zoomedImage.src = "https://ogae-dog.s3.ap-northeast-2.amazonaws.com/upload/service/" + imageUrl;
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
