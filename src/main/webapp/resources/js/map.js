/**
 * 카카오 지도 API
 */
 
$(function() {
	var container = document.getElementById("map");
	var options = { 
					center: new kakao.maps.LatLng(37.777659, 127.510118), 
					level: 3,	// 지도 확대 레벨
					mapTypeId : kakao.maps.MapTypeId.ROADMAP	// 지도 종류
				};
	
	// 지도 생성
	var map = new kakao.maps.Map(container, options);
	
	// 지도 마커 생성, 표시
	var marker = new kakao.maps.Marker({
		position : new kakao.maps.LatLng(37.777659, 127.510118),
		map : map	// 마커를 표시할 지도 객체
	});
});		