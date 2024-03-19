<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기오개</title>
<link rel="stylesheet" href="/resources/css/user/reserve.css"/>
<link rel="stylesheet" href="/resources/css/common.css"/>
<link rel="stylesheet" href="/resources/css/home.css"/>
<script type="text/javascript" src="/resources/include/jscript/common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- favicon -->
<link rel="icon" href="resources/images/favicon_black.png" type="image/x-icon">
</head>
<body>
<header><%@ include file="../header.jsp" %></header>
<div class="all_wrap">	
	<div class="cpage reserve1" id="reserve1">
		<div class="reserve1_wrap">
			<div class="loader" style="background-image:url(https://ogae-dev.s3.ap-northeast-2.amazonaws.com/main/slides/15.jpg);"></div>
			<div class="reserve1_slogon">RESERVATION</div>
		</div>
	</div>
	<!-- 
	<div class="cpage reserve2" id="reserve2">
		<div class="reserve2_wrap">
			<a class="tab" href="reserveMain.do">실시간예약</a>
			<a class="tab" href="#">요금가이드</a>
		</div>
	</div>
	 -->
	<div class="cpage reserve3" id="reserve3">
		<div class="reserve3_wrap tab1 active">
			<!-- <iframe src="reserTabMenu.jsp"  style="width:100%; height:700px; border: none;"></iframe> -->
			<%@ include file="reserTabMenu.jsp" %>
		</div>
	</div>
</div>
<footer><%@ include file="../footer.jsp" %></footer>
</body>
</html>

