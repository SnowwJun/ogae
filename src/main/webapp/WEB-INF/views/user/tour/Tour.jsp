<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link type="text/css" rel="stylesheet" href="/resources/css/user/tour.css">
 <style>
        .label {margin-bottom: 36px;}
        .label * {display: inline-block;vertical-align: top;}
        .label .left {background: url("https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;display: inline-block;height: 24px;overflow: hidden;vertical-align: top;width: 7px;}
        .label .center {background: url("https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png") repeat-x;display: inline-block;height: 24px;font-size: 12px;line-height: 24px;}
        .label .right {background: url("https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;display: inline-block;height: 24px;overflow: hidden;width: 6px;}
    </style>
    <style>
* {
	list-style: none;
}

.hidden {
	display: none;
}
</style>
<title>여행지 추천</title>
<%@ include file="../header.jsp" %>
</head>
<body>

<!--      <div class="image-container"> -->
    <div class="slider-container">
        <div class="slider">
            <div class="slide"><img src="/resources/images/tour/자라섬.jpg" alt="이미지 1" width="100%"></div>
            <div class="slide"><img src="/resources/images/tour/자라섬2.jpg" alt="이미지 2" width="100%"></div>
            <div class="slide"><img src="/resources/images/tour/자라섬3.jpg" alt="이미지 3" width="100%"></div>
        </div>	
        </div>
      <button id="previewButton">▶VIEW INFO</button>
    <div class="preview-container" id="previewContainer">
        <div class="preview-content">
          <button type="button" class="btn__close">닫기</button>
            <div class="content" style="white-space: pre-line;">
            <h2>Jara Island</h2>
            <h4>자라섬</h4>
				<p class="distance">
					자동차로 15분				</p>
             <p>매년 가을이면 풍성하고 다양한 재즈페스티벌이 열려 유명해진 자라섬은 마치 생긴 모양이 자라의 모양을 하고 있으며 비가오면 물이 불어 섬이 약간 잠기었다가 나타난다하여 붙여진 이름이기도 합니다.
             또한 자라섬은 가평군에서 지명 위원회까지 열어 지었을 정도로 유래 깊은 이름입니다.
             약 4km에 이르는 수변 산책로와 해바라기, 코스모스, 맨드라미 등 갖가지 야생꽃과 체육시설, 자연수목휴양림 등이 있어 한두번쯤은 가보고 싶은 낭만의 섬중에 하나입니다.
             자라섬은 우리에게 인간의 때묻지 않은 순수함과 따뜻함을 전해주고 있으며 여행을 함에 있어 낭만과 사색의 공간을 줄 수 있을 만큼 여유롭고 자유분방한 섬이라 할 수 있습니다.​</p>
        </div></div></div>
        <br><br><br><br>


	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width: 50%; margin:0 auto; height: 350px;"></div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=faa4cacc59f9828efd641f079e0efaa5"></script>
<script>
var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
var mapOption = { 
    center: new kakao.maps.LatLng(37.777659, 127.510118), // 지도의 중심좌표
    level: 8 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

//마커 이미지의 이미지 크기 입니다
var imageSize = new kakao.maps.Size(24, 35); 

// 마커 이미지를 생성합니다    
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 


//중심 위치에 마커 생성
var centerMarker = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: mapOption.center, // 마커를 표시할 위치
    title : '여기오개',
    image : markerImage // 마커 이미지 
});

// 마커에 표시할 내용
// var content = '<div style="padding:5px;">여기는 중심 위치입니다.</div>';


// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var markerData = [
    <c:forEach var="tour" items="${tourList}" varStatus="status">
        {
            content: '<div>${tour.tour_title}</div>',
            latlng: new kakao.maps.LatLng(${tour.tour_mapy}, ${tour.tour_mapx}),
//             link: 'https://www.example.com/link${status.index + 1}'
        }<c:if test="${not status.last}">,</c:if>
    </c:forEach>
];

// 마커 표시
for (var i = 0; i < markerData.length; i++) {
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: markerData[i].latlng // 마커의 위치
    });

    var infowindow = new kakao.maps.InfoWindow({
        content: markerData[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));

    // 마커 클릭 이벤트
    kakao.maps.event.addListener(marker, 'click', makeClickListener(markerData[i].link));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

// 마커 클릭 이벤트를 처리하는 클로저를 만드는 함수입니다
function makeClickListener(link) {
    return function() {
        window.open(link, '_blank');
    };
}

        // 지도에 마커와 커스텀 오버레이를 표시합니다
        customOverlay.setMap(map);
        

    </script>

	
	<div class="image-gallery">
    <a href="Arboretum.do">
     <div style="width : 150px; height: 100px; border : 2px solid white;" class="image-container">
        <img src="/resources/images/tour/아침고요수목원3.jpg" alt="Image 1" >
        <span class="image-caption">아침고요수목원</span>
    </div></a>
    
    &ensp;
    <a href="Nami.do">
     <div style="width : 150px; height: 100px; border : 2px solid white;" class="image-container">
        <img src="/resources/images/tour/남이섬3.jpg" alt="Image 2">
        <span class="image-caption">남이섬</span>
    </div>
    </a> &ensp;
    <a href="Cheongpyeong.do">
     <div style="width : 150px; height: 100px; border : 2px solid white;" class="image-container">
        <img src="/resources/images/tour/청평호반수상레저2.jpg" alt="Image 3">
        <span class="image-caption">청평호반 수상레저</span>
    </div>
    </a> &ensp;
   <a href="PetitFrance.do">
     <div style="width : 150px; height: 100px; border : 2px solid white;" class="image-container">
        <img src="/resources/images/tour/쁘띠프랑스3.jpg" alt="Image 4">
        <span class="image-caption">쁘띠프랑스</span>
    </div>
    </a> &ensp;
    <a href="RailBike.do"> 
     <div style="width : 150px; height: 100px; border : 2px solid white;" class="image-container">
        <img src="/resources/images/tour/가평레일바이크2.jpg" alt="Image 5">
        <span class="image-caption">가평 레일바이크</span>
    </div>
    </a> &ensp;
    <a href="JadeGarden.do">
     <div style="width : 150px; height: 100px; border : 2px solid white;" class="image-container">
        <img src="/resources/images/tour/제이드가든3.jpg" alt="Image 1">
        <span class="image-caption">제이드가든</span>
    </div>
    </a> &ensp;
    <a href="Jara.do">
     <div style="width : 150px; height: 100px; border : 2px solid black;" class="image-container">
        <img src="/resources/images/tour/자라섬3.jpg" alt="Image 1">
        <span class="image-caption">자라섬</span>
    </div>
    </a> 	
</div>

	     <script src="/resources/js/script3.js"></script>
     <script src="/resources/js/script4.js"></script>
     <script src="/resources/js/tour.js"></script>
     <br><br>
     <%@include file ="../footer.jsp" %>
	<div id="result"></div>
</body>
</html>