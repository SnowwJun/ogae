<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resources/css/admin/style.css"/>
<!-- datepicker -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- timepicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<section>
		<h1>예약 정보</h1>
	</section>
	<section>
		<table class="type01">
			<tr>
				<th scope="row">예약번호</th>
				<td>예약번호DB</td>
			</tr>
			<tr>
				<th scope="row">예약일자</th>
				<td><input type="text" id="startDate" value="2023-10-30"/> ~ <input type="text" id="endDate" value="2023-10-30"/></td>
			</tr>
			<tr>
				<th scope="row">예약자명</th>
				<td><input type="text" value="예약자명DB"/></td>
			</tr>
			<tr>
				<th scope="row">생년월일</th>
				<td><input type="text" value="생년월일DB"/></td>
			</tr>
			<tr>
				<th scope="row">연락처</th>
				<td>
					<select>
						<option value="010">010</option>
						<option value="02">02</option>
						<option value="031">031</option>						
					</select>
					- <input type="text" value="전화번호DB"/>
					- <input type="text" value="전화번호DB"/>
				</td>
			</tr>
			<tr>
				<th scope="row">이메일</th>
				<td><input type="text" value="이메일DB"/></td>
			</tr>
			<tr>
				<th scope="row">도착예상시간</th>
				<td><input type="text" id="arrTime" value="14:00"/></td>
			</tr>
			<tr>
				<th scope="row">예약요청사항</th>
				<td><textarea rows="5">요청사항DB</textarea></td>
			</tr>
			<tr>
				<th scope="row">결제정보</th>
				<td>
					<input type="radio" id="card" name="payment" value="card">신용카드
					<input type="radio" id="account" name="payment" value="account">무통장입금
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="예약수정"/>&nbsp;&nbsp;&nbsp;
					<input type="button" value="예약취소"/>&nbsp;&nbsp;&nbsp;
					<input type="button" value="예약목록"/>&nbsp;&nbsp;&nbsp;
				</td>
			</tr>	
		</table>
	</section>
</div>
</body>
</html>
<script>
	$(function() {
		$.datepicker.setDefaults({
			dateFormat: "yy-mm-dd",
			showMonthAfterYear: true,
			yearSuffix: "년",
			changeYear: true,
			changeMonth: true,
			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토', '일'],
			monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		});
		
		$("#startDate").datepicker();
		$("#endDate").datepicker();
		$("#startDate").datepicker("setDate", "today");
		$("#endDate").datepicker("setDate", "+7D");
		
		$("#arrTime").timepicker({
			timeFormat: "HH:mm",
			interval: 60,
			minTime: "15:00",
			maxHour: 20,
			defaultTime: "15",
			startTime: "15:00",
			dynamic: false,
			dropdown: true
		})
	});
</script>