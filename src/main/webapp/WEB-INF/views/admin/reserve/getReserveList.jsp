<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link type="text/css" rel="stylesheet" href="/resources/css/admin/style.css"/>
<!-- datepicker -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>Insert title here</title>
</head>
<body> 
<div class="container">
	<section>
		<h1>예약 관리</h1>
	</section>
	<section class="search m1">
		<article>
			<select id="selectBox">
				<option value="rsvDate">예약일자</option>
				<option value="rsvNum">예약번호</option>
				<option value="rsvName">예약자명</option>
				<option value="rsvPhone">전화번호</option>
				<option value="rsvRoom">객실정보</option>
				<option value="rsvPayment">결제수단</option>
				<option value="rsvState">결제상태</option>
			</select>
			<article id="searchBox"></article>
			<input type="submit" value="검색"/>
		</article>
	</section>
	<div class="dataTable">
		<div class="dataInfo m1">
			<table class="rsvList">
				<thead>
					<tr>
						<th>예약번호</th>
						<th>예약자명</th>
						<th>전화번호</th>
						<th>예약일자</th>
						<th>객실정보</th>
						<th>결제정보</th>
						<th>예약삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2023101113330112</td>
						<td>권유진</td>
						<td>010-1111-1111</td>
						<td>2023-11-04<br/>~2023-11-05</td>
						<td>1호실</td>
						<td>무통장/완료</td>
						<td><input type="button" value="예약삭제"/></td>
					</tr>
					<tr>
						<td>2023101113330112</td>
						<td>권유진</td>
						<td>010-1111-1111</td>
						<td>2023-11-04<br/>~2023-11-05</td>
						<td>2호실</td>
						<td>카드/완료</td>
						<td><input type="button" value="예약삭제"/></td>
					<tr>
					<tr>
						<td>2023101113330112</td>
						<td>권유진</td>
						<td>010-1111-1111</td>
						<td>2023-11-04<br/>~2023-11-05</td>
						<td>3호실</td>
						<td>무통장/미완료</td>
						<td><input type="button" value="예약삭제"/></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>
<script>
	$("#selectBox").on("change", function(){
		var selVal = $("#selectBox").val();
		if(selVal == "rsvDate") {
			$("#searchBox").replaceWith("<article id='searchBox'><input type='text' id='startDate'/> ~ <input type='text' id='endDate'/></article>");	
		}else if (selVal == "rsvPayment") {
			$("#searchBox").replaceWith("<article id='searchBox'><select id='searchKeyword'><option value='card'>신용카드</option><option value='account'>무통장입금</option></select></article>");
		} else if (selVal == "rsvState") {
			$("#searchBox").replaceWith("<article id='searchBox'><select id='searchKeyword'><option>완료</option><option>미완료</option></select></article>");
		} else if (selVal == 'rsvRoom') {
			$("#searchBox").replaceWith("<article id='searchBox'><select id='searchKeyword'><option>1호실</option><option>2호실</option><option>3호실</option></select></article>");
		} else {
			$("#searchBox").replaceWith("<article id='searchBox'><input type='text' id='searchKeyword' placeholder='검색 내용 입력'/></article>")
		}
	}).trigger("change");
	
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
	});
	
</script>
