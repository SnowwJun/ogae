<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기오개-${room.room_name }</title>
<link rel="stylesheet" type="text/css" href="/resources/css/user/roomsub.css">
<link rel="stylesheet" type="text/css" href="/resources/css/user/room_weekly.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function () {
    // 서버에서 이미지 정보를 비동기적으로 가져오는 함수
    function loadImages() {
        $.ajax({
            type: 'GET',
            url: '/roomDetail.do', // 컨트롤러의 URL
            dataType: 'json',
            success: function (data) {
                // 이미지 경로를 가져와서 이미지 태그에 설정
                var imagePath = data.img.path;
                console.log('이미지 경로:', imagePath);

                // 이미지 경로가 존재하는 경우에만 이미지를 설정
                if (imagePath) {
                    $('#roomImage').attr('src', imagePath);
                } else {
                    console.warn('이미지 경로가 존재하지 않습니다.');
                }
            },
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
<body>
	<%@ include file="../header.jsp"%>
	<div class="imageShow">
	<c:forEach var="roomImg" items="${roomImgList}">
	<c:if test="${roomImg.room_idx eq room.room_idx}">
		<div>
			<img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/${roomImg.img_path}" alt="Room Image"">
		</div>
		</c:if>
	</c:forEach>	
	</div>

	<div class="clear">
		<div class="roominfo">
			<div class="left">
				<h1>${room.room_name }</h1>
				<hr>
				<p style="white-space: pre-line;">${room.room_info}</p>
				<p style="font-size: 15px; letter-spacing: -1px; color:gray;">객실 금액: ${room.room_price}원(1박 기준)</p>
			</div>
			<div class="right">
				<p id="roominfo">| 객실정보</p>
				<table style="font-size: 17px; line-height: 2;">
				<tr>
				<th style="width: 60%; text-align: left;">수용인원</th>
				<td>최대 ${room.person_num}인</td>
				</tr>
				<tr>
				<th style="width: 60%; text-align: left;">반려견 수</th>
				<td>최대 ${room.dog_num}마리</td>
				</tr>
				</table>
				
				<p id="roominfo" style="margin-top: 50px;">| 객실형태</p>
				<table style="font-size: 17px; line-height: 2;">
				<tr>
				<th style="width: 21%; text-align: left;">유형/형태</th>
				<td>${room.room_category}</td>
				</tr>
				<tr>
				<th style="width: 21%; text-align: left;">구비시설 </th>
			 	    <td> 
			 	        ${roomItemIdx}<br/> 
			 	    </td> 
				</tr>
				
				</table>
				
				<p id="roominfo" style="margin-top: 50px;">| 주의사항</p>
				<table style="font-size: 17px; line-height: 2;">
				<tr style="white-space: pre-line;">${room.room_guide}</tr>
				</table>
				
				<p id="roominfo" style="margin-top: 50px;">| 기간안내</p>
				<table style="font-size: 17px; line-height: 2;">
				<tr>
				<th style="width: 23%; text-align: left;">주중</th>
				<td>일요일~목요일(금요일,공휴일 전날 : 요금 별도 표시)</td>
				</tr>
				<tr>
				<th style="width: 20%; text-align: left;">주말</th>
				<td>토요일,공휴일 전날</td>
				</tr>
				</table>

			</div>
		</div>
	</div>
	<br>
	<div class="clear"></div>
	<br>
	<br>
	<!-- HTML 부분에 주간 달력을 표시할 위치 -->
	<!-- weekly-calendar 요소 위치 -->
	<div id="weekly-calendar">
		<table class="calendar-table">
			<thead>
				<tr>
					<th id="table_first">객실
						<p>(기준/최대)</p>
					</th>
					<th>일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th id="table_first">${room.room_name }
						<p id="table_text">(2/${room.person_num}명)</p>
					</th>
					<td>예약완료</td>
					<td>예약완료</td>
					<td>예약가능</td>
					<td>예약완료</td>
					<td>예약완료</td>
					<td>예약완료</td>
					<td>예약완료</td>
				</tr>
			</tbody>
		</table>
		<div class="center-button">
			<button id="bookbutton" method="get" action="">실시간 예약하기</button>
		</div>
	</div>
	<div class="clear"></div>
	<hr>
	<!-- 다른객실 -->
	<div class="other_rooms">
		<h3>Other Rooms</h3>
		<p>사랑하는 반려견과 함께 편안하게 휴식을 제공하는 '여기오개'의 다른 객실을 둘러보세요</p>
		<div class="itemList_wrap">
			<div class="swiper-container">
				<ul>					
			
			
 <c:forEach var="otherRoom" items="${otherRooms}">
                    <li>
                        <c:choose>
                            <c:when test="${not empty roomImgList}">
                                <div class="room_img">
                                    <c:set var="firstImageFound" value="false" />
                                    <c:forEach var="roomImg" items="${roomImgList}">
                                        <c:if test="${roomImg.room_idx eq otherRoom.room_idx and not firstImageFound}">
                                            <a href="/roomDetail.do?room_idx=${otherRoom.room_idx}&room_item_idx=${otherRoom.room_item_idx}">
                                                <img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/${roomImg.img_path}" alt="${otherRoom.room_name}">
                                                <div class="content">
                                                    <div class="eng">${otherRoom.room_name}</div>
                                                    <div class="txt">
                                                        ${otherRoom.person_num}인형 <span>(${otherRoom.room_category})</span>
                                                    </div>
                                                    <button id="button" method="get" action="">자세히보기</button>
                                                </div>
                                            </a>
                                            <c:set var="firstImageFound" value="true" />
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <!-- 이미지가 없을 때의 처리 -->
                            </c:otherwise>
                        </c:choose>
                    </li>
                </c:forEach>

			</ul>
		</div>
	</div>
	</div>



	<script src="/resources/js/imageShow.js"></script>
	<br>
	<br>
	<br>
	<%@ include file="../footer.jsp"%>
</body>
</html>