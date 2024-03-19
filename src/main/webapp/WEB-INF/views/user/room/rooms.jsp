<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기오개</title>
<link rel="stylesheet" type="text/css" href="/resources/css/user/rooms.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function () {
    // 서버에서 이미지 정보를 비동기적으로 가져오는 함수
    function loadImages() {
        $.ajax({
            type: 'GET',
            url: '/rooms.do', // 컨트롤러의 URL
            dataType: 'json',
            success: function (data) {
                
                var imageContainer = $('#imageContainer');
                console.log('이미지:', imageContainer);
                
                //이미지 데이터 순회하면서 동적으로 이미지 생성 추가
                for (var i = 0; i < data.length; i++) {
                    var imagePath = data[i].img_path;
                    
                // 이미지 경로가 존재하는 경우에만 이미지를 설정
                if (imagePath) {
                	 var imageElement = $('<img>').attr('src', imagePath);
                     imageContainer.append(imageElement);
                } else {
                    console.warn('이미지 경로가 존재하지 않습니다.');
                }
            }
            error: function () {
                console.error('이미지를 불러오는데 실패했습니다.');
            }
        });
    }

    // 페이지 로딩 시 이미지를 불러오도록 호출
    loadImages();
});
</script>
</head>

<body id="page_top">
	<%@ include file="/WEB-INF/views/user/header.jsp"%>

	<div class="main-wrap main-swiper">
		<div class="main-img" ></div>

		<div class="text-wrap">
			<h2>ROOMS</h2>
		</div>
	</div>
	

	<br>
	<br>
<!-- 	<div> -->
<!-- 		<p class="subtext">'여기오개'의 객실을 소개합니다.</p> -->
<!-- 	</div> -->
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


	<br>
	<br>
	<br>
	<%@ include file="../footer.jsp"%>
</body>
</html>