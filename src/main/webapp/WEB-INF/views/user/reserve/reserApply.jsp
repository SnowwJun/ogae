<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/calendar/css/reset.css">
<link rel="stylesheet" href="resources/calendar/css/calendar.css">
<link rel="stylesheet" href="resources/calendar/css/reserCalendar.css">
<script src="resources/calendar/js/reserApply.js"></script>
<!--script src="resources/calendar/js/reserCalendar.js"></script>-->
<script src="resources/calendar/js/owl.carousel.js"></script>
<link rel="stylesheet" href="resources/calendar/css/owl.carousel.css">
<!-- datepicker -->
<link rel="stylesheet" href="resources/calendar/css/datepicker.min.css">
<script src="resources/calendar/js/datepicker.min.js"></script>
<script src="resources/calendar/js/datepicker.ko.js"></script>

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
</head>
<body>	
<div class="reserWrap" id="contents">
	<div class="reserContainer">
		<div class="reserPeriod">
			<h3>숙박기간</h3>
			 
			<div class="reserPeriodLayer">
				<div class="dateChoice">
					<span>날짜선택</span>
				</div>
				<div class="checkDay">
					<span class="checkIn">CHECK IN</span>
					<span class="checkInDate"></span>
					<span class="checkOut">CHECK OUT</span>
					<span class="checkOutDate"></span>
				</div>
				<div class="selPeriod">
					<span></span>
				</div>
			</div>
			<div class="periodPop commPop" style="display: none;">
				<div class="popCon" id="popup-period-calendar">
					<div class="calendar">
						<div class="chkInDate"><strong>입실일</strong></div>
						<div class="chkOutDate"><strong>퇴실일</strong></div>
					</div>
					<div class="setDateLayer">
						<span class="title">입실일 선택 후 → 퇴실일 선택 </span>
						<div class="text">
							<span class="setDateIn"></span>
							<span class="setDateOut"></span>
							<span class="setDay"></span>
						</div>
					</div>
					<span class="popClose">
						<input type="button" value="확인" class="btnOK">
						<input type="button" value="취소" class="btnCancel">
					</span>
				</div>
			</div>
		</div>
		<div class="roomChoice">
			<h3>객실선택</h3>
			<ul class="roomList"></ul>
			<!-- 객실 상세 정보 & 이미지 -->
			<div class="roomPop commPop" style="display: none;">
				<div class="popCon">
					<p class="title">{객실이름}</p>
					<div id="room_photo_list" class="owl-carousel owl-theme owl-loaded owl-drag owl-hidden">
						<div class="owl-stage-outer">
							<div class="owl-stage"></div>
						</div>
						<div class="owl-dots disabled"></div>
					</div>
					<span onclick="closePopup();" class="popClose">
						<img alt="팝업닫기" src="resources/calendar/img/close.jpg">
					</span>
				</div>
			</div>
		</div>
		<!-- 
		<div class="optionChoice">
			<h3>옵션선택</h3>
			<ul>
				<li>
					<div class="optionCon">
						<p class="optionTit">{옵션정보타이틀}</p>
						<p class="optionTxt">{옵션설명}</p>
						<span class="optionMore">MORE ></span>
					</div>
					<div class="commNum optionNum">
						<div class="numBtn">
							<button type="button" id="option-{optionID}" value="-" data-field="quantity" class="button-minus">
								<img src="resources/calendar/img/minus.jpg" alt="-">
							</button>
							<span class="number">
								<input type="text" id="{옵션id}-value-{optionID}"  step="1" max name="quantity" value="0" class="quantity-field baby">
							</span>
							<button type="button" id="option-{optionID}" value="+" data-field="quantity" class="button-plus">
								<img src="resources/calendar/img/plus.jpg" alt="-">
							</button>
						</div>
					</div>
					<div class="optionPrice commPrice">
						<button type="button" id="btn{옵션id}" class="reserBtn">선택하기</button>
						<span class="price">
							<strong class="sel">{옵션가격}</strong>원
						</span>
					</div>
				</li>
			</ul>
			<div class="optionPop commPop">
				<div class="popCon">
					<p class="title"></p>
					<p class="text"></p>
					<span class="popClose">
						<img src="resources/calendar/img/close.jpg" alt="팝업닫기">
					</span>
				</div>
			</div>
		</div>
		-->
		<div class="totalPrice">
			<span class="price">
				총 결제금액 : <strong></strong>원
			</span>
			<button type="submit" class="payment">결제하기</button>
		</div>
		<div class="alertForm commAlert">
			<div class="popCon">
				<p id="alert-text" class="txt">여긴 뭘까</p>
				<button type="button" class="checkBtn">확인</button>
			</div>	
		</div>
		<div class="confirmForm commAlert" style="display: none;">
			<div class="popCon">
				<p id="apply-text" class="txt">
					{사용자 확인 내용 출력}
					ex) 숙박기간 /	객실명 / 인원
					<br><br><br>
					결제를 진행하시겠습니까? 선택해주세요.
				</p>
				<button type="button" class="checkBtn">확인</button>
				<button type="button" class="cancelBtn">취소</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>