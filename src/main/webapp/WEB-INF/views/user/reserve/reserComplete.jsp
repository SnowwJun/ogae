<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기오개</title>
<link rel="stylesheet" href="resources/calendar/css/reset.css">
<link rel="stylesheet" href="resources/calendar/css/reserCalendar.css">
<link rel="stylesheet" href="resources/calendar/css/calendar.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/calendar/js/index.global.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<!-- favicon -->
<link rel="icon" href="resources/images/favicon_black.png" type="image/x-icon">
</head>
<body>
<div class="payCheckInfo selRoomInfo commInfo">
	<h3>고객님의 예약정보 입니다.</h3>
	<div class="infoGroup">
		<ul class="infoTit">
			<li>펜션명 : 여기오개</li>
			<li>예약번호 : ${reserno}</li>
		</ul>
		<ul class="infoTxt">
			<li class="roomInfo">
				<span class="tit">예약자</span>
				<span class="name">${name}</span>
			</li>
			<li>
				<span class="tit">연락처</span>
				<span>${phone}</span>
			</li>
			<li>
				<span class="tit">비상연락처</span>
				<span>
					<c:if test="${ephone ne null}">
						<c:out value="${ephone}"/>
					</c:if>
				</span>
			</li>
			<li>
				<span class="tit">이메일</span>
				<span>
					<c:if test="${email ne null}">
						<c:out value="${email}"/>
					</c:if>
				</span>
			</li>
		</ul>
	</div>
</div>
<div class="selRoomInfo commInfo">
	<h3>객실 목록</h3>
	<div class="infoGroup">
		<ul class="infoTit">
			<li>객실명</li>
			<li>이용날짜</li>
			<li>예약인원</li>
			<li>객실요금</li>
			<li>추가요금</li>
			<li>결제금액</li>
		</ul>
		<ul class="infoTxt">
			<li class="roomInfo">
				<span class="name">${roomname}</span>
			</li>
			<li class="impor">${indate}</li>
			<li>성인${reser_adult} / 아동${reser_child} / 유아${reser_baby}</li>
			<li>
				<div class="price">${roomprice}원</div>
				<!-- 추가요금 -->
				<div class="price">
					<c:if test="${addprice eq null}">
						0원
					</c:if>
					<c:if test="${addprice ne null}">
						${addprice}원
					</c:if>
				</div>
			</li>
			<li></li>
			<li class="impor">${total}원</li>
		</ul>
	</div>
	<table class="payTable">
		<caption>결제정보</caption>
		<colgroup>
			<col style="width: 16%">
			<col style="width: 84%">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">결제금액</th>
				<td><strong>${payprice}</strong></td>
			</tr>
			<tr>
				<th scope="row">결제방법</th>
				<td class="payWay">카드</td>
			</tr>
			<tr>
				<th scope="row">예약상태</th>
				<td>
					<strong>${paystate}</strong>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr style="text-align: right;">
				<td colspan="2">
					<button type="button" class="confirm">확인</button>
					<button type="button" class="cancel">예약취소</button>
				</td>
			</tr>
		</tfoot>
	</table>
</div>
</body>
</html>