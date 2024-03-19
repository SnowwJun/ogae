<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간예약</title>
<link rel="stylesheet" href="resources/calendar/css/calendar.css">
<link rel="stylesheet" href="resources/calendar/css/reserCalendar.css">
<link rel="stylesheet" href="resources/calendar/css/reset.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/calendar/js/reserCalendar.js"></script>
</head>
<body>
	<div class="reserWrap" id="contents">
		<div class="reserContainer">
			<ul class="reserTabMenu">
				<li class="active">
					<a href="reserCalender.do" target="loadPage" id="tab1">예약현황</a>
				</li>
				<li>
					<a href="reserApply.do" target="loadPage" id="tab2">예약하기</a>
				</li>
				<li>
					<a href="reserCheck.do" target="loadPage">예약확인 및 취소</a>
				</li>
				<!-- 
				<li id="adminLogin">
					<a class="login" onclick="window.open('login.ado', '_blank', 'width=800, height=600');">관리자</a>
				</li>
				 -->
			</ul>
		</div>
		<iframe id="loadPage" name="loadPage" src="reserCalender.do" width="100%" height="850px" frameborder="0"></iframe>
	</div>
</body>
<script>

</script>
</html>