<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- owl carousel -->
<link type="text/css" rel="stylesheet" href="/resources/include/css/owl/owl.carousel.min.css">
<link type="text/css" rel="stylesheet" href="/resources/include/css/owl/owl.them.default.min.css">
<script type="text/javascript" src="/resources/include/jscript/owl/owl.carousel.min.js"></script>
</head>
 <style>  // 캐러셀의 크기 지정        
    .owl-carousel {
        width: 400px;
        height: 300px;
        margin: 0 auto;
    }
</style>
<body>
<div class="firstSlider" id="firstSlider">
	<div class="main-slides owl-carousel owl-loaded owl-drag">
	    <div class="item"><img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/upload/main/slides/01.jpg" alt="Image 1"></div>
	    <div class="item"><img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/upload/main/slides/02.jpg" alt="Image 1"></div>
	    <div class="item"><img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/upload/main/slides/03.jpg" alt="Image 1"></div>
	    <div class="item"><img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/upload/main/slides/04.jpg" alt="Image 1"></div>
	    <div class="item"><img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/upload/main/slides/05.jpg" alt="Image 1"></div>
	    <div class="item"><img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/upload/main/slides/06.jpg" alt="Image 1"></div>
	    <div class="item"><img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/upload/main/slides/07.jpg" alt="Image 1"></div>
	    <div class="item"><img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/upload/main/slides/08.jpg" alt="Image 1"></div>
	    <div class="item"><img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/upload/main/slides/10.jpg" alt="Image 1"></div>
	    <div class="item"><img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/upload/main/slides/11.jpg" alt="Image 1"></div>
	    <div class="item"><img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/upload/main/slides/12.jpg" alt="Image 1"></div>
	</div>
</div>
<script>
    $(document).ready(function(){
      var owl = $('.owl-carousel');
      owl.owlCarousel({
        items: 1, // 한번에 보여지는 이미지 수
        loop: true, // 항목들을 무한으로 반복하여 보여줄지 여부
        autoplay: true, // 자동으로 슬라이드 쇼를 시작할지 여부
        autoplayTimeout: 3000, // 다음 이미지로 넘어가는 시간 (단위 : 밀리초)
        autoplayHoverPause: true, // 마우스가 이미지에 위에 있을 때 자동 슬라이드를 일시중지 할지 여부
      });           
    });
</script>     
</body>
</html>