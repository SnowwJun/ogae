<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resources/css/user/facility.css">
<title>Insert title here</title>
<style>
.slider-container {
    width: 60%;
    overflow: hidden;
    margin: 0 auto; /* 가운데 정렬을 위한 마진 설정 */
    display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
}
</style>
</head>
<body>
<div class="room_title">
	<h3 class="TRAN">FACILITIES</h3>
	<p class="txt TRAN">여기오개의 반려견과 함께 즐길 수 있는 다양한 부대시설</p>
	<a class="btn_rooms" href="UserFacility.do?facility_idx=5">VIEW MORE
		<i class="fa-solid fa-chevron-right fa-sm"></i>
	</a>
</div> 
 <div class="slider-container">
	<div class="slider">
	    <div class="slide"><img src="/resources/images/facility/강아지 실내 놀이터.jpg" alt="이미지 1"></div>
	    <div class="slide"><img src="/resources/images/facility/애견카페1.jpg" alt="이미지 2"></div>
	    <div class="slide"><img src="/resources/images/facility/강아지 수영장.jpg" alt="이미지 3"></div>
	    <div class="slide"><img src="/resources/images/facility/야외카페테라스1.jpg" alt="이미지 4"></div>
	    <div class="slide"><img src="/resources/images/facility/애견셀프목욕.jpg" alt="이미지 5"></div>
	    <div class="slide"><img src="/resources/images/facility/애견운동장1.jpg" alt="이미지 6"></div>
	    <div class="slide"><img src="/resources/images/facility/애견파티룸1.jpg" alt="이미지 7"></div>
	    <div class="slide"><img src="/resources/images/facility/울타리&잔디정원1.jpg" alt="이미지 8"></div>
	</div>
</div>
    <script src="/resources/js/script3.js"></script>
     <script src="/resources/js/script4.js"></script>
</body>
</html>