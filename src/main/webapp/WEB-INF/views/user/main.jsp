<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기오개</title>
<link type="text/css" rel="stylesheet" href="/resources/css/home.css"/>
<link type="text/css" rel="stylesheet" href="/resources/css/user/about.css"/>
<link type="text/css" rel="stylesheet" href="/resources/css/common.css"/>
<script type="text/javascript" src="/resources/include/jscript/common.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- font awsome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- favicon -->
<link rel="icon" href="resources/images/favicon_black.png" type="image/x-icon"></head>
<body>
<div class="all_wrap">
	<%-- header --%>
	<%@ include file="header.jsp" %>
	<!-- 메인 펜션 이미지 -->
	<div id="section1" class="cpgae section1">
		<img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/upload/main/slides/07.jpg" class="w_lay"/>
	</div>
	<%-- 슬라이드 펜션 이미지 --%>
	<div id="section2" class="cpage section2 ANI">
		<%@ include file="about/slide.jsp" %>
	</div>
	<%-- 객실 --%>
	<div id="section3" class="cpage section3 ANI">
		<%@ include file="intro/room.jsp" %>
	</div>
	<%-- 부대 시설 --%>
	<div id="section4" class="cpage section4 ANI">
		<%@ include file="intro/facilities.jsp" %>
	</div>
	<div id="section5" class="cpage section5">
		<img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/main/last.jpg">	
	</div>
	<%-- footer --%>
	<%@ include file="footer.jsp" %>
</div>
</body>
</html>