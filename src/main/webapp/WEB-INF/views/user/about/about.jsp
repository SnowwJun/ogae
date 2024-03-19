<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ABOUT</title>
<link type="text/css" rel="stylesheet" href="/resources/css/common.css"/>
<link rel="stylesheet" href="/resources/css/home.css"/>
<link rel="stylesheet" href="/resources/css/user/about.css"/>
<script type="text/javascript" src="/resources/include/jscript/common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- MAP -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2eadae9b88aa3943dfad4b0009b01861"></script>
<script type="text/javascript" src="/resources/js/map.js"></script>
</head>
<body>
<header><%@ include file="../header.jsp" %></header>
<div>
	<div class="cpage about1" id="about1">
		<!-- 슬라이드 펜션 이미지 -->
		<%@ include file="slide.jsp" %>
	</div>
	<div class="cpage about2" id="about2">
		<div class="about2_wrap">
			<div class="about2_slogan">
				<h5>ABOUT US</h5>
				<h6>반려견과 함께 추억을 만들어가는 "여기오개"</h6>
				<div class="txt">
					<p>사랑하는 반려견과 함께 갖는 힐링의 시간</p>
					<p>반려견들이 마음껏 뛰어놀 수 있도록 울타리로 안전을 더하고 한여름 시원한 물놀이를 즐길 수 있는 풀장과</p>
					<p>실내 바비큐를 드시며 아이들이 뛰어노는 모습을 보실수 있게 준비되어 있습니다.</p>
					<p>&nbsp;</p>
					<p>바닥은 인조잔디로 쿠션감과 슬개골탈구 방지를 위한 미끄러움을 최소화한 국내생산 제품으로 설치되어 있습니다.</p>
					<p>&nbsp;</p>
					<p>소중한 시간을 더 아름답게 만들어 드리기 위해 최선을 다해 준비하였습니다.</p>
					<p>반려견과 함께 행복한 추억 하나 만들어가세요<i class="fa-solid fa-heart"></i></p>
				</div>
			</div>
		</div>
	</div>
	<div class="cpage about3" id="about3">
		<div class="about3_wrap">
			<div class="about3_top">
				<div class="about3_imgWrap">
					<div class="loader tImg" style="background-image:url('https://ogae-dog.s3.ap-northeast-2.amazonaws.com/main/slides/13.jpg')"></div>
					<div class="loader tImg" style="background-image:url('https://ogae-dog.s3.ap-northeast-2.amazonaws.com/main/slides/15.jpg')"></div>
				</div>
				<div class="about3_imgWrap">
					<div class="loader bImg" style="background-image:url('https://ogae-dog.s3.ap-northeast-2.amazonaws.com/main/slides/14.jpg')"></div>
					<div class="loader bImg" style="background-image:url('https://ogae-dog.s3.ap-northeast-2.amazonaws.com/main/slides/16.jpg')"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="cpage about4" id="about4">
		<div class="about4_wrap clearfix">
			<div class="about4_slogan">
				<h5>MAP & LOCATION</h5>
				<h6>'여기오개'로 어서오개</h6>
			</div>
			<div class="about4_map" id="map">
				<%--@ include file="map.jsp"--%>
			</div>
			<div class="about4_info">
				<dl>
					<dt><i class="fa-solid fa-map-location-dot"></i>주소</dt>
					<dd><p>경기도 가평군 가평읍 호반로 2116-39</p></dd>
				</dl>
				<dl>
					<dt><i class="fa-solid fa-phone-volume"></i>전화</dt>
					<dd><p><span style="margin-right:10px"><a href="tel:010-5324-2514">010-5324-2514</a></span></p></dd>
				</dl>
				<dl>
					<dt><i class="fa-solid fa-car-side"></i>자가용으로 오는 방법</dt>
					<dd class="traffic-auto-conts">
						<p>
							<strong>★네비게이션 주소</strong>
							<br>경기도 가평군 가평읍 호반로 2116-39
						</p>
					</dd>
				</dl>
				<!-- 
				<dl>
					<dt><i class="fa-solid fa-van-shuttle"></i>대중교통으로 오시는 방법</dt>
					<dd>
						<p>
							<strong>버스</strong>
							<br>종로4가.종묘(중) 하차 후 도보 347m<br>
							<strong>지하철</strong>
							<br>1, 3, 5호선 종로3가역 9번 출구에서 3m
						</p>
					</dd>	
				</dl>
			 -->
			</div>
		</div>
	</div>
</div>
<footer><%@ include file="../footer.jsp" %></footer>
</body>
</html>
<script>
	$(document).ready(function() {
		if('${tab}' != '') {
			document.getElementById('${tab}').scrollIntoView(true);
		}
	});
</script>
