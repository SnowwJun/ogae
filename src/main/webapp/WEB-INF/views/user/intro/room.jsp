<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="resource/css/home.css"/>
<link type="text/css" rel="stylesheet" href="/resources/include/css/builder/swiper.min.css"/>
<script src="/resources/include/jscript/swiper.min.js"></script>
<script src="/resources/js/home.js"></script>
<!-- owl carousel -->
<link type="text/css" rel="stylesheet" href="/resources/include/css/owl/owl.carousel.min.css">
<link type="text/css" rel="stylesheet" href="/resources/include/css/owl/owl.them.default.min.css">
<script type="text/javascript" src="/resources/include/jscript/owl/owl.carousel.min.js"></script>

</head>
<body>
<div class="room_title">
	<h3 class="TRAN">ROOMS</h3>
	<p class="txt TRAN">여기오개의 편안한 휴식 제공하는 객실</p>
	<a class="btn_rooms" href="rooms.do">VIEW MORE
		<i class="fa-solid fa-chevron-right fa-sm"></i>
	</a>
	<div class="rooms_wrap">
		<div class="itemList_wrap">
			<ul id="test">
				<c:forEach var="room" items="${userRoomList}">

					<li><c:choose>
							<c:when test="${not empty roomImgList}">
								<div class="room_img">
									<c:set var="firstImageFound" value="false" />
									<c:forEach var="roomImg" items="${roomImgList}">
										<c:if
											test="${roomImg.room_idx eq room.room_idx and not firstImageFound}">
											<a
												href="roomDetail.do?room_idx=${room.room_idx}&room_item_idx=${room.room_item_idx}">
												<img
												src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/${roomImg.img_path}">
												<span class="image-caption">자세히 보기</span>
												<div class="overlay"></div>
											</a>
											<c:set var="firstImageFound" value="true" />
										</c:if>
									</c:forEach>
								</div>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>

						<div class="content">
							<div class="eng">${room.room_name}</div>
							<div class="vertical-line"></div>
							<div class="txt">
								${room.person_num}인형 <span>(${room.room_category})</span>&nbsp;
								<p>최대 ${room.person_num}인, 강아지 최대 ${room.dog_num}마리</p>
							</div>
						</div>
						<button id="button" method="get" action="">예약하기</button></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div> 
</body>
</html>